# Variables for Airtable API
apiUrl = 'https://api.airtable.com/v0/appMtIlikMxVLjN4K/'
apiKey = '?api_key=keyxAIb6oLhX6lAp2'

clientsTable = 'tblChr8nk7eOaEc2I'
hacksTable = 'tblQoCy66y3WRFG3i'
contributorsTable = 'tblxFY7eQBVeB6NEV'


# Instantiate Moment.js
now = moment()


$(document).ready ->

  # Clients
  $.ajax
    url: apiUrl + clientsTable + apiKey
    type: 'GET'
    dataType: 'json'
    success: (result) ->
      window.clients = result.records

  # Contributors
  $.ajax
    url: apiUrl + contributorsTable + apiKey
    type: 'GET'
    dataType: 'json'
    success: (result) ->
      contributors = result.records

      # Hacks - Nested so it doesn't execute before the contributors stuff, which is relies on
      $.ajax
        url: apiUrl + hacksTable + apiKey + '&sortField=Client&sortDirection=asc'
        type: 'GET'
        dataType: 'json'
        success: (result) ->
          obj = result.records

          # For each hack
          $.each obj, ->

            # Fetch template
            template = document.getElementById('hack').content

            # Set content
            $(template).find('.hack__client').text(this.fields.Client)
            $(template).find('.hack__status').text(this.fields.Status)
            $(template).find('.hack__code').text(this.fields.Code)
            $(template).find('.hack__description').text(this.fields.Description)
            
            if this.fields.Link
              $(template).find('.hack__link').text(this.fields.Link)

            relativeDate = moment(this.fields.Date).fromNow()
            $(template).find('.hack__date').text(relativeDate)
            $(template).find('.hack__date').attr('datetime', this.fields.Date)


            # Client
            hackClientId = this.fields.Client.toString()

            for i of clients
              if clients[i].id == hackClientId
                hackClient = clients[i].fields.Name

            $(template).find('.hack__client').text(hackClient)

            if (this.fields.Version)
              $(template).find('.hack__client').append( ' (' + this.fields.Version + ')')


            # Contributors
            hackContributorId = this.fields.Contributor.toString()

            for i of contributors
              if contributors[i].id == hackContributorId
                root = contributors[i].fields

                contributorName = root.Name
                contributorEmail = root.Email
                contributorSubmissions = root.Hacks.length

                contributorElement = $(template).find('.hack__contributor')
                contributorNameElement = $(template).find('.hack__contributor-name')
                
                $(template).find('.hack__contributor-submissions').text(contributorSubmissions)

                if root.Website
                  contributorWebsite = root.Website
                
                if contributorWebsite == undefined
                  contributorNameElement.text(contributorName)
                  contributorElement.remove()
                else
                  contributorElement.text(contributorName)
                  contributorElement.attr('href', contributorWebsite)


            # Colour for status badges
            statusText = this.fields.Status.toString()
            statusElement = $(template).find('.hack__status')

            if statusText == 'Working'
              $(statusElement).removeClass('hack__status--unknown')
              $(statusElement).removeClass('hack__status--deprecated')
              $(statusElement).addClass('hack__status--working')
            else if statusText == 'Deprecated'
              $(statusElement).removeClass('hack__status--unknown')
              $(statusElement).removeClass('hack__status--working')
              $(statusElement).addClass('hack__status--deprecated')
            else if statusText == 'Unknown'
              $(statusElement).removeClass('hack__status--working')
              $(statusElement).removeClass('hack__status--deprecated')
              $(statusElement).addClass('hack__status--unknown')


            # Add it to the DOM
            document.querySelector('.hacks').appendChild(document.importNode(template, true))


  # Deprecated hacks toggle
  $('.controls__deprecated').click ->
    deprecatedHack = $('.hack__status--deprecated').closest('.hack')

    if $(deprecatedHack).is(':visible')
      deprecatedHack.slideUp()
      $(this).text('Show Deprecated')
      $(this).addClass('controls__deprecated--active')
    else
      deprecatedHack.slideDown()
      $(this).text('Hide Deprecated')
      $(this).removeClass('controls__deprecated--active')

  # Input filter
  $('.controls__filter').keyup ->
    valThis = $(this).val().toLowerCase()
    console.log valThis
    $('.hack__client').each ->
      text = $(this).text().toLowerCase()
      if text.indexOf(valThis) == 0 then $(this).closest('.hack').slideDown() else $(this).closest('.hack').slideUp()



# Variables for Airtable API
apiUrl = 'https://api.airtable.com/v0/appMtIlikMxVLjN4K/'
apiKey = '?api_key=keyxAIb6oLhX6lAp2'

clientsTable = 'tblChr8nk7eOaEc2I'
hacksTable = 'tblQoCy66y3WRFG3i'
contributorsTable = 'tblxFY7eQBVeB6NEV'


# Instantiate Moment.js
now = moment()


$(document).ready ->

  # Hacks
  $.ajax
    url: apiUrl + hacksTable + apiKey
    type: 'GET'
    dataType: 'json'
    success: (result) ->

      obj = result.records
      console.log obj.length


      # For each hack
      $.each obj, ->

        # Fetch template
        template = document.getElementById('hack').content

        # Set content
        $(template).find('.hack__client').text(this.fields.Client)
        $(template).find('.hack__status').text(this.fields.Status)
        $(template).find('.hack__code').text(this.fields.Code)
        $(template).find('.hack__description').text(this.fields.Description)
        
        if this.fields.Link == undefined
          $(template).find('.hack__link').text()
        else
          $(template).find('.hack__link').text(this.fields.Link)

        relativeDate = moment(this.fields.Date).fromNow()
        $(template).find('.hack__date').text(relativeDate)
        $(template).find('.hack__date').attr('datetime', this.fields.Date)


        # Contributors
        hackContributorId = this.fields.Contributor

        $.ajax
          url: 'https://api.airtable.com/v0/appMtIlikMxVLjN4K/' + hacksTable + '/' + hackContributorId + apiKey
          type: 'GET'
          async: false
          dataType: 'json'
          success: (result) ->
            contributorElement = $(template).find('.hack__contributor')
            contributorNameElement = $(template).find('.hack__contributor-name')

            contributorName = result.fields.Name
            contributorEmail = result.fields.Email

            if result.fields.Website
              contributorWebsite = result.fields.Website
            
            if contributorWebsite == undefined
              contributorNameElement.text(contributorName)
              contributorElement.remove()
            else
              contributorElement.text(contributorName)
              contributorElement.attr('href', contributorWebsite)


        # Add it to the DOM
        document.querySelector('.hacks').appendChild(document.importNode(template, true))
apiUrl = 'https://api.airtable.com/v0/appMtIlikMxVLjN4K/'
apiKey = '?api_key=keyxAIb6oLhX6lAp2'

clientsTable = 'tblChr8nk7eOaEc2I'
hacksTable = 'tblQoCy66y3WRFG3i'
contributorsTable = 'tblxFY7eQBVeB6NEV'

# Http = new XMLHttpRequest()
# url = apiUrl + contributorsTable + apiKey
# Http.open("GET", url)
# Http.send()
# Http.onreadystatechange = ->
#   obj = Http.responseText
#   console.log obj

obj = []

$(document).ready ->

  current = 0

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

        # console.log this.fields.Client
        # console.log this.fields.Code
        # if this.fields.Description != undefined
        #   console.log this.fields.Description
        # if this.fields.Link != undefined
        #   console.log this.fields.Link
        # console.log this.fields.Contributor
        # console.log this.fields.Date
        # console.log this.fields.Status


        # Fetch template
        template = document.getElementById('hack').content

        # Set content
        $(template).find('.hack__client').text(this.fields.Client)
        $(template).find('.hack__code').text(this.fields.Code)
        $(template).find('.hack__description').text(this.fields.Description)
        
        if this.fields.Link == undefined
          $(template).find('.hack__link').text()
        else
          $(template).find('.hack__link').text(this.fields.Link)
        
        $(template).find('.hack__contributor').text(this.fields.Contributor)
        $(template).find('.hack__date').text(this.fields.Date)
        $(template).find('.hack__status').text(this.fields.Status)

        # Add it to the DOM
        document.querySelector('.hacks').appendChild(document.importNode(template, true))



  # Contributors
  # $.ajax
  #   url: apiUrl + contributorsTable + apiKey
  #   type: 'GET'
  #   dataType: 'json'
  #   success: (result) ->

  #     obj = result.records
  #     console.log obj.length

  #     # For each contributor
  #     $.each obj, ->
  #       console.log this.fields.Name
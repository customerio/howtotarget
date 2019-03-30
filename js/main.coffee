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
        console.log this.fields.Client
        console.log this.fields.Code
        if this.fields.Description != undefined
          console.log this.fields.Description
        if this.fields.Link != undefined
          console.log this.fields.Link
        console.log this.fields.Contributor
        console.log this.fields.Date
        console.log this.fields.Status

        $('.hack__client').text(this.fields.Client)
        $('.hack__code').text(this.fields.Code)
        $('.hack__description').text(this.fields.Description)
        $('.hack__link').text(this.fields.Link)
        $('.hack__contributor').text(this.fields.Contributor)
        $('.hack__date').text(this.fields.Date)
        $('.hack__status').text(this.fields.Status)


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
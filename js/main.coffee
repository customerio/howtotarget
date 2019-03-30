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

$(document).ready ->
  $.ajax
    url: apiUrl + contributorsTable + apiKey
    type: 'GET'
    dataType: 'json'
    success: (result) ->

      console.log result
      obj = result

      $('.contributor__name').text(obj.records[0].fields.Name)
      $('.contributor__email').text(obj.records[0].fields.Email)
      $('.contributor__website').text(obj.records[0].fields.Website)
Feature: Manage General Price
  I login website and add General Price for system
  Background:
    Given The mongodb is connected
    And The collection "AffiliateGeneralRate" is empty
    And The collection "UsersSystem" is empty
    And The collection "AffiliateUserRole" is empty
    Given a list of documents in collection "UsersSystem", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"userId":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]},"firstName": {"enum": ["local"]}, "isActive": {"enum": [true]}} |
    And an api token after logined with username "local" and password "password"

  Scenario: 01: I  create affiliate General Price  success
    Given a list of documents in collection "AffiliateGeneralRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "rateInfo": {"name": {"enum": ["General 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
    When I send request to api "/api/generalPrices" with request body
      | requestBody                                                                       |
      | {"rateInfo":{"name":"abc","currency":{"symbol":"$","iso":"USD"},"priceType":"sellPrice"},"type":"General","airport":{"fromAirport":0,"toAirport":0,"fromAirportActive":false,"toAirportActive":false},"meetDriver":{"onCurb":0,"meetDrv":0},"rushHour":false,"rushHours":[],"heavyTraffic":{"enable":false,"surcharge":0},"tollFee":false,"otherFees":{"enable":false,"edit":false,"addNote":false},"tax":{"enable":false,"surcharge":0},"tip":{"enable":false,"value":0},"techFee":{"enable":false,"commandCenter":0,"paxApp":0,"webBooking":0},"isActive":true} |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request to api "/api/generalPrices" with request body
      | requestBody                                                                       |
      | {"rateInfo":{"currency":{"symbol":"$","iso":"USD"},"priceType":"sellPrice"},"type":"General","airport":{"fromAirport":0,"toAirport":0,"fromAirportActive":false,"toAirportActive":false},"meetDriver":{"onCurb":0,"meetDrv":0},"rushHour":false,"rushHours":[],"heavyTraffic":{"enable":false,"surcharge":0},"tollFee":false,"otherFees":{"enable":false,"edit":false,"addNote":false},"tax":{"enable":false,"surcharge":0},"tip":{"enable":false,"value":0},"techFee":{"enable":false,"commandCenter":0,"paxApp":0,"webBooking":0},"isActive":true}  |
    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"name is required" }}             |
  Scenario: 02: I  create affiliate General Price  with data validation failed (with data "fromAirport" type number )
    When I send request to api "/api/generalPrices" with request body
      | requestBody                                                                       |
      | {"rateInfo":{"name":"abc","currency":{"symbol":"$","iso":"USD"},"priceType":"sellPrice"},"type":"General","airport":{"fromAirport":"11","toAirport":0,"fromAirportActive":false,"toAirportActive":false},"meetDriver":{"onCurb":0,"meetDrv":0},"rushHour":false,"rushHours":[],"heavyTraffic":{"enable":false,"surcharge":0},"tollFee":false,"otherFees":{"enable":false,"edit":false,"addNote":false},"tax":{"enable":false,"surcharge":0},"tip":{"enable":false,"value":0},"techFee":{"enable":false,"commandCenter":0,"paxApp":0,"webBooking":0},"isActive":true} |

    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"AffiliateGeneralRateSchema validation failed" }}             |
  Scenario: 03: I  get detail affiliate general Prices
    Given a list of documents in collection "AffiliateGeneralRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d011115","rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
    When I send request to api "/api/generalPrices/45092c05e4b030a33d011115" with method GET and request body
      | requestBody |
      |  {} |
    Then I should get the return data matches with
      | res                                                                                                                        |
      |  {"rateInfo": {"name": "rate 1","priceType": "sellPrice","currency": {"iso": "USD","symbol": "$"}},"id": "45092c05e4b030a33d011115" }  |
    When I send request to api "/api/generalPrices/45092c05e4b030a33d011116" with method GET and request body
      | requestBody |
      | {}  |
    Then I should get the error object matches with
      | res                                                                                                                        |
      |  { "error": {"message":"Not Found","stack": {} }}  |

  Scenario: 04: I  update affiliate generalPrices successfully
    Given a list of documents in collection "AffiliateGeneralRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d011117","rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["km"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | { "_id":"45092c05e4b030a33d011118","rateInfo": {"name": {"enum": ["rate 2"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["mi"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
    When I send request to api "/api/generalPrices/45092c05e4b030a33d011117" with method PUT and request body
      | requestBody                                                                       |
      |{"rateInfo":{"name":"abc","currency":{"symbol":"$","iso":"USD"},"priceType":"sellPrice"},"type":"General","airport":{"fromAirport":0,"toAirport":0,"fromAirportActive":false,"toAirportActive":false},"meetDriver":{"onCurb":0,"meetDrv":0},"rushHour":false,"rushHours":[],"heavyTraffic":{"enable":false,"surcharge":0},"tollFee":false,"otherFees":{"enable":false,"edit":false,"addNote":false},"tax":{"enable":false,"surcharge":0},"tip":{"enable":false,"value":0},"techFee":{"enable":false,"commandCenter":0,"paxApp":0,"webBooking":0},"isActive":true}|
    Then I should get the return data matches with
      | res |
      | {"returnCode":200} |
  Scenario: 05: I  update affiliate generalPrices failed with miss name
    Given a list of documents in collection "AffiliateGeneralRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d011117","rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["km"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | { "_id":"45092c05e4b030a33d011118","rateInfo": {"name": {"enum": ["rate 2"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["mi"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
    When I send request to api "/api/generalPrices/45092c05e4b030a33d011117" with method PUT and request body
      | requestBody                                                                       |
      |{"rateInfo":{"name":"abc","priceType":"sellPrice"},"type":"General","airport":{"fromAirport":0,"toAirport":0,"fromAirportActive":false,"toAirportActive":false},"meetDriver":{"onCurb":0,"meetDrv":0},"rushHour":false,"rushHours":[],"heavyTraffic":{"enable":false,"surcharge":0},"tollFee":false,"otherFees":{"enable":false,"edit":false,"addNote":false},"tax":{"enable":false,"surcharge":0},"tip":{"enable":false,"value":0},"techFee":{"enable":false,"commandCenter":0,"paxApp":0,"webBooking":0},"isActive":true}|
    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"name is required" }}             |
  Scenario: 06: I  delete affiliate generalPrices successfully
    Given a list of documents in collection "AffiliateGeneralRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d011117","rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["km"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | { "_id":"45092c05e4b030a33d011118","rateInfo": {"name": {"enum": ["rate 2"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["mi"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
    When I send request to api "/api/generalPrices/45092c05e4b030a33d011117" with method DELETE and request body
      | requestBody  |
      |{}            |
    Then I should get the return data matches with
      | res |
      | {"returnCode":200} |
  Scenario: 07: I get list pagination affiliate generalPrices
    Given a list of documents in collection "AffiliateGeneralRate", with the customized fields described below
      | total | extension                                                                                           |
      | 10     | { "rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 15     | { "rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 5     | { "rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
    When I send request  data to api "/api/generalPrices?type=General&_sort=id&_order=ASC&_start=0&_end=20",with param on url
    Then I will get "20" items in the returned list
    When I send request  data to api "/api/generalPrices?type=General&_sort=id&_order=ASC&_start=20&_end=20",with param on url
    Then I will get "10" items in the returned list
    When I send request  data to api "/api/generalPrices?type=General&_sort=id&_order=ASC&_start=30&_end=20",with param on url
    Then I will get "0" items in the returned list

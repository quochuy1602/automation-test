Feature: Manage Affiliate Hourly Rate
  I login website and add Affiliate Hourly Rate for system
  Background:
    Given The mongodb is connected
    And The collection "AffiliateHourlyRate" is empty
    And The collection "UsersSystem" is empty
    And The collection "AffiliateUserRole" is empty
    Given a list of documents in collection "UsersSystem", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"userId":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]},"firstName": {"enum": ["local"]}, "isActive": {"enum": [true]}} |
    And an api token after logined with username "local" and password "password"
  Scenario: 01: I  create affiliate hourly rate successfully
    Given a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "rateInfo": {"name": {"enum": ["flat rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
    When I send request to api "/api/hourlyRates" with request body
      | requestBody                                                                       |
      | {"rateInfo":{"name":"Hourly Rate A","currency":{"symbol":"$","iso":"USD"},"priceType":"sellPrice"},"type":"Hourly","cancellationPolicy":{"onDemand":{"isActive":false,"value":0},"inAdvance":{"isActive":false,"value":0}},"noShowPolicy":{"penalty":0},"isActive":true} |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
  Scenario: 02: I  create affiliate hourly rate failed with empty currency
    When I send request to api "/api/hourlyRates" with request body
      | requestBody                                                                       |
      | {"rateInfo":{"name":"Hourly Rate A","currency":{},"priceType":"sellPrice"},"type":"Hourly","cancellationPolicy":{"onDemand":{"isActive":false,"value":0},"inAdvance":{"isActive":false,"value":0}},"noShowPolicy":{"penalty":0},"isActive":true} |
    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"iso is required and symbol is required" }}             |
  Scenario: 03: I  get detail affiliate Hourly rate
    Given a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d022222","rateInfo": {"name": {"enum": ["Hourly rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
    When I send request to api "/api/hourlyRates/45092c05e4b030a33d022222" with method GET and request body
      | requestBody |
      | {}  |
    Then I should get the return data matches with
      | res                                                                                                                        |
      |  {"rateInfo": {"name": "Hourly rate 1","priceType": "sellPrice","currency": {"iso": "USD","symbol": "$"}},"id": "45092c05e4b030a33d022222" }  |
    When I send request to api "/api/hourlyRates/45092c05e4b030a33d022222" with method GET and request body
      | requestBody |
      | {}  |
    Then I should get the error object matches with
      | res                                                                                                                        |
      |  { "error": {"message":"Not Found","stack": {} }}  |
  Scenario: 04: I  update  affiliate Hourly rate failed with miss name
    Given a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d022224","rateInfo": {"name": {"enum": ["Hourly rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | { "_id":"45092c05e4b030a33d022225","rateInfo": {"name": {"enum": ["Hourly rate 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
    When I send request to api "/api/hourlyRates/45092c05e4b030a33d022225" with method PUT and request body
      | requestBody                                                                       |
      |{"rateInfo":{"name":"Test update","priceType":"sellPrice"},"type":"Hourly","cancellationPolicy":{"onDemand":{"isActive":false,"value":0},"inAdvance":{"isActive":false,"value":0}},"noShowPolicy":{"penalty":0},"isActive":true}|
    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"name is required" }}             |
  Scenario: 05: I  delete affiliate Hourly rate successfully
    Given a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d022224","rateInfo": {"name": {"enum": ["Hourly rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | { "_id":"45092c05e4b030a33d022225","rateInfo": {"name": {"enum": ["Hourly rate 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
    When I send request to api "/api/hourlyRates/45092c05e4b030a33d022225" with method DELETE and request body
      | requestBody  |
      |{}            |
    Then I should get the return data matches with
      | res |
      | {"returnCode":200} |
  Scenario: 06: I get list pagination affiliate Hourly rate
    Given a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 10     | { "rateInfo": {"name": {"enum": ["Hourly rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}}  |
      | 15     | { "rateInfo": {"name": {"enum": ["Hourly rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}}  |
      | 5      | { "rateInfo": {"name": {"enum": ["Hourly rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}}  |
    When I send request  data to api "/api/hourlyRates?type=Hourly&_sort=id&_order=ASC&_start=0&_end=20",with param on url
    Then I will get "20" items in the returned list
    When I send request  data to api "/api/hourlyRates?type=Hourly&_sort=id&_order=ASC&_start=20&_end=20",with param on url
    Then I will get "10" items in the returned list
    When I send request  data to api "/api/hourlyRates?type=Hourly&_sort=id&_order=ASC&_start=30&_end=20",with param on url
    Then I will get "0" items in the returned list
  Scenario: 07: I get list pagination and filter affiliate Hourly rate
    Given a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 10     | { "rateInfo": {"name": {"enum": ["Hourly Ha Noi"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}}  |
      | 15     | { "rateInfo": {"name": {"enum": ["Hourly Da Nang"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}}  |
      | 5      | { "rateInfo": {"name": {"enum": ["Hourly Hoi An"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}}  |
    When I send request  data to api "/api/hourlyRates?q=Hourly&type=Hourly&_sort=id&_order=ASC&_start=0&_end=20",with param on url
    Then I will get "20" items in the returned list
    When I send request  data to api "/api/hourlyRates?q=Da%20Nang&type=Hourly&_sort=id&_order=ASC&_start=0&_end=20",with param on url
    Then I will get "15" items in the returned list
    When I send request  data to api "/api/hourlyRates?q=ABC&type=Hourly&_sort=id&_order=ASC&_start=0&_end=20",with param on url
    Then I will get "0" items in the returned list

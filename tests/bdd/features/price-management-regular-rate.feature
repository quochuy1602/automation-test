Feature: Manage Regular Rate
  I login website and add regular rate for system
  Background:
    Given The mongodb is connected
    And The collection "AffiliateRate" is empty
    And The collection "UsersSystem" is empty
    And The collection "AffiliateUserRole" is empty
    Given a list of documents in collection "UsersSystem", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"userId":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]},"firstName": {"enum": ["local"]}, "isActive": {"enum": [true]}} |
    And an api token after logined with username "local" and password "password"

  Scenario: 01: I  create regular  affiliate rate with data
    Given a list of documents in collection "AffiliateRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
    When I send request to api "/api/regularRates" with request body
      | requestBody                                                                       |
      | {"rateInfo":{"name":"Rate B","currency":{"symbol":"$","iso":"USD"},"unitDistance":"km","priceType":"sellPrice"},"type":"Regular","starting":{"now":0,"reservation":0},"firstDistance":{"from":0,"to":0,"fee":0},"secondDistance":{"from":0,"to":0,"fee":0},"minimum":{"now":0,"reservation":0},"cancellationPolicy":{"onDemand":{"isActive":false,"value":0},"inAdvance":{"isActive":false,"value":0}},"noShowPolicy":{"penalty":0},"afterSecondDistance":{"feeAfterSecondDistance":0},"perMinute":{"feePerMinute":0},"isActive":true} |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request to api "/api/regularRates" with request body
      | requestBody                                                                       |
      | {"rateInfo":{"currency":{"symbol":"$","iso":"USD"},"priceType":"sellPrice"},"type":"Regular","starting":{"now":0,"reservation":0},"firstDistance":{"from":0,"to":0,"fee":0},"secondDistance":{"from":0,"to":0,"fee":0},"minimum":{"now":0,"reservation":0},"cancellationPolicy":{"onDemand":{"isActive":false,"value":0},"inAdvance":{"isActive":false,"value":0}},"noShowPolicy":{"penalty":0},"afterSecondDistance":{"feeAfterSecondDistance":0},"perMinute":{"feePerMinute":0},"isActive":true} |
    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"name is required" }}             |
  Scenario: 02: I  get detail affiliate regular rate
    Given a list of documents in collection "AffiliateRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d011111","rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
    When I send request to api "/api/regularRates/45092c05e4b030a33d011111" with method GET and request body
      | requestBody |
      |  {} |
    Then I should get the return data matches with
      | res                                                                                                                        |
      |  {"rateInfo": {"name": "rate 1","unitDistance": "km","priceType": "sellPrice","currency": {"iso": "USD","symbol": "$"}},"id": "45092c05e4b030a33d011111" }  |
    When I send request to api "/api/regularRates/45092c05e4b030a33d011222" with method GET and request body
      | requestBody |
      | {}  |
    Then I should get the error object matches with
      | res                                                                                                                        |
      |  { "error": {"message":"Not Found","stack": {} }}  |

  Scenario: 03: I  update affiliate regular rate successfully
    Given a list of documents in collection "AffiliateRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d011111","rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["km"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 1     | { "_id":"45092c05e4b030a33d011112","rateInfo": {"name": {"enum": ["rate 2"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["mi"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
    When I send request to api "/api/regularRates/45092c05e4b030a33d011112" with method PUT and request body
      | requestBody                                                                       |
      |{"rateInfo":{"name":"Test update","currency":{"symbol":"₫","iso":"VND"},"priceType":"sellPrice","unitDistance":"mi"},"type":"Regular","starting":{"now":0,"reservation":0},"firstDistance":{"from":"1","to":"1","fee":"2"},"secondDistance":{"from":"1","to":"1","fee":"2"},"minimum":{"now":0,"reservation":0},"cancellationPolicy":{"onDemand":{"isActive":false,"value":0},"inAdvance":{"isActive":false,"value":0}},"noShowPolicy":{"penalty":0},"afterSecondDistance":{"feeAfterSecondDistance":"2"},"perMinute":{"feePerMinute":0},"isActive":true}|
    Then I should get the return data matches with
      | res |
      | {"returnCode":200} |
  Scenario: 04: I  update affiliate regular  rate failed with miss name
    Given a list of documents in collection "AffiliateRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d011111","rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["km"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 1     | { "_id":"45092c05e4b030a33d011112","rateInfo": {"name": {"enum": ["rate 2"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["mi"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
    When I send request to api "/api/regularRates/45092c05e4b030a33d011112" with method PUT and request body
      | requestBody                                                                       |
      |{"rateInfo":{"name":"Test update","priceType":"sellPrice","unitDistance":"mi"},"type":"Regular","starting":{"now":0,"reservation":0},"firstDistance":{"from":"1","to":"1","fee":"2"},"secondDistance":{"from":"1","to":"1","fee":"2"},"minimum":{"now":0,"reservation":0},"cancellationPolicy":{"onDemand":{"isActive":false,"value":0},"inAdvance":{"isActive":false,"value":0}},"noShowPolicy":{"penalty":0},"afterSecondDistance":{"feeAfterSecondDistance":"2"},"perMinute":{"feePerMinute":0},"isActive":true}|
    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"name is required" }}             |
  Scenario: 05: I  delete affiliate regular rate successfully
    Given a list of documents in collection "AffiliateRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "_id":"45092c05e4b030a33d011111","rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["km"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 1     | { "_id":"45092c05e4b030a33d011112","rateInfo": {"name": {"enum": ["rate 2"]},"priceType":{"enum": ["sellPrice"]},"unitDistance":{"enum": ["mi"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
    When I send request to api "/api/regularRates/45092c05e4b030a33d011112" with method DELETE and request body
      | requestBody  |
      |{}            |
    Then I should get the return data matches with
      | res |
      | {"returnCode":200} |
  Scenario: 06: I get list pagination affiliate regular rate
    Given a list of documents in collection "AffiliateRate", with the customized fields described below
      | total | extension                                                                                           |
      | 10     | { "rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 15     | { "rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 5      | { "rateInfo": {"name": {"enum": ["rate 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
    When I send request  data to api "/api/regularRates?type=Regular&_sort=id&_order=ASC&_start=0&_end=20",with param on url
    Then I will get "20" items in the returned list
    When I send request  data to api "/api/regularRates?type=Regular&_sort=id&_order=ASC&_start=20&_end=20",with param on url
    Then I will get "10" items in the returned list
    When I send request  data to api "/api/regularRates?type=Regular&_sort=id&_order=ASC&_start=30&_end=20",with param on url
    Then I will get "0" items in the returned list

Feature: Management Fleet
  I login website  for system
  Background:
    Given The mongodb is connected
    And The collection "UsersSystem" is empty
    And The collection "AffiliateUserRole" is empty
    And The collection "CCPackages" is empty
    And The collection "Fleet" is empty
    And The collection "PricingPlan" is empty
    And The collection "AffiliationCarType" is empty
    And The collection "AffiliateRate" is empty
    And The collection "AffiliateAssignedRate" is empty
    Given a list of documents in collection "UsersSystem", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"userId":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]},"firstName": {"enum": ["local"]}, "isActive": {"enum": [true]}} |
    And an api token after logined with username "local" and password "password"
  Scenario: 01: I  fetch all fleet which filtered by package type
    Given a list of documents in collection "CCPackages", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["59e46e49e4b0ac3ffe3c5b77"]}, "name": {"enum": ["New CC"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["59e46e49e4b0ac3ffe3c5b88"]}, "name": {"enum": ["Old CC"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "Fleet", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["local"]}, "fleetId": {"enum": ["local"]}, "name": {"enum": ["Local"]},"isActive": {"enum": [true]},"packages":{"packageId":{"enum":["59e46e49e4b0ac3ffe3c5b77"]},"name":{"enum":["New CC"]}}} |
      | 1     | {"_id":{"enum":["chuongnv"]}, "fleetId": {"enum": ["chuongnv"]}, "name": {"enum": ["Chuong"]},"isActive": {"enum": [true]},"packages":{"packageId":{"enum":["59e46e49e4b0ac3ffe3c5b88"]},"name":{"enum":["Old CC"]}}} |
    And a list of documents in collection "PricingPlan", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["77092c05e4b030a33d02516a"]}, "fleetId": {"enum": ["local"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["77092c05e4b030a33d02516b"]}, "fleetId": {"enum": ["chuongnv"]},"isActive": {"enum": [true]}} |
    When I send request  data to api "/api/fleets?type=59e46e49e4b0ac3ffe3c5b77&_sort=priority&_order=ASC&_start=0&_end=20",with param on url
    Then I will get "1" items in the returned list
    When I send request  data to api "/api/fleets?type=59e46e49e4b0ac3ffe3c5b88&_sort=priority&_order=ASC&_start=0&_end=20",with param on url
    Then I will get "1" items in the returned list
    When I send request  data to api "/api/fleets?type=59e46e49e4b0ac3ffe3c5b89&_sort=priority&_order=ASC&_start=0&_end=20",with param on url
    Then I will get "0" items in the returned list

  Scenario: 02: I  fetch list packages CC
    Given a list of documents in collection "CCPackages", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["59e46e49e4b0ac3ffe3c5b77"]}, "name": {"enum": ["New CC"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["59e46e49e4b0ac3ffe3c5b88"]}, "name": {"enum": ["Old CC"]},"isActive": {"enum": [true]}} |
    When I send request  data to api "/api/generals/CCPackages",with param on url
    Then I will get "2" items in the returned list
  Scenario: 03: I  get Affiliation settings with fleetId
    Given a list of documents in collection "CCPackages", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["59e46e49e4b0ac3ffe3c5b77"]}, "name": {"enum": ["New CC"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["59e46e49e4b0ac3ffe3c5b88"]}, "name": {"enum": ["Old CC"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "Fleet", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["local"]}, "fleetId": {"enum": ["local"]}, "name": {"enum": ["Local"]},"isActive": {"enum": [true]},"packages":{"packageId":{"enum":["59e46e49e4b0ac3ffe3c5b77"]},"name":{"enum":["New CC"]}}} |
      | 1     | {"_id":{"enum":["chuongnv"]}, "fleetId": {"enum": ["chuongnv"]}, "name": {"enum": ["Chuong"]},"isActive": {"enum": [true]},"packages":{"packageId":{"enum":["59e46e49e4b0ac3ffe3c5b88"]},"name":{"enum":["Old CC"]}}} |
    And a list of documents in collection "PricingPlan", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["77092c05e4b030a33d02516a"]}, "fleetId": {"enum": ["local"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["77092c05e4b030a33d02516b"]}, "fleetId": {"enum": ["chuongnv"]},"isActive": {"enum": [true]}} |
    When I send request to api "/api/fleets/local/affiliationSettings" with method GET and request body
      | requestBody |
      | {}  |
    Then I should get the return data matches with
      | res                                                                                                                        |
      | {"returnCode": 200 }   |
    When I send request to api "/api/fleets/abc/affiliationSettings" with method GET and request body
      | requestBody |
      | {}  |
    Then I should get the error object matches with
      | res                                                                                                                        |
      |  { "error": {"message":"Not Found","stack": {} }}  |

  Scenario: 04: I  update Affiliation Settings successfully
    Given a list of documents in collection "CCPackages", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["59e46e49e4b0ac3ffe3c5b77"]}, "name": {"enum": ["New CC"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["59e46e49e4b0ac3ffe3c5b88"]}, "name": {"enum": ["Old CC"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "Fleet", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["local"]}, "fleetId": {"enum": ["local"]}, "name": {"enum": ["Local"]},"isActive": {"enum": [true]},"packages":{"packageId":{"enum":["59e46e49e4b0ac3ffe3c5b77"]},"name":{"enum":["New CC"]}}} |
      | 1     | {"_id":{"enum":["chuongnv"]}, "fleetId": {"enum": ["chuongnv"]}, "name": {"enum": ["Chuong"]},"isActive": {"enum": [true]},"packages":{"packageId":{"enum":["59e46e49e4b0ac3ffe3c5b88"]},"name":{"enum":["Old CC"]}}} |
    And a list of documents in collection "PricingPlan", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["77092c05e4b030a33d02516a"]}, "fleetId": {"enum": ["local"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["77092c05e4b030a33d02516b"]}, "fleetId": {"enum": ["chuongnv"]},"isActive": {"enum": [true]}} |
    When I send request to api "/api/fleets/local/affiliationSettings" with method PUT and request body
      | requestBody                                                                       |
      |{"dispatching":true,"providerFleet":"All","onlyTopDrvReceiveBook":true,"fleets":[],"homeFleetCommission":0}|
    Then I should get the return data matches with
      | res |
      | {"returnCode":200} |
    When I send request to api "/api/fleets/abc/affiliationSettings" with method PUT and request body
      | requestBody                                                                       |
      |{"dispatching":true,"providerFleet":"All","onlyTopDrvReceiveBook":true,"fleets":[],"homeFleetCommission":0}|
    Then I should get the error object matches with
      | res                                                                                                                        |
      |  { "error": {"message":"Not Found","stack": {} }}  |
  Scenario: 05: I  assigned Qup sell price  with Regular rate and Flat rate and Hourly rate
    Given a list of documents in collection "AffiliationCarType", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["46092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 1"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["47092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 2"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "Fleet", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["local"]}, "fleetId": {"enum": ["local"]}, "name": {"enum": ["Local"]},"isActive": {"enum": [true]},"packages":{"packageId":{"enum":["59e46e49e4b0ac3ffe3c5b77"]},"name":{"enum":["New CC"]}}} |
      | 1     | {"_id":{"enum":["chuongnv"]}, "fleetId": {"enum": ["chuongnv"]}, "name": {"enum": ["Chuong"]},"isActive": {"enum": [true]},"packages":{"packageId":{"enum":["59e46e49e4b0ac3ffe3c5b88"]},"name":{"enum":["Old CC"]}}} |
    And a list of documents in collection "PricingPlan", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["77092c05e4b030a33d02516a"]}, "fleetId": {"enum": ["local"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["77092c05e4b030a33d02516b"]}, "fleetId": {"enum": ["chuongnv"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "AffiliateRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["46092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Regular Sell 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 1     | {"_id":{"enum":["56092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Regular Sell 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 1     | {"_id":{"enum":["66092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Regular Sell 3"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
    And a list of documents in collection "AffiliateFlatRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["76092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Flat Sell 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Flat"]}} |
      | 1     | {"_id":{"enum":["86092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Flat Sell 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Flat"]}} |
      | 1     | {"_id":{"enum":["96092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Flat Sell 3"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Flat"]}} |
    And a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["14092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["15092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["17092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 3"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
    When I send request to api "/api/fleets/local/assignRates" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "local","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "local"}}],"flatRate": {"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Flat","rate": {"id": "76092c05e4b030a33d02516a","name": "Flat Sell 1"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "local","specialFlatRate": true,"priceType": "sellPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request to api "/api/fleets/local/assignRates" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "local","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "local"}}],"flatRate": {"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Flat","rate": {"id": "76092c05e4b030a33d02516a","name": "Flat Sell 1"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "local","specialFlatRate": true,"priceType": "sellPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 409 }            |

  Scenario: 06: I  assigned Qup buy price  with Regular rate and Flat rate and Hourly rate
    Given a list of documents in collection "AffiliationCarType", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["46092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 1"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["47092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 2"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "Fleet", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["local"]}, "fleetId": {"enum": ["local"]}, "name": {"enum": ["Local"]},"isActive": {"enum": [true]},"packages":{"packageId":{"enum":["59e46e49e4b0ac3ffe3c5b77"]},"name":{"enum":["New CC"]}}} |
      | 1     | {"_id":{"enum":["chuongnv"]}, "fleetId": {"enum": ["chuongnv"]}, "name": {"enum": ["Chuong"]},"isActive": {"enum": [true]},"packages":{"packageId":{"enum":["59e46e49e4b0ac3ffe3c5b88"]},"name":{"enum":["Old CC"]}}} |
    And a list of documents in collection "PricingPlan", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["77092c05e4b030a33d02516a"]}, "fleetId": {"enum": ["local"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["77092c05e4b030a33d02516b"]}, "fleetId": {"enum": ["chuongnv"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "AffiliateRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["46092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Regular Buy 1"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 1     | {"_id":{"enum":["56092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Regular Buy 2"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 1     | {"_id":{"enum":["66092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Regular Buy 3"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
    And a list of documents in collection "AffiliateFlatRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["76092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Flat Buy 1"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Flat"]}} |
      | 1     | {"_id":{"enum":["86092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Flat Buy 2"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Flat"]}} |
      | 1     | {"_id":{"enum":["96092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Flat Buy 3"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Flat"]}} |
    And a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["14092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Buy 1"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["15092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Buy 2"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["17092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Buy 3"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
    When I send request to api "/api/fleets/local/assignRates" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "local","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "buyPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Buy 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "buyPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Buy 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "local"}}],"flatRate": {"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "buyPrice","type": "Flat","rate": {"id": "76092c05e4b030a33d02516a","name": "Flat Buy 1"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "local","specialFlatRate": true,"priceType": "buyPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request to api "/api/fleets/local/assignRates" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "local","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "buyPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Buy 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "buyPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Buy 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "local"}}],"flatRate": {"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "buyPrice","type": "Flat","rate": {"id": "76092c05e4b030a33d02516a","name": "Flat Buy 1"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "local","specialFlatRate": true,"priceType": "buyPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 409 }            |

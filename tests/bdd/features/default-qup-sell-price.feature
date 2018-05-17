Feature: Manage Default sell price
  I login website and add General Price for system
  Background:
    Given The mongodb is connected
    And The collection "AffiliateRate" is empty
    And The collection "UsersSystem" is empty
    And The collection "AffiliateUserRole" is empty
    And The collection "FZone" is empty
    And The collection "AffiliationCarType" is empty
    And The collection "AffiliateAssignedRate" is empty

    Given a list of documents in collection "UsersSystem", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"userId":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]},"firstName": {"enum": ["local"]}, "isActive": {"enum": [true]}} |
    And an api token after logined with username "local" and password "password"

  Scenario: 01: I  assigned default price with Regular rate and Flat rate and Hourly rate and General Fee
    Given a list of documents in collection "AffiliationCarType", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["46092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 1"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["47092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 2"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "FZone", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["16092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 1"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
      | 1     | {"_id":{"enum":["26092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 2"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17591054992681,15.935792015545665],[108.22225912170416,15.943714951611229],[108.22775228576666,15.930179746544933],[108.17591054992681,15.92423717304384],[108.17591054992681,15.935792015545665]]]]}}} |
      | 1     | {"_id":{"enum":["36092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 3"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
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
    And a list of documents in collection "AffiliateGeneralRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["11092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | {"_id":{"enum":["12092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | {"_id":{"enum":["13092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 3"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
    And a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["14092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["15092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["17092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 3"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
    When I send request to api "/api/defaultPrice/45092c05e4b030a33d02516b" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "General","rate": {"id": "11092c05e4b030a33d02516a","name": "General Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}}],"flatRate": {"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Flat","rate": {"id": "76092c05e4b030a33d02516a","name": "Flat Sell 1"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "","specialFlatRate": true,"priceType": "sellPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request to api "/api/defaultPrice/45092c05e4b030a33d02516b" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [],"flatRate": {"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Flat","rate": {"id": "86092c05e4b030a33d02516a","name": "Flat Sell 2"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "","specialFlatRate": true,"priceType": "sellPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request to api "/api/defaultPrice/45092c05e4b030a33d02516b" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "General","rate": {"id": "11092c05e4b030a33d02516a","name": "General Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}}],"flatRate": {"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Flat","rate": {"id": "86092c05e4b030a33d02516a","name": "Flat Sell 2"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "","specialFlatRate": true,"priceType": "sellPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 409 }            |
    When I send request to api "/api/defaultPrice/45092c05e4b030a33d02516b" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "General","rate": {"id": "11092c05e4b030a33d02516a","name": "General Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}}],"flatRate": {"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Flat","rate": {"id": "76092c05e4b030a33d02516a","name": "Flat Sell 1"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "TN","specialFlatRate": true,"priceType": "sellPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request to api "/api/defaultPrice/45092c05e4b030a33d02516b" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "General","rate": {"id": "11092c05e4b030a33d02516a","name": "General Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}}],"flatRate": {"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Flat","rate": {"id": "76092c05e4b030a33d02516b","name": "Flat Sell 1"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "TN","specialFlatRate": true,"priceType": "sellPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 409 }            |
  Scenario: 02: I get data assign default price sell
    Given a list of documents in collection "AffiliationCarType", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["46092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 1"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["47092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 2"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "FZone", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["16092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 1"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
      | 1     | {"_id":{"enum":["26092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 2"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17591054992681,15.935792015545665],[108.22225912170416,15.943714951611229],[108.22775228576666,15.930179746544933],[108.17591054992681,15.92423717304384],[108.17591054992681,15.935792015545665]]]]}}} |
      | 1     | {"_id":{"enum":["36092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 3"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
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
    And a list of documents in collection "AffiliateGeneralRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["11092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | {"_id":{"enum":["12092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | {"_id":{"enum":["13092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 3"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
    And a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["14092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["15092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["17092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 3"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
    When I send request to api "/api/defaultPrice/45092c05e4b030a33d02516b" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "General","rate": {"id": "11092c05e4b030a33d02516a","name": "General Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}}],"flatRate": {"fleetId": "","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Flat","rate": {"id": "76092c05e4b030a33d02516a","name": "Flat Sell 1"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "","specialFlatRate": true,"priceType": "sellPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?carTypeId=46092c05e4b030a33d02516a&type=Regular&priceType=sellPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?carTypeId=46092c05e4b030a33d02516a&type=Flat&priceType=sellPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?carTypeId=46092c05e4b030a33d02516a&type=General&priceType=sellPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?carTypeId=46092c05e4b030a33d02516a&type=Hourly&priceType=sellPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list

  Scenario: 03: I get data assign Qup sell price
    Given a list of documents in collection "AffiliationCarType", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["46092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 1"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["47092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 2"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "FZone", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["16092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 1"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
      | 1     | {"_id":{"enum":["26092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 2"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17591054992681,15.935792015545665],[108.22225912170416,15.943714951611229],[108.22775228576666,15.930179746544933],[108.17591054992681,15.92423717304384],[108.17591054992681,15.935792015545665]]]]}}} |
      | 1     | {"_id":{"enum":["36092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 3"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
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
    And a list of documents in collection "AffiliateGeneralRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["11092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | {"_id":{"enum":["12092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | {"_id":{"enum":["13092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 3"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
    And a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["14092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 1"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["15092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 2"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["17092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 3"]},"priceType":{"enum": ["sellPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
    When I send request to api "/api/defaultPrice/45092c05e4b030a33d02516b" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "General","rate": {"id": "11092c05e4b030a33d02516a","name": "General Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}}],"flatRate": {"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "sellPrice","type": "Flat","rate": {"id": "76092c05e4b030a33d02516a","name": "Flat Sell 1"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "TN","specialFlatRate": true,"priceType": "sellPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?fleetId=TN&carTypeId=46092c05e4b030a33d02516a&type=Regular&priceType=sellPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?fleetId=TN&carTypeId=46092c05e4b030a33d02516a&type=Flat&priceType=sellPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?fleetId=TN&carTypeId=46092c05e4b030a33d02516a&type=General&priceType=sellPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?fleetId=TN&carTypeId=46092c05e4b030a33d02516a&type=Hourly&priceType=sellPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list

  Scenario: 04: I get data assign Qup buy price
    Given a list of documents in collection "AffiliationCarType", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["46092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 1"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["47092c05e4b030a33d02516a"]}, "name": {"enum": ["Car 2"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "FZone", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["16092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 1"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
      | 1     | {"_id":{"enum":["26092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 2"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17591054992681,15.935792015545665],[108.22225912170416,15.943714951611229],[108.22775228576666,15.930179746544933],[108.17591054992681,15.92423717304384],[108.17591054992681,15.935792015545665]]]]}}} |
      | 1     | {"_id":{"enum":["36092c05e4b030a33d02516a"]}, "zoneName": {"enum": ["zone 3"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
    And a list of documents in collection "AffiliateRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["46092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Regular Sell 1"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 1     | {"_id":{"enum":["56092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Regular Sell 2"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
      | 1     | {"_id":{"enum":["66092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Regular Sell 3"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Regular"]}} |
    And a list of documents in collection "AffiliateFlatRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["76092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Flat Sell 1"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Flat"]}} |
      | 1     | {"_id":{"enum":["86092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Flat Sell 2"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Flat"]}} |
      | 1     | {"_id":{"enum":["96092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Flat Sell 3"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Flat"]}} |
    And a list of documents in collection "AffiliateGeneralRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["11092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 1"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | {"_id":{"enum":["12092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 2"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
      | 1     | {"_id":{"enum":["13092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["General Sell 3"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["General"]}} |
    And a list of documents in collection "AffiliateHourlyRate", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["14092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 1"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["15092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 2"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["$"]} ,"iso": {"enum": ["USD"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
      | 1     | {"_id":{"enum":["17092c05e4b030a33d02516a"]}, "rateInfo": {"name": {"enum": ["Hourly Sell 3"]},"priceType":{"enum": ["buyPrice"]},"currency":{"symbol":{"enum": ["€"]} ,"iso": {"enum": ["EUR"]} }},"isActive": {"enum": [true]},"type":{"enum": ["Hourly"]}} |
    When I send request to api "/api/defaultPrice/45092c05e4b030a33d02516b" with method PUT and request body
      | requestBody                                                                       |
      | {"newAssignRate": [{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "buyPrice","type": "Regular","rate": {"id": "46092c05e4b030a33d02516a","name": "Regular Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "buyPrice","type": "General","rate": {"id": "11092c05e4b030a33d02516a","name": "General Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}},{"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "buyPrice","type": "Hourly","rate": {"id": "14092c05e4b030a33d02516a","name": "Hourly Sell 1","currency": {"iso": "USD"}},"zone": {"id": "16092c05e4b030a33d02516a","name": "zone 1","fleetId": "TN"}}],"flatRate": {"fleetId": "TN","currency": {"iso": "USD","symbol": "$"},"carTypeId": "46092c05e4b030a33d02516a","priceType": "buyPrice","type": "Flat","rate": {"id": "76092c05e4b030a33d02516a","name": "Flat Sell 1"},"zone": {"id": "null","fleetId": "null","name": "null"}},"removeAssignRate": [],"fleetId": "TN","specialFlatRate": true,"priceType": "buyPrice","carTypeId": "46092c05e4b030a33d02516a"}|
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?fleetId=TN&carTypeId=46092c05e4b030a33d02516a&type=Regular&priceType=buyPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?fleetId=TN&carTypeId=46092c05e4b030a33d02516a&type=Flat&priceType=buyPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?fleetId=TN&carTypeId=46092c05e4b030a33d02516a&type=General&priceType=buyPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list
    When I send request  data to api "/api/generals/listZoneRateCurrencyAssigned?fleetId=TN&carTypeId=46092c05e4b030a33d02516a&type=Hourly&priceType=buyPrice&currencyISO=USD",with param on url
    Then I will get object assign "1" of items in the returned list


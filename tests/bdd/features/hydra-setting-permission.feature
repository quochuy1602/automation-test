Feature: Setting permission
  I login website  for system
  Background:
    Given The mongodb is connected
    And The collection "UsersSystem" is empty
    And The collection "AffiliateUserRole" is empty
    And The collection "Roles" is empty
    Given a list of documents in collection "UsersSystem", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"userId":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]},"firstName": {"enum": ["local"]}, "isActive": {"enum": [true]}} |
    And an api token after logined with username "local" and password "password"
  Scenario: 01: I create role for system successful
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"name":{"enum": ["Admin"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    When I send request to api "/api/permissions" with request body
      | requestBody                                                                       |
      | { "name":"Role 1","isActive":true,"isAdmin":false,"modules":[{"methods":["GET","PUT"],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":[],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":[],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}],"fleetId":""}                                                                                |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request to api "/api/permissions" with request body
      | requestBody                                                                       |
      | { "name":"Role 1","isActive":true,"isAdmin":false,"modules":[{"methods":["GET","PUT"],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":[],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":[],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}],"fleetId":""}                                                                                |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 400 }            |
  Scenario: 02: I create role for system failed
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"name":{"enum": ["Admin"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    When I send request to api "/api/permissions" with request body
      | requestBody                                                                       |
      | { "isActive":true,"isAdmin":false,"modules":[{"methods":["GET","PUT"],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":[],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":[],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}],"fleetId":""}                                                                                |
    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"name is required" }}            |
  Scenario: 03: I get detail role
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Admin"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    When I send request to api "/api/permissions/45092c05e4b030a33d02516d" with method GET and request body
      | requestBody |
      | {}  |
    Then I should get the return data matches with
      | res                             |
      | {"name": "Admin","isActive": true,"modules": [],"fleetId": ""}            |
  Scenario: 03: I update role successful
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Admin"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    When I send request to api "/api/permissions/45092c05e4b030a33d02516d" with method PUT and request body
      | requestBody |
      | { "name":"Admin update","isActive":true,"isAdmin":false,"modules":[{"methods":["GET","PUT"],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":[],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":[],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}],"fleetId":""}   |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }           |
  Scenario: 04: I update role failed when role assign for users
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Admin"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"permission":{"roleName":{"enum": ["Admin"]} ,"roleId": {"enum": ["45092c05e4b030a33d02516d"]} }, "userName": {"enum": ["local1"]},"firstName": {"enum": ["local"]}, "isActive": {"enum": [true]}} |
    When I send request to api "/api/permissions/45092c05e4b030a33d02516d" with method PUT and request body
      | requestBody |
      | { "name":"Admin update","isActive":false,"isAdmin":false,"modules":[{"methods":["GET","PUT"],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":[],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":[],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}],"fleetId":""}   |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 406 }            |
  Scenario: 05: I deleted role successful with status false
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Admin"]},"isActive": {"enum": [false]},"fleetId": {"enum": [""]}} |
    When I send request to api "/api/permissions/45092c05e4b030a33d02516d" with method DELETE and request body
      | requestBody |
      | {}   |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
  Scenario: 06: I deleted role failed with status true
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Admin"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    When I send request to api "/api/permissions/45092c05e4b030a33d02516d" with method DELETE and request body
      | requestBody |
      | {}   |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 400 }            |

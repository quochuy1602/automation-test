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
  Scenario: 01: I create users for system successful
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516b"]},"name":{"enum": ["Role 1"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Role 2"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    When I send request to api "/api/users" with request body
      | requestBody                                                                       |
      | {"userName":"admi","firstName":"admin","lastName":"a","email":"abc@gmail.com","phone":"","isActive":true,"permission":{"roleName":"Role 1","roleId":"45092c05e4b030a33d02516b","modules":[{"methods":[],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":["DELETE","GET","POST","PUT"],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":["DELETE","GET","POST","PUT"],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}]}}                                                                                |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
  Scenario: 02: I create users failed with null userName and firstName and email
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516b"]},"name":{"enum": ["Role 1"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Role 2"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    When I send request to api "/api/users" with request body
      | requestBody                                                                       |
      | {"lastName":"a","phone":"","isActive":true,"permission":{"roleName":"Role 1","roleId":"45092c05e4b030a33d02516b","modules":[{"methods":[],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":["DELETE","GET","POST","PUT"],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":["DELETE","GET","POST","PUT"],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}]}}                                                                                |
    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"userName is required" }}            |
  Scenario: 03: I create users failed with userName is exists on system
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516b"]},"name":{"enum": ["Role 1"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Role 2"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"permission":{"roleName":{"enum": ["Role 1"]} ,"roleId": {"enum": ["45092c05e4b030a33d02516b"]} }, "userName": {"enum": ["admi"]},"firstName": {"enum": ["admi"]}, "isActive": {"enum": [true]}} |
    When I send request to api "/api/users" with request body
      | requestBody                                                                       |
      | {"userName":"admi","firstName":"admin","lastName":"a","email":"abc@gmail.com","phone":"","isActive":true,"permission":{"roleName":"Role 1","roleId":"45092c05e4b030a33d02516b","modules":[{"methods":[],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":["DELETE","GET","POST","PUT"],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":["DELETE","GET","POST","PUT"],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}]}}                                                                                |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 409  }            |
  Scenario: 04: I create users failed with null roleId or roleId = "1234"
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516b"]},"name":{"enum": ["Role 1"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Role 2"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"permission":{"roleName":{"enum": ["Role 1"]} ,"roleId": {"enum": ["45092c05e4b030a33d02516b"]} }, "userName": {"enum": ["admi"]},"firstName": {"enum": ["admi"]}, "isActive": {"enum": [true]}} |
    When I send request to api "/api/users" with request body
      | requestBody                                                                       |
      | {"userName":"admib","firstName":"admin","lastName":"a","email":"abc@gmail.com","phone":"","isActive":true,"permission":{"roleName":"Role 1","modules":[{"methods":[],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":["DELETE","GET","POST","PUT"],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":["DELETE","GET","POST","PUT"],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}]}}                                                                                |
    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"roleId is required" }}            |
    When I send request to api "/api/users" with request body
      | requestBody                                                                       |
      | {"userName":"admib","firstName":"admin","lastName":"a","email":"abc@gmail.com","phone":"","isActive":true,"permission":{"roleName":"Role 1","roleId":"1234","modules":[{"methods":[],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":["DELETE","GET","POST","PUT"],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":["DELETE","GET","POST","PUT"],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}]}}                                                                                |
    Then I should get the return data matches with
      | res                                 |
      | {"returnCode": 400  }               |
  Scenario: 05: I get detail users success with id = "45092c05e4b030a33d02517b"
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516b"]},"name":{"enum": ["Role 1"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Role 2"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02517b"]},"permission":{"roleName":{"enum": ["Role 1"]} ,"roleId": {"enum": ["45092c05e4b030a33d02516b"]} }, "userName": {"enum": ["admi"]},"firstName": {"enum": ["admi"]}, "isActive": {"enum": [true]}} |
    When I send request to api "/api/users/45092c05e4b030a33d02517b" with method GET and request body
      | requestBody |
      | {}  |
    Then I should get the return data matches with
      | res                             |
      |{ "_id":"45092c05e4b030a33d02517b","userName":"admi","firstName":"admi","isActive":true,"permission":{"roleName":"Role 1","roleId":"45092c05e4b030a33d02516b","modules":[]}}          |
  Scenario: 06: I get detail users failed with id = "123"
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516b"]},"name":{"enum": ["Role 1"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Role 2"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02517b"]},"permission":{"roleName":{"enum": ["Role 1"]} ,"roleId": {"enum": ["45092c05e4b030a33d02516b"]} }, "userName": {"enum": ["admi"]},"firstName": {"enum": ["admi"]}, "isActive": {"enum": [true]}} |
    When I send request to api "/api/users/123" with method GET and request body
      | requestBody |
      | {}  |
    Then I should get the error object matches with
      | res                             |
      | {"error": { }}            |
  Scenario: 07: I update users success
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516b"]},"name":{"enum": ["Role 1"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Role 2"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02517b"]},"permission":{"roleName":{"enum": ["Role 1"]} ,"roleId": {"enum": ["45092c05e4b030a33d02516b"]} }, "userName": {"enum": ["admi"]},"firstName": {"enum": ["admi"]}, "isActive": {"enum": [true]}} |
    When I send request to api "/api/users/45092c05e4b030a33d02517b" with method PUT and request body
      | requestBody |
      | {"userName":"admib","firstName":"admin","lastName":"a","email":"abc@gmail.com","phone":"","isActive":true,"permission":{"roleId":"45092c05e4b030a33d02516d","roleName":"Role update","modules":[{"methods":[],"resources":"fleets","name":"Fleet management"},{"methods":[],"resources":"settlementBookings","name":"Booking report"},{"methods":[],"resources":"settlementFleets","name":"Fleet report"},{"methods":[],"resources":"regularRates","name":"Regular rate"},{"methods":["DELETE","GET","POST","PUT"],"resources":"flatRates","name":"Flat rate"},{"methods":[],"resources":"hourlyRates","name":"Hourly/daily rate"},{"methods":[],"resources":"generalPrices","name":"General price"},{"methods":[],"resources":"defaultPrice","name":"Default QUp sell price"},{"methods":[],"resources":"affiliateFlatZone","name":"Zone"},{"methods":["DELETE","GET","POST","PUT"],"resources":"permissions","name":"Permission"},{"methods":[],"resources":"users","name":"Users"}]}}              |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
  Scenario: 08: I delete users success
    Given a list of documents in collection "Roles", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516b"]},"name":{"enum": ["Role 1"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]},"name":{"enum": ["Role 2"]},"isActive": {"enum": [true]},"fleetId": {"enum": [""]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02517b"]},"permission":{"roleName":{"enum": ["Role 1"]} ,"roleId": {"enum": ["45092c05e4b030a33d02516b"]} }, "userName": {"enum": ["admi"]},"firstName": {"enum": ["admi"]}, "isActive": {"enum": [true]}} |
    When I send request to api "/api/users/45092c05e4b030a33d02517b" with method DELETE and request body
      | requestBody |
      | {}              |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |

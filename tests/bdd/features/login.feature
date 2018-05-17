Feature: Login Hydra
  As a user admin
  I want to log into  website with username and password
  So that I can do tasks on it

  Background:
    Given The mongodb is connected
    And The collection "UsersSystem" is empty
    And The collection "AffiliateUserRole" is empty

  Scenario: 01. I can login successfully with the correct username and password
    Given a list of documents in collection "UsersSystem", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516b"]}, "userName": {"enum": ["chuongnv"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"userId":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]},"firstName": {"enum": ["local"]}, "isActive": {"enum": [true]}} |
      | 1     | {"userId":{"enum":["45092c05e4b030a33d02516b"]}, "userName": {"enum": ["chuongnv"]},"firstName": {"enum": ["local"]},"isActive": {"enum": [true]}} |
    When I send request to login with params
      | username | password |
      | local    | password |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
  Scenario: 02. I can't login successfully with the correct username and password
    Given a list of documents in collection "UsersSystem", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]}, "userName": {"enum": ["local1"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516c"]}, "userName": {"enum": ["chuongnv1"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
    When I send request to login with params
      | username | password |
      | local1    | password |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 404 }            |
  Scenario: 03. I can't login successfully with the incorrect username and password
    Given a list of documents in collection "UsersSystem", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516d"]}, "userName": {"enum": ["local1"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516c"]}, "userName": {"enum": ["chuongnv1"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
    When I send request to login with params
      | username | password |
      | local    | password2 |
    And I send request to login with params
      | username | password |
      | chuongnc    | password |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 404 }            |




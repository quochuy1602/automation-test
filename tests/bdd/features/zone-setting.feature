Feature: Manage zone
  I login website and add zone for system
  Background:
    Given The mongodb is connected
    And The collection "AffiliateRate" is empty
    And The collection "UsersSystem" is empty
    And The collection "AffiliateUserRole" is empty
    And The collection "FZone" is empty
    And The collection "AffiliationCarType" is empty
    Given a list of documents in collection "UsersSystem", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"_id":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]}, "password": {"enum": ["password"]},"isActive": {"enum": [true]}} |
    And a list of documents in collection "AffiliateUserRole", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | {"userId":{"enum":["45092c05e4b030a33d02516a"]}, "userName": {"enum": ["local"]},"firstName": {"enum": ["local"]}, "isActive": {"enum": [true]}} |
    And an api token after logined with username "local" and password "password"

  Scenario: 01: I  create zone affiliate
    Given a list of documents in collection "FZone", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "zoneName": {"enum": ["zone 1"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
    When I send request to api "/api/affiliateFlatZone" with request body
      | requestBody                                                                       |
      | {"zoneName":"zone 2","isActive":true,"geo":{"coordinates":[[[108.17591054992681,15.935792015545665],[108.22225912170416,15.943714951611229],[108.22775228576666,15.930179746544933],[108.17591054992681,15.92423717304384],[108.17591054992681,15.935792015545665]]],"type":"Polygon"}} |
    Then I should get the return data matches with
      | res                             |
      | {"returnCode": 200 }            |
    When I send request to api "/api/affiliateFlatZone" with request body
      | requestBody                                                                       |
      | {"isActive":true,"geo":{"coordinates":[[[108.17591054992681,15.935792015545665],[108.22225912170416,15.943714951611229],[108.22775228576666,15.930179746544933],[108.17591054992681,15.92423717304384],[108.17591054992681,15.935792015545665]]],"type":"Polygon"}} |
    Then I should get the error object matches with
      | res                             |
      | {"error": { "message":"zoneName is required" }}            |

  Scenario: 02: I get list zone affiliate with drop point on map
    Given a list of documents in collection "FZone", with the customized fields described below
      | total | extension                                                                                           |
      | 1     | { "zoneName": {"enum": ["zone 3"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17582755278113,15.918097581535172],[108.23007254789832,15.926681504800536],[108.23556571196082,15.914465811265543],[108.17548423002722,15.908522772880701],[108.17582755278113,15.918097581535172]]]]}}} |
      | 1     | { "zoneName": {"enum": ["zone 1"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
      | 1     | { "zoneName": {"enum": ["zone 2"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17591054992681,15.935792015545665],[108.22225912170416,15.943714951611229],[108.22775228576666,15.930179746544933],[108.17591054992681,15.92423717304384],[108.17591054992681,15.935792015545665]]]]}}} |
    When I send request to api "/api/generals/listGeoLocation" with request body
      | requestBody                                                                       |
      | {"coordinates":[[[108.30019588212213,15.983468808866972],[108.30019588212213,15.85982686991924],[108.10161853770455,15.85982686991924],[108.10161853770455,15.983468808866972],[108.30019588212213,15.983468808866972]]]} |
    Then I will get "3" items in the returned list
    When I send request to api "/api/generals/listGeoLocation" with request body
      | requestBody                                                                       |
      | {"coordinates":[[[108.24768160803603,15.946487427068117],[108.24768160803603,15.884664578592119],[108.14839293582725,15.884664578592119],[108.14839293582725,15.946487427068117],[108.24768160803603,15.946487427068117]]]} |
    Then I will get "2" items in the returned list
    When I send request to api "/api/generals/listGeoLocation" with request body
      | requestBody                                                                       |
      | {"coordinates":[[[108.26385941048443,15.896370416800574],[108.26385941048443,15.834532169517804],[108.16457073827564,15.834532169517804],[108.16457073827564,15.896370416800574],[108.26385941048443,15.896370416800574]]]} |
    Then I will get "0" items in the returned list

  Scenario: 03: I get list pagination affiliate zone
    Given a list of documents in collection "FZone", with the customized fields described below
      | total | extension                                                                                           |
      | 10     | { "zoneName": {"enum": ["zone 3"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17582755278113,15.918097581535172],[108.23007254789832,15.926681504800536],[108.23556571196082,15.914465811265543],[108.17548423002722,15.908522772880701],[108.17582755278113,15.918097581535172]]]]}}} |
      | 15     | { "zoneName": {"enum": ["zone 1"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17170190378556,15.95974812991488],[108.21152734323869,15.96568965123852],[108.21839379831681,15.948524775581978],[108.17444848581681,15.94225262741708],[108.17170190378556,15.95974812991488]]]]}}} |
      | 5     | { "zoneName": {"enum": ["zone 2"]}, "fleetId": {"enum": [""]},"isActive": {"enum": [true]},"geo":{"type":{"enum": ["Polygon"]},"coordinates":{"enum": [[[[108.17591054992681,15.935792015545665],[108.22225912170416,15.943714951611229],[108.22775228576666,15.930179746544933],[108.17591054992681,15.92423717304384],[108.17591054992681,15.935792015545665]]]]}}} |
    When I send request  data to api "/api/affiliateFlatZone?type=All&_sort=createdDate&_order=DESC&_start=0&_end=20",with param on url
    Then I will get "20" items in the returned list
    When I send request  data to api "/api/affiliateFlatZone?type=All&_sort=createdDate&_order=DESC&_start=20&_end=20",with param on url
    Then I will get "10" items in the returned list
    When I send request  data to api "/api/affiliateFlatZone?type=All&_sort=createdDate&_order=DESC&_start=30&_end=20",with param on url
    Then I will get "0" items in the returned list




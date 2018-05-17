module.exports = {
  "id": "Fleet",
  "type": "object",
  "properties": {
    "_id": { "type": "string" },
    "fleetId": { "type": "string" },
    "ownerId": { "type": "string", "pattern": "^[a-f0-9]{24}$" },
    "generalSetting": {
      "type": "object",
      "properties": {
        "disableInvoicingReceipt": { "type": "boolean" },
        "notAllowMakeBookingWithoutAssignFare": { "type": "boolean" },
        "regAsCorpTraveler": { "type": "boolean" },
        "switchMapProvider": { "type": "boolean" },
        "soundNotify": { "type": "boolean" },
        "advanceInfoCorp": { "type": "boolean" },
        "showPromo": { "type": "boolean" },
        "flightAPIIntegration": { "type": "boolean" },
        "applyTollFeeAuto": { "type": "boolean" },
        "addBannerAds": { "type": "boolean" },
        "paxApp": {
          "type": "object",
          "properties": {
            "urlImage1": { "type": "string", "faker": "internet.url" },
            "action1": { "type": "string" },
            "txtAction1": { "type": "string" },
            "urlImage2": { "type": "string", "faker": "internet.url" },
            "action2": { "type": "string" },
            "txtAction2": { "type": "string" },
            "urlImage3": { "type": "string", "faker": "internet.url" },
            "action3": { "type": "string" },
            "txtAction3": { "type": "string" },
            "applyTo": { "type": "string" }
          }
        },
        "driverApp": {
          "type": "object",
          "properties": {
            "urlImage1": { "type": "string", "faker": "internet.url" },
            "action1": { "type": "string" },
            "txtAction1": { "type": "string" },
            "urlImage2": { "type": "string", "faker": "internet.url" },
            "action2": { "type": "string" },
            "txtAction2": { "type": "string" },
            "urlImage3": { "type": "string", "faker": "internet.url" },
            "action3": { "type": "string" },
            "txtAction3": { "type": "string" },
            "applyTo": { "type": "string" }
          }
        }
      }
    },
    "name": { "type": "string", "faker": "name.findName" },
    "address": { "type": "string", "faker": "address.secondaryAddress" },
    "paxAppName": { "type": "string" },
    "drvAppName": { "type": "string" },
    "email": { "type": "string", "format": "email" },
    "phone": { "type": "string", "faker": "phone.phoneNumberFormat" },
    "logo": { "type": "string", "faker": "internet.avatar" },
    "website": { "type": "string", "format": "hostname" },
    "timezone": { "type": "string" },
    "country": { "type": "string", "faker": "address.country" },
    "countryCode": { "type": "string", "faker": "address.countryCode" },
    "autoDisableDrv": { "type": "boolean" },
    "driverSettlement": { "type": "boolean" },
    "format24Hour": { "type": "boolean" },
    "affiliateEnvironment": { "type": "boolean" },
    "googleAddress": { "type": "integer" },
    "SPID": { "type": "string", "pattern": "^[a-f0-9]{24}$" },
    "kiosk": {
      "type": "object",
      "properties": {
        "enable": { "type": "boolean" },
        "backgroundImage": { "type": "string", "faker": "image.imageUrl" },
        "logoOnMap": { "type": "string", "faker": "image.imageUrl" },
        "logoImage": { "type": "string", "faker": "image.imageUrl" },
        "mainColor": { "type": "string", "faker": "commerce.color" },
        "secondColor": { "type": "string", "faker": "commerce.color" },
      }
    },
    "priority": { "type": "integer" },
    "currency": {
      "type": "object",
      "properties": {
        "iso": { "type": "string", "faker": "finance.currencyCode" },
        "symbol": { "type": "string", "faker": "finance.currencySymbol" }
      }
    },
    "password": {
      "type": "object",
      "properties": {
        "passenger": { "type": "boolean" },
        "driver": { "type": "boolean" },
        "smsVerifyDriver": { "type": "boolean" }
      }
    },
    "unitDistance": { "type": "string", "enum": ["mi", "km"] },
    "showEnterCard": { "type": "boolean" },

    "isActive": { "type": "boolean" },
    "forceCreditCardApp": { "type": "boolean" },
    "forceCreditCardWeb": { "type": "boolean" },
    "preAuthorized": {
      "type": "object",
      "properties": {
        "amount": { "type": "number", "faker": "commerce.price" },
        "isActive": { "type": "boolean" }
      }
    },
    "multiCurrencies": { "type": "boolean" },
    "driverAppAlert": { "type": "integer" },
    "paxAppAlert": { "type": "integer" },
    "currencies": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "iso": { "type": "string", "faker": "finance.currencyCode" },
          "symbol": { "type": "string", "faker": "finance.currencySymbol" }
        }
      }
    },
    "paymentClearanceHouses": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "type": { "type": "string", "chance": "cc_type" },
          "isActive": { "type": "boolean" },
          "gateway": { "type": "string" },
          "merchantId": { "type": "string" },
          "md5Key": { "type": "string" }
        }
      }
    },
    "smsGateway": { "type": "string" },
    "mapProviderId": { "type": "string" },
    "mapProvider": {
      "type": "object",
      "properties": {
        "passenger": { "type": "string" },
        "driver": { "type": "string" }
      }
    },
    "editAvatar": { "type": "boolean" },
    "bookNowLabel": { "type": "string" },
    "bookLaterLabel": { "type": "string" },
    "passenger": {
      "type": "object",
      "properties": {
        "homeHeading": { "type": "string" },
        "dispatch3rd": { "type": "boolean" },
        "partyLoc": { "type": "boolean" },
        "wrongPax": { "type": "boolean" },
        "showTrackLink": { "type": "boolean" },
        "showCompany": { "type": "boolean" },
        "showEstimatedFare": { "type": "boolean" },
        "drvRating": { "type": "integer", "minimum": 0, "maximum": 1 },
        "carRating": { "type": "boolean" }
      }
    },
    "fleetFareId": { "type": "string", "pattern": "^[a-f0-9]{24}$" },
    "appStore": { "type": "string" },
    "googlePlay": { "type": "string" },
    "appStoreDrv": { "type": "string" },
    "googlePlayDrv": { "type": "string" },
    "revision": {
      "type": "object",
      "properties": {
        "fareNormal": { "type": "number" },
        "fleetFare": { "type": "number" },
        "fareFlat": { "type": "number" },
        "fareLocation": { "type": "number" },
        "vehicleType": { "type": "number" }
      }
    },
    "isShowZipCode": { "type": "boolean" },
    "licensePlate": { "type": "boolean" },
    "additionalService": {
      "type": "object",
      "properties": {
        "fromAirport": {
          "type": "object",
          "properties": {
            "flightInfo": { "type": "boolean" },
            "meetDriver": { "type": "boolean" },
            "isActive": { "type": "boolean" }
          }
        },
        "toAirportNew": {
          "type": "object",
          "properties": {
            "flightInfo": { "type": "boolean" },
            "isActive": { "type": "boolean" }
          }
        },
        "toAirport": { "type": "boolean" },
        "hourly": { "type": "boolean" },
        "isActive": { "type": "boolean" }
      }
    },
    "shortestPathEstimation": { "type": "boolean" },
    "trackTrace": {
      "type": "object",
      "properties": {
        "navColor": { "type": "string", "faker": "commerce.color" },
        "track": {
          "type": "object",
          "properties": {
            "trackURL": { "type": "string", "faker": "internet.url" },
            "isActive": { "type": "boolean" }
          }
        }
      }
    },
    "carHailing": { "type": "boolean" },
    "standInQueue": { "type": "boolean" },
    "hardwareMeter": { "type": "boolean" },
    "fleetType": { "type": "string" },
    "editTip": { "type": "boolean" },
    "webBooking": {
      "type": "object",
      "properties": {
        "mainColor": { "type": "string", "faker": "commerce.color" },
        "secondColor": { "type": "string", "faker": "commerce.color" },
        "backgroundDesktop": { "type": "string", "faker": "image.imageUrl" },
        "backgroundMobile": { "type": "string", "faker": "image.imageUrl" }
      }
    },
    "language": { "type": "string" },
    "mDispatcher": {
      "type": "object",
      "properties": {
        "assignDriver": { "type": "boolean" },
        "queueList": { "type": "boolean" }
      }
    },
    "forceCreditCardMDispatcher": { "type": "boolean" },
    "multipleOptions": { "type": "integer" },
    "emailNotifications": { "type": "boolean" },
    "arrive": {
      "type": "object",
      "properties": {
        "isLimited": { "type": "boolean" },
        "value": { "type": "number", "faker": "commerce.price" }
      }
    },
    "tripNotification": {
      "type": "object",
      "properties": {
        "spendingOver": { "type": "number", "minimum": 0 },
        "enable": { "type": "boolean" },
        "trips": { "type": "integer", "minimum": 0 }
      }
    },
    "socialMedia": {
      "type": "object",
      "properties": {
        "sendReferralsCodeSubject": { "type": "string" },
        "sendReferralsCode": { "type": "string" },
        "sendReferFriendsSubject": { "type": "string" },
        "sendReferFriends": { "type": "string" },
        "defaultServer": { "type": "boolean" }
      }
    },
    "fleetDeduction": {
      "type": "object",
      "properties": {
        "enableTax": { "type": "boolean" },
        "transactionFee": {
          "type": "object",
          "properties": {
            "enable": { "type": "boolean" },
            "creditCardAmount": { "type": "number", "faker": "commerce.price" },
            "creditCardPercent": { "type": "number", "faker": "commerce.price" },
            "directBillingAmount": { "type": "number", "faker": "commerce.price" },
            "directBillingPercent": { "type": "number", "faker": "commerce.price" },
            "externalCardAmount": { "type": "number", "faker": "commerce.price" },
            "externalCardPercent": { "type": "number", "faker": "commerce.price" },
            "B2BTerminalAmount": { "type": "number", "faker": "commerce.price" },
            "B2BTerminalPercent": { "type": "number", "faker": "commerce.price" }
          }
        }
      }
    },
    "etaDistanceByGPS": { "type": "boolean" },
    "ccType": { "type": "string" },
    "textColor": { "type": "string", "faker": "commerce.color" },
    "inbox": {
      "type": "object",
      "properties": {
        "isDefaultServer": { "type": "boolean" },
        "sendPromo": { "type": "string" },
        "sendPromoSubject": { "type": "string" },
        "sendReferralCredit": { "type": "string" },
        "sendReferralCreditSubject": { "type": "string" }
      }
    },
    "packages": {
      "type": "object",
      "properties": {
        "name": { "type": "string" },
        "packageId": { "type": "string", "pattern": "^[a-f0-9]{24}$" }
      }
    },
    "oneOnDemand": { "type": "boolean" },
    "corporate": {
      "type": "object",
      "properties": {
        "enableModules": { "type": "boolean" },
        "travellerSignature": { "type": "boolean" },
        "rating": { "type": "boolean" },
        "trackingLog": { "type": "boolean" },
        "corporateCard": { "type": "boolean" },
        "corporatePrepaid": { "type": "boolean" }
      }
    },
    "about": {
      "type": "object",
      "properties": {
        "paxApp": {
          "type": "object",
          "properties": {
            "isDefault": { "type": "boolean" },
            "url": { "type": "string", "faker": "internet.url" }
          }
        },
        "drvApp": {
          "type": "object",
          "properties": {
            "isDefault": { "type": "boolean" },
            "url": { "type": "string", "faker": "internet.url" }
          }
        },
        "mDispatcherApp": {
          "type": "object",
          "properties": {
            "isDefault": { "type": "boolean" },
            "url": { "type": "string", "faker": "internet.url" }
          }
        }
      }
    }
  }
}

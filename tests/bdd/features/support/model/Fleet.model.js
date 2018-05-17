/**
 * Copyright (c) 2016 QUp World Inc. All Rights Reserved.
 *
 * This document contains proprietary and confidential information of QUp World.
 * It may not be used for any other purposes, reproduced in whole or in part, nor passed to any organization or person
 * without the specific permission in writing of the Technical Director, QUp World.
 *
 * @author QUp World
 *
 * @see http://qupworld.com/terms
 * @see http://qupworld.com/privacy
 *
 * Description
 *
 */
var Promise = require('bluebird');
var mongoose = require('mongoose');
mongoose.Promise = Promise;
var Schema = mongoose.Schema;

var paymentObject = new Schema({
  type: String,
  isActive: Boolean,
  gateway: String,
  merchantId: String,
  md5Key: String
}, { _id: false });

var corporateSettingSchema = new Schema({
  "enableModules": {
    type: Boolean,
    default: false
  },
  "travellerSignature": {
    type: Boolean,
    default: false
  },
  "rating": {
    type: Boolean,
    default: false
  },
  "trackingLog": {
    type: Boolean,
    default: false
  },
  "corporateCard": {
    type: Boolean,
    default: false
  },
  "corporatePrepaid": {
    type: Boolean,
    default: false
  }
}, { _id: false });

var aboutSchema = new Schema({
  "paxApp": {
    "isDefault": Boolean,
    "url": String
  },
  "drvApp": {
    "isDefault": Boolean,
    "url": String
  },
  "mDispatcherApp": {
    "isDefault": Boolean,
    "url": String
  }
}, { _id: false })

var fleetSchema = new Schema({
  "_id": String,
  "fleetId": String,
  "ownerId": {
    type: String,
    ref: 'User'
  },
  "generalSetting": {
    "disableInvoicingReceipt": {
      type: Boolean,
      default: false
    },
    "notAllowMakeBookingWithoutAssignFare": Boolean,
    "regAsCorpTraveler": {
      type: Boolean,
      default: false
    },
    "switchMapProvider": Boolean,
    "soundNotify": Boolean,
    "advanceInfoCorp": Boolean,
    "showPromo": Boolean,
    "flightAPIIntegration": Boolean,
    "applyTollFeeAuto": Boolean,
    "addBannerAds": Boolean,
    "paxApp": {
      "urlImage1": String,
      "action1": String,
      "txtAction1": String,
      "urlImage2": String,
      "action2": String,
      "txtAction2": String,
      "urlImage3": String,
      "action3": String,
      "txtAction3": String,
      "applyTo": String
    },
    "driverApp": {
      "urlImage1": String,
      "action1": String,
      "txtAction1": String,
      "urlImage2": String,
      "action2": String,
      "txtAction2": String,
      "urlImage3": String,
      "action3": String,
      "txtAction3": String,
      "applyTo": String
    }
  },
  "name": String,
  "address": String,
  "paxAppName": String,
  "drvAppName": String,
  "email": String,
  "phone": String,
  "logo": String,
  "website": String,
  "timezone": String,
  "country": String,
  "countryCode": String,
  "autoDisableDrv": Boolean,
  "driverSettlement": Boolean,
  "format24Hour": Boolean,
  "affiliateEnvironment": Boolean,
  "googleAddress": Number,
  "SPID": {
    type: String,
    ref: 'SolutionPartner'
  },
  "kiosk": {
    "enable": Boolean,
    "backgroundImage": String,
    "logoOnMap": String,
    "logoImage": String,
    "mainColor": String,
    "secondColor": String
  },
  "priority": Number,
  "currency": {
    "iso": { "type": String },
    "symbol": { "type": String }
  },
  "password": {
    "passenger": Boolean,
    "driver": Boolean,
    "smsVerifyDriver": Boolean
  },
  "unitDistance": String,
  "showEnterCard": Boolean,

  "isActive": Boolean,
  "forceCreditCardApp": Boolean,
  "forceCreditCardWeb": Boolean,
  "preAuthorized": {
    "amount": Number,
    "isActive": Boolean
  },
  "multiCurrencies": Boolean,
  "driverAppAlert": Number,
  "paxAppAlert": Number,
  "currencies": Array,
  "paymentClearanceHouses": [paymentObject],
  "smsGateway": String,
  "mapProviderId": String,
  "mapProvider": {
    "passenger": String,
    "driver": String
  },
  "editAvatar": {
    type: Boolean,
    default: true
  },
  "bookNowLabel": String,
  "bookLaterLabel": String,
  "passenger": {
    "homeHeading": String,
    "dispatch3rd": Boolean,
    "partyLoc": Boolean,
    "wrongPax": Boolean,
    "showTrackLink": Boolean,
    "showCompany": Boolean,
    "showEstimatedFare": Boolean,
    "drvRating": Number,
    "carRating": Boolean
  },
  "fleetFareId": {
    type: Schema.Types.ObjectId,
    ref: 'FleetFare'
  },
  "appStore": String,
  "googlePlay": String,
  "appStoreDrv": String,
  "googlePlayDrv": String,
  "revision": {
    "fareNormal": Number,
    "fleetFare": Number,
    "fareFlat": Number,
    "fareLocation": Number,
    "vehicleType": Number
  },
  "__v": Number,
  "isShowZipCode": {
    type: Boolean,
    default: false
  },
  "licensePlate": {
    type: Boolean,
    default: false
  },
  "additionalService": {
    "fromAirport": {
      "flightInfo": {
        type: Boolean,
        default: false
      },
      "meetDriver": {
        type: Boolean,
        default: false
      },
      "isActive": {
        type: Boolean,
        default: false
      }
    },
    "toAirportNew": {
      "flightInfo": {
        type: Boolean,
        default: false
      },
      "isActive": {
        type: Boolean,
        default: false
      }
    },
    "toAirport": {
      type: Boolean,
      default: false
    },
    "hourly": {
      type: Boolean,
      default: false
    },
    "isActive": {
      type: Boolean,
      default: false
    }
  },
  "shortestPathEstimation": {
    type: Boolean,
    default: false
  },
  "trackTrace": {
    "navColor": String,
    "track": {
      "trackURL": {
        type: String,
        default: ''
      },
      "isActive": {
        type: Boolean,
        default: true
      }
    }
  },
  "carHailing": {
    type: Boolean,
    default: false
  },
  "standInQueue": {
    type: Boolean,
    default: false
  },
  "hardwareMeter": {
    type: Boolean,
    default: false
  },
  "fleetType": String,
  "editTip": {
    type: Boolean,
    default: false
  },
  "webBooking": {
    "mainColor": String,
    "secondColor": String,
    "backgroundDesktop": String,
    "backgroundMobile": String
  },
  "language": {
    type: String,
    default: 'en'
  },
  "mDispatcher": {
    "assignDriver": {
      type: Boolean,
      default: false
    },
    "queueList": {
      type: Boolean,
      default: false
    }
  },
  "forceCreditCardMDispatcher": {
    type: Boolean,
    default: false
  },
  "multipleOptions": {
    type: Number,
    default: 0
  },
  "emailNotifications": Boolean,
  "arrive": {
    isLimited: {
      type: Boolean,
      default: true
    },
    value: {
      type: Number,
      default: 30
    }
  },
  "tripNotification": {
    "spendingOver": Number,
    "enable": Boolean,
    "trips": Number
  },
  "socialMedia": {
    "sendReferralsCodeSubject": String,
    "sendReferralsCode": String,
    "sendReferFriendsSubject": String,
    "sendReferFriends": String,
    "defaultServer": Boolean
  },
  "fleetDeduction": {
    enableTax: Boolean,
    transactionFee: {
      enable: Boolean,
      creditCardAmount: Number,
      creditCardPercent: Number,
      directBillingAmount: Number,
      directBillingPercent: Number,
      externalCardAmount: Number,
      externalCardPercent: Number,
      B2BTerminalAmount: Number,
      B2BTerminalPercent: Number
    }
  },
  "etaDistanceByGPS": Boolean,
  "ccType": {
    type: String,
    default: 'Default'
  },
  "textColor": String,
  "inbox": {
    "isDefaultServer": {
      type: Boolean,
      default: true
    },
    "sendPromo": String,
    "sendPromoSubject": String,
    "sendReferralCredit": String,
    "sendReferralCreditSubject": String
  },
  "packages": {
    "name": {
      type: String,
      trim: true
    },
    "packageId": {
      type: String,
      trim: true
    }
  },
  "oneOnDemand": {
    type: Boolean,
    default: false
  },
  "corporate": corporateSettingSchema,
  "about": aboutSchema
}, {
  "collection": 'Fleet',
  "timestamps": {
    "createdAt": "createdDate",
    "updatedAt": "latestUpdate"
  }
});

module.exports = mongoose.model('Fleet', fleetSchema);

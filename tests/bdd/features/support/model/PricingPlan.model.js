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

var pricingPlanSchema = new Schema({
  "fleetId": {
    "type": String,
    "ref": "Fleet"
  },
  "withinZone": {
    "fleetType": String,
    "techFeeType": String,
    "techFeeValue": Number,
    "ccPayToFleet": Boolean,
    "qupFeeAmount": Number,
    "qupFeePercentage": Number,
    "driverMonthlyFee": Number,
    "carMonthlyFee": Number,
    "techFeeActive": Boolean,
    "techFee": {
      "commandCenter": Number,
      "paxApp": Number,
      "webBooking": Number,
      "mDispatcher": Number,
      "carHailing": Number,
      "kiosk": Number
    },
    "techFeeByCurrencies": Array
  },
  "hwMetered": Boolean,
  "vipPax": Boolean,
  "bookingsLimitation": {
    "id": String,
    "name": String
  },
  "dispatchRadius": {
    type: Number,
    default: 0
  },
  "ccHandle": Number,
  "isActive": Boolean,
  "affiliate": {
    "dispatching": Boolean,
    "fleets": Array,
    "onlyTopDrvReceiveBook": Boolean,
    "receiveAffiliateBooking": Boolean,
    "falseshowPriceDOAffiliate": Boolean,
    "homeFleetCommission": Number
  },
  "createdDate": {
    "type": Date,
    "default": Date.now
  },
  "latestUpdate": {
    "type": Date,
    "default": Date.now
  },
  "qrImage": String,
  "qrName": String,
  "driverDeposit": {
    "enable": Boolean
  },
  "rideSharingRadius": {
    "type": Number,
    "default": 0
  },
}, {
  "collection": "PricingPlan",
  "timestamps": {
    "createdAt": "createdDate",
    "updatedAt": "latestUpdate"
  }
});

module.exports = mongoose.model("PricingPlan", pricingPlanSchema);

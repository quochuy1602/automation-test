var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var AffiliateHourlyRateSchema = Schema({
  "rateInfo":{
    "name": {
      "type": String,
      "trim":true
    },
    "priceType": {
      "type": String,
      "required": true,
      "trim":true,
      "default":"sellPrice" //buyPrice
    },
    "currency" : {
      "symbol": {
        "type": String,
        "default": '$'
      },
      "iso": {
        "type": String,
        "default": 'USD'
      }
    }
  },
  "type":{
    "type": String,
    "required": true,//General,Flat,Hourly
  },

  "isActive":{
    "type": Boolean,
    "default": false
  },
  "userId":{
    "type":String,
  },
  "createdDate": {
    "type": Date,
    "default": Date.now
  },
  "latestUpdate": {
    "type": Date,
    "default": Date.now
  },
  "cancellationPolicy":{
    "onDemand":{
      "isActive":{
        "type": Boolean,
        "default":false
      },
      "value":{
        "type": Number,
        "default":0
      }
    },
    "inAdvance":{
      "isActive":{
        "type": Boolean,
        "default":false
      },
      "value":{
        "type": Number,
        "default":0
      }
    }
  },
  "noShowPolicy":{
    "penalty":{
      "type": Number,
      "default":0
    }
  },

},{collection: "AffiliateRate"});

module.exports = mongoose.model('AffiliateHourlyRate', AffiliateHourlyRateSchema);


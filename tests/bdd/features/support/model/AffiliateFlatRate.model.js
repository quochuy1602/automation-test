var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var AffiliateFlatRateSchema = Schema({
  "rateInfo":{
    "name": {
      "type": String,
      "required": true,
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
    "default": true
  },
  "userId":{
    "type":String
  },
  "createdDate": {
    "type": Date,
    "default": Date.now
  },
  "latestUpdate": {
    "type": Date,
    "default": Date.now
  },
  "noShowPolicy" : {
    "penalty" : {
      "type": Number,
      "required": true
    }
  },
  "cancellationPolicy" : {
    "onDemand" : {
      "isActive" : Boolean,
      "value" : {
        "type": Number,
        "required": true
      }
    },
    "inAdvance" : {
      "isActive" : Boolean,
      "value" : {
        "type": Number,
        "required": true
      }
    }
  }

},{collection: "AffiliateRate"});

module.exports = mongoose.model('AffiliateFlatRate', AffiliateFlatRateSchema);


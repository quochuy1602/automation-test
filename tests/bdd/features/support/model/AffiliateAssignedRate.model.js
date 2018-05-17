var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var AffiliateAssignedRateSchema = Schema({
  "zone" : {
    "id" : {
      "type": String,
      "required": true
    },
    "name" : {
      "type": String,
      "default":  "",
      "required": true
    },
    "fleetId" : {
      "type": String,
      "required": true
    }
  },
  "rate" : {
    "id" : {
      "type": String,
      "required": true
    },
    "name" : {
      "type": String,
      "default":  "",
      "required": true
    }
  },
  "priceType" : {
    "type": String,
    "default":  "",//sellPrice/buyPrice/generalPrice
  },
  "type" :{
    "type": String,
    "default":  "General", // Regular,Flat, Hourly , General
    "required": true,
    index:true
  } ,
  "carTypeId" : {
    "type": String,
    "default":  "",
    "required": true
  },
  "currency" : {
    "symbol": {
      "type": String,
      "default": '$'
    },
    "iso": {
      "type": String,
      "default": 'USD'
    },
  },
  "fleetId" : {
    "type": String,
    "default":  "", // if fleetId equal "" then model is default
    index:true
  },
  "createdDate": {
    "type": Date,
    "default": Date.now
  },
  "latestUpdate": {
    "type": Date,
    "default": Date.now
  }
},{collection: "AffiliateAssignedRate"});

module.exports = mongoose.model('AffiliateAssignedRate', AffiliateAssignedRateSchema);

var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var AffiliateRateSchema = Schema({
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
    },
    "unitDistance":String
  },
  "type":{
    "type": String,
    "required": true,//General,Flat,Hourly
  },

  "isActive":{
    "type": Boolean,
    "required": true
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
  "starting":{
    "now": {
      "type": Number,
      "required": true
    },
    "reservation": {
      "type": Number,
      "required": true
    }
  },
  "firstDistance":{
    "from": {
      "type": Number,
    },
    "to":{
      "type": Number,
      "required": true
    },
    "fee" :{
      "type": Number,
      "required": true
    }
  },
  "secondDistance":{
    "from": {
      "type": Number,
      "required": true
    },
    "to":{
      "type": Number,
      "required": true
    },
    "fee" :{
      "type": Number,
      "required": true
    }
  },
  "minimum":{
    "now" :{
      "type": Number,
      "required": true
    },
    "reservation":{
      "type": Number,
      "required": true
    }
  },
  "cancellationPolicy":{
    "onDemand":{
      "isActive":{
        "type": Boolean,
        "required": true
      },
      "value":{
        "type": Number,
        "required": true
      }
    },
    "inAdvance":{
      "isActive":{
        "type": Boolean,
        "required": true
      },
      "value":{
        "type": Number,
        "required": true
      }
    }
  },
  "noShowPolicy":{
    "penalty":{
      "type": Number,
      "required": true
    }
  },
  "afterSecondDistance":{
    "feeAfterSecondDistance":{
      "type": Number,
      "required": true
    }
  },
  "perMinute": {
    "feePerMinute": {
      "type": Number,
      "required": true
    }
  }

},{collection: "AffiliateRate"});



module.exports = mongoose.model('AffiliateRate', AffiliateRateSchema);


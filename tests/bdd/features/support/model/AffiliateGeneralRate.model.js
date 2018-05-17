var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var rushHourSchema = new Schema({
  "id":{"type":String},
  "name": {"type":String,"trim":true},
  "date": {"type":Array},
  "start": {"type":String},
  "end": {"type":String},
  "timeCal": {"type":Number},
  "surcharge": {"type":Number}
});

var AffiliateGeneralRateSchema = Schema({
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
  "userId":{
    "type":String,
  },
  "airport":{
    "fromAirportActive":{
      "type": Boolean,
      "default":false
    },
    "fromAirport":{
      "type": Number,
      "default":0
    },
    "toAirportActive":{
      "type": Boolean,
      "default":false
    },
    "toAirport":{
      "type": Number,
      "default":0
    }
  },
  "meetDriver":{
    "onCurb":{
      "type": Number,
      "default":0
    },
    "meetDrv":{
      "type": Number,
      "default":0
    }
  },
  "otherFees":{
    "enable":{
      "type": Boolean,
      "default":false
    },
    "edit":{
      "type": Boolean,
      "default":false
    },
    "addNote":{
      "type": Boolean,
      "default":false
    }
  },
  "heavyTraffic":{
    "enable":{
      "type": Boolean,
      "default":false
    },
    "surcharge":{
      "type": Number,
      "default":0
    }
  },
  "tax":{
    "enable":{
      "type": Boolean,
      "default":false
    },
    "surcharge":{
      "type": Number,
      "default":0
    }
  },
  "tip":{
    "enable":{
      "type": Boolean,
      "default":false
    },
    "value":{
      "type": Number,
      "default":0
    }
  },
  "techFee":{
    "enable":{
      "type": Boolean,
      "default":false
    },
    "commandCenter":{
      "type": Number,
      "default":0
    },
    "paxApp":{
      "type": Number,
      "default":0
    },
    "webBooking":{
      "type": Number,
      "default":0
    }
  },
  "rushHour":{
    "type": Boolean,
    "default":false
  },
  "rushHours":[rushHourSchema],
  "tollFee":{
    "type": Boolean,
    "default":false
  },
  // end
  "isActive":{
    "type": Boolean,
    "default":false
  },
  "createdDate": {
    "type": Date,
    "default": Date.now
  },
  "latestUpdate": {
    "type": Date,
    "default": Date.now
  }

},{collection: "AffiliateRate"});

AffiliateGeneralRateSchema.virtual('id').get(function() {
  return this._id.toString();
});
AffiliateGeneralRateSchema.set('toJSON', { virtuals: true } );

module.exports = mongoose.model('AffiliateGeneralRate', AffiliateGeneralRateSchema);


var AffiliateGeneralRateSchema = {
  "id": "AffiliateGeneralRate",
  "type": 'object',
  "properties": {
    "_id": { "type": "string", "pattern": "^[0-9a-f]{24}$" },
    "rateInfo": {
      "type":"object",
      "properties":{
        "name":{"type": "string"},
        "priceType":{"type": "string"},
        "currency":{
          "symbol":{"type": "string", "faker": "finance.currencySymbol"},
          "iso":{"type": "string", "faker": "finance.currencyCode"},
        }
      }
    },
    "type": { "type": "string" },
    "isActive": { "type": "boolean"},
    "userId": { "type": "string"},
    "airport":{
      "type":"object",
      "properties": {
        "fromAirportActive": {
          "type": "boolean", "faker": "random.boolean"
        },
        "fromAirport": {
          "type": "number", "faker": "random.number"
        },
        "toAirportActive": {
          "type": "boolean", "faker": "random.boolean"
        },
        "toAirport": {
          "type": "number", "faker": "random.number"
        }
      }
    },
    "meetDriver":{
      "type":"object",
      "properties": {
        "onCurb": {
          "type": "number", "faker": "random.number"
        },
        "meetDrv": {
          "type": "number", "faker": "random.number"
        }
      }
    },
    "otherFees":{
      "type":"object",
      "properties": {
        "enable": {
          "type": "boolean", "faker": "random.boolean"
        },
        "edit": {
          "type": "boolean", "faker": "random.boolean"
        },
        "addNote": {
          "type": "boolean", "faker": "random.boolean"
        }
      }
    },
    "heavyTraffic":{
      "type":"object",
      "properties": {
        "enable": {
          "type": "boolean", "faker": "random.boolean"
        },
        "surcharge": {
          "type": "number", "faker": "random.number"
        }
      }
    },
    "tax":{
      "type":"object",
      "properties": {
        "enable": {
          "type": "boolean", "faker": "random.boolean"
        },
        "surcharge": {
          "type": "number", "faker": "random.number"
        }
      }
    },
    "tip":{
      "type":"object",
      "properties": {
        "enable": {
          "type": "boolean", "faker": "random.boolean"
        },
        "value": {
          "type": "number", "faker": "random.number"
        }
      }
    },
    "techFee":{
      "type":"object",
      "properties": {
        "enable": {
          "type": "boolean", "faker": "random.boolean"
        },
        "commandCenter": {
          "type": "number", "faker": "random.number"
        },
        "paxApp": {
          "type": "number", "faker": "random.number"
        },
        "webBooking": {
          "type": "number", "faker": "random.number"
        }
      }
    },
    "rushHour":{
      "type": "boolean", "faker": "random.boolean"
    },
    "rushHours":{
      "type":Array,
      "properties":{
        "id":{"type":"string"},
        "name": {"type":"string",},
        "date": {"type":Array},
        "start": {"type":"string",},
        "end": {"type":"string",},
        "timeCal": {"type":"number"},
        "surcharge": {"type":"number"}
      }
    },
    "tollFee":{
      "type": "boolean", "faker": "random.boolean"
    },
    // end
    "isActive":{
      "type": "boolean", "faker": "random.boolean"
    },
    "createdDate": { "type": "string", "format": "date-time" },
    "latestUpdate": { "type": "string", "format": "date-time" }
  }
}
module.exports = AffiliateGeneralRateSchema

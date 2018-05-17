var AffiliateRateSchema = {
  "id": "AffiliateRate",
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
        },
        "unitDistance":{type:"string"}
      }
    },
    "type": { "type": "string" },
    "isActive": { "type": "boolean"},
    "userId": { "type": "string"},
    "starting": {
      "type":"object",
      "properties": {
        "now": {"type": "number", "faker": "random.number"},
        "reservation": {"type": "number", "faker": "random.number"},
      }
    },
    "firstDistance": {
      "type":"object",
      "properties": {
        "from": {"type": "number", "faker": "random.number"},
        "to": {"type": "number", "faker": "random.number"},
        "fee": {"type": "number", "faker": "random.number"},
      }
    },
    "secondDistance": {
      "type":"object",
      "properties": {
        "from": {"type": "number", "faker": "random.number"},
        "to": {"type": "number", "faker": "random.number"},
        "fee": {"type": "number", "faker": "random.number"},
      }
    },
    "minimum": {
      "type":"object",
      "properties": {
        "now": {"type": "number", "faker": "random.number"},
        "reservation": {"type": "number", "faker": "random.number"},
      }
    },
    "cancellationPolicy": {
      "type":"object",
      "properties": {
        "onDemand":{
          "type":"object",
          "properties": {
            "isActive": {"type": "boolean", "faker": "random.boolean"},
            "value": {"type": "number", "faker": "random.number"},
          }
        },
        "inAdvance":{
          "type":"object",
          "properties": {
            "isActive": {"type": "boolean", "faker": "random.boolean"},
            "value": {"type": "number", "faker": "random.number"},
          }
        }

      }
    },
    "noShowPolicy": {
      "type":"object",
      "properties": {
        "penalty": {"type": "number", "faker": "random.number"},
      }
    },
    "afterSecondDistance": {
      "type":"object",
      "properties": {
        "feeAfterSecondDistance": {"type": "number", "faker": "random.number"},
      }
    },
    "perMinute": {
      "type":"object",
      "properties": {
        "feePerMinute": {"type": "number", "faker": "random.number"},
      }
    },
    "createdDate": { "type": "string", "format": "date-time" },
    "latestUpdate": { "type": "string", "format": "date-time" }
  }
}

module.exports = AffiliateRateSchema

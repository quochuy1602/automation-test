var AffiliateFlatRateSchema = {
  "id": "AffiliateFlatRate",
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
    "createdDate": { "type": "string", "format": "date-time" },
    "latestUpdate": { "type": "string", "format": "date-time" }
  }
}

module.exports = AffiliateFlatRateSchema

var AffiliateAssignedRate = {
  "id": "AffiliateAssignedRate",
  "type": 'object',
  "properties": {
    "_id": { "type": "string", "pattern": "^[0-9a-f]{24}$" },
    "zone": {
      "type":"object",
      "properties":{
        "id":{"type": "string", "pattern": "^[0-9a-f]{24}$"},
        "name":{"type": "string"},
        "fleetId":{"type": "string"}
      }
    },
    "rate": {
      "type":"object",
      "properties":{
        "id":{"type": "string", "pattern": "^[0-9a-f]{24}$"},
        "name":{"type": "string"}
      }
    },
    "type": { "type": "string" },
    "priceType": { "type": "string"},
    "carTypeId": { "type": "string"},
    "fleetId": { "type": "string"},
    "currency": {
      "type":"object",
      "properties": {
        "symbol":{"type": "string", "faker": "finance.currencySymbol"},
        "iso":{"type": "string", "faker": "finance.currencyCode"},
      }
    },
    "createdDate": { "type": "string", "format": "date-time" },
    "latestUpdate": { "type": "string", "format": "date-time" }
  }
}

module.exports = AffiliateAssignedRate

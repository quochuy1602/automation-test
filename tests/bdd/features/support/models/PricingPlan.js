var PricingPlan = {
  "id": "PricingPlan",
  "type": 'object',
  "properties": {
    "_id": { "type": "string", "pattern": "^[0-9a-f]{24}$" },
    "zoneName": { "type": "string", "faker": "internet.zoneName" },
    "fleetId": { "type": "string" },
    "oneOnDemand": { "type": "boolean","faker": "random.boolean" },
    "affiliate": {
      "type": "object",
      "properties": {
        "dispatching": { "type": "boolean","faker": "random.boolean" },
        "fleets": { "type": "array" },
        "onlyTopDrvReceiveBook": { "type": "boolean","faker": "random.boolean" },
        "receiveAffiliateBooking": { "type": "boolean","faker": "random.boolean" },
        "falseshowPriceDOAffiliate": { "type": "boolean","faker": "random.boolean" },
        "homeFleetCommission": { "type": "number","faker": "random.number" }
      }
    },
    "createdDate": { "type": "string", "format": "date-time" },
    "latestUpdate": { "type": "string", "format": "date-time" }
  }
}

module.exports = PricingPlan

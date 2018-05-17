
var AffiliationCarTypeSchema = {
  "id": "AffiliationCarType",
  "type": 'object',
  "properties": {
    "_id": { "type": "string", "pattern": "^[0-9a-f]{24}$" },
    name: {
      "type": "string",
    },
    iconOnMap: {
      "type": "string",
    },
    iconSlider: {
      "type": "string",
    },
    showOnMap:{"type": "boolean", "faker": "random.boolean"},
    destinationRequired:{"type": "boolean", "faker": "random.boolean"},
    no: {
      "type": "number",
    },
    isActive:{"type": "boolean", "faker": "random.boolean"},
    "createdDate": { "type": "string", "format": "date-time" },
    "latestUpdate": { "type": "string", "format": "date-time" }
  }

}
module.exports = AffiliationCarTypeSchema


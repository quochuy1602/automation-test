var FZoneSchema = {
  "id": "FZone",
  "type": 'object',
  "properties": {
    "_id": { "type": "string", "pattern": "^[0-9a-f]{24}$" },
    "zoneName": { "type": "string", "faker": "internet.zoneName" },
    "fleetId": { "type": "string" },
    "geo":{
      "coordinates":{
        "type":"array",
      },
      "type":{"type": "string"}
    },
    "createdDate": { "type": "string", "format": "date-time" },
    "latestUpdate": { "type": "string", "format": "date-time" }
  }
}

module.exports = FZoneSchema

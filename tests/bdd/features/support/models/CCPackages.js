var CCPackages = {
  "id": "CCPackages",
  "type": 'object',
  "properties": {
    "_id": { "type": "string", "pattern": "^[0-9a-f]{24}$" },
    "name": { "type": "string", "faker": "internet.zoneName" },
    "fleetId": { "type": "string" },
    "modules":{"type": "array"},
    "isActive": { "type": "boolean"},
    "createdDate": { "type": "string", "format": "date-time" },
    "latestUpdate": { "type": "string", "format": "date-time" }
  }
}

module.exports = CCPackages

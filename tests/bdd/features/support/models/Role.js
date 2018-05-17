var Roles ={
  "id": "Roles",
  "type": 'object',
  "properties": {
    "_id": {"type": "string", "pattern": "^[0-9a-f]{24}$"},
    name: {
      type: "string"
    },
    fleetId: {
      type: "string"
    },
    modules: {
      type: "array"
    },
    isActive: {
      type: "boolean",
      "type": "boolean","faker": "random.boolean"
    },
    isAdmin: {
      type: "boolean",
      "type": "boolean","faker": "random.boolean"
    },
    "createdDate": { "type": "string", "format": "date-time" },
    "latestUpdate": { "type": "string", "format": "date-time" }
  }
}

module.exports = Roles

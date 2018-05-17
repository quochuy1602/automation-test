var UsersSystemSchema = {
    "id": "UsersSystem",
    "type": 'object',
    "properties": {
      "_id": { "type": "string", "pattern": "^[0-9a-f]{24}$" },
      "userName": { "type": "string", "faker": "internet.userName" },
      "password": { "type": "string", "faker": "internet.password" },
      "createdDate": { "type": "string", "format": "date-time" },
      "latestUpdate": { "type": "string", "format": "date-time" }
    }
  }

module.exports = UsersSystemSchema

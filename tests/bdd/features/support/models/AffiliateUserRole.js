var AffiliateUserRoleSchema = {
  "id": "AffiliateUserRole",
  "type": 'object',
  "properties": {
    "_id": { "type": "string", "pattern": "^[0-9a-f]{24}$" },
    "userId": { "type": "string", "faker": "internet.userId" },
    "userName": { "type": "string", "faker": "internet.userName" },
    "firstName": { "type": "string", "faker": "internet.firstName" },
    "lastName": { "type": "string", "faker": "internet.lastName" },
    "email": { "type": "string", "faker": "internet.email" },
    "permission": { "type": "object"},
    "createdDate": { "type": "string", "format": "date-time" },
    "latestUpdate": { "type": "string", "format": "date-time" }
  }
}

module.exports = AffiliateUserRoleSchema

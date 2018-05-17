var { setWorldConstructor } = require('cucumber')
var request = require('supertest')
var mongoose = require('mongoose')
var api = require('./api')
var config = require('config');
var _ = require('lodash');
var schemas = require('./models');
var jsf = require('json-schema-faker');
var Chance = require("chance");
var config_data = require('../../../../config-data.json');
chance = new Chance();

jsf.option({
  alwaysFakeOptionals: true
});
jsf.extend('faker', function () {
  return require('faker');
});
jsf.extend('chance', function () {
  return chance;
});

function CustomWorld() {
  this.baseHost = config_data.reportAPI.host + config_data.reportAPI.port;
  this.request = request(this.baseHost);
  this.mongoose = mongoose;
  this.mongoHost = config_data.mongo.host;
  this.api = api;
  this.storage = {};
  Object.keys(schemas).forEach(function (collection) {
    require("./model/" + collection+".model.js");
  });
  var createSchema = function (type, extension) {
    var schemaMapping = _.keyBy(schemas, 'id')
    var schemaSet = _.cloneDeep(schemaMapping[type]);
    if (_.isObject(extension) && !_.isEmpty(extension)) {
      var i = 0;
      var keys = Object.keys(extension);
      var length = keys.length;
      for (; i < length; i++) {
        if (extension[keys[i]].properties != null) {
          schemaSet.properties = _.defaultsDeep(extension, schemaSet.properties);
          break;
        }
      }
      if (i == length) schemaSet.properties = _.defaults(extension, schemaSet.properties);
    }
    return schemaSet;
  };

  this.randomDataObject = function (type, extension, count) {
    count = (count > 0) ? count : 1;
    var result = [];

    var schema = createSchema(type, extension);

    false && debuglog.isEnabled && debuglog(' - schema: %s', JSON.stringify(schema));

    for (var i = 0; i < count; i++) {
      result.push(jsf(schema));
    }
    return result;
  }

  this.parseDataTable = function (objectArray) {
    objectArray = objectArray || [];
    return _.map(objectArray, function (object) {
      try {
        return {
          total: parseInt(object.total),
          extension: JSON.parse(object.extension)
        }
      } catch (exception) {
        return {
          total: 0,
          extension: {}
        }
      }
    });
  };

  this.parseJsonObjectTables = function (objectArray) {
    objectArray = objectArray || [];
    return _.map(objectArray, function (object) {
      return _.mapValues(object, function (value) {
        return JSON.parse(value);
      })
    });
  };
}

setWorldConstructor(CustomWorld)

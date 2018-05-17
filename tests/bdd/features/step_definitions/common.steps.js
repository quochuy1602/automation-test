var assert = require('chai').assert;
var crypto = require('crypto')
var Promise = require('bluebird');
var _ = require('lodash');
var debuglog = require('debug');
var { Given, When, Then ,setDefaultTimeout} = require('cucumber')

setDefaultTimeout(60 * 1000);

Given(/^The mongodb is connected$/, function (callback) {
  var self = this;
  if (this.mongoose.connection.readyState == 1) {
    self.db = self.mongoose.connection;
    return callback(null, "MongoDB has been connected");
  }

  this.mongoose.connect(this.mongoHost, function (error, db) {
    if (error) callback(error)
    else {
      self.db = self.mongoose.connection;
      callback(null, "MongoDB has been connected");
    }
  })
});

Given(/^The api server is running$/, function (callback) {
  this.request.get('/').end(callback)
});

Given(/^The collection "([^"]*)" is empty$/, function (collection, callback) {
  this.mongoose.model(collection).remove({}, callback)
});

Given(/^an api token after logined with username "([^"]*)" and password "([^"]*)"$/, function (username, password, callback) {
  var self = this;
  this.request
    .post(this.api.auth.login)
    .set("content-type", "application/json")
    .set("accept", "application/json")
    .send({ username, password })
    .expect(200)
    .then(function (response) {
      if (response.body.error) {
        done(response.body.error)
      }
     // console.log("----->",response);
     // console.log("----->",_.get(response.body, "response.token"));
      self.token = _.get(response.body, "response.token");
      callback();
    }).catch(callback)
});

Given(/^a list of documents in collection "([^"]*)", with the customized fields described below$/, function (collection, table, done) {
  var self = this;
  var rds = self.parseDataTable(table.hashes());
  Promise.each(rds, function (rd) {
    if (collection == 'UsersSystem' && rd.extension.password) {
      rd.extension.password.enum = rd.extension.password.enum.map(function (password) {
        return crypto.createHash('md5').update(password).digest('hex')
      })
    }
    var objectList = self.randomDataObject(collection, rd.extension, rd.total);
    return self.mongoose.model(collection).create(objectList)
  }).then(function () {
    done();
  }).catch(function (error) {
    console.log("error ", error);
    done(error)
  });
})
When(/^I send request  data to api "([^"]*)",with param on url$/, function (apiUrn, callback) {
  // Write code here that turns the phrase above into concrete actions
  var self = this;
  //debuglog("self.token ", self.token);
  this.request
    .get(apiUrn)
    .set("content-type", "application/json")
    .set("accept", "application/json")
    .set("x-access-token", self.token)
    .then(function (response) {
      // console.log("response",response.body);
      self.result = response.body;
      callback();
    }).catch(callback)
});
Then(/^I will get "([^"]*)" items in the returned list$/, function ( length, callback) {
  if (this.result.error || this.result.errorCode) {
    callback(this.result)
  }
  //console.log("this.result.res",this.result.length);
  assert.equal(this.result.length, length);
  callback();
});
Then(/^I will get object assign "([^"]*)" of items in the returned list$/, function ( length, callback) {
  if (this.result.error || this.result.errorCode) {
    callback(this.result)
  }
 // console.log("this.result.res",this.result);
  assert.equal(this.result.response.affiliateAssigned.length, length);
  callback();
});
When(/^I send request to api "([^"]*)" with request body$/, function (apiUrn, table, callback) {
  var requestBody = table.hashes()[0].requestBody
 // debuglog("requestBody ", requestBody);
  var self = this;
  //debuglog("self.token ", self.token);
  this.request
    .post(apiUrn)
    .set("content-type", "application/json")
    .set("accept", "application/json")
    .set("x-access-token", self.token)
    .send(requestBody)
    .then(function (response) {
      console.log("response",response.body);
      self.result = response.body;
      callback();
    }).catch(callback)
});
When(/^I send request to api "([^"]*)" with method GET and request body$/, function (apiUrn, table, done) {
  var requestBody = table.hashes()[0].requestBody
  var self = this;
  console.log("self.token ", self.token);
  this.request
    .get(apiUrn)
    .set("x-access-token", self.token)
    .then(function (response) {
      self.result = response.body;
      console.log("self.result ", JSON.stringify(self.result, null, 2));
      done();
    }).catch(function (error) {
      console.log("error ", error);
      done(error);
    })
});
When(/^I send request to api "([^"]*)" with method PUT and request body$/, function (apiUrn, table, done) {
  var requestBody = table.hashes()[0].requestBody
  //console.log("requestBody ", requestBody);
  var self = this;
  //console.log("self.token ", self.token);
  this.request
    .put(apiUrn)
    .set("x-access-token", self.token)
    .send(JSON.parse(requestBody))
    .then(function (response) {
      self.result = response.body;
      console.log("self.result ", self.result);
      done();
    }).catch(function (error) {
      console.log("error ", error);
      done(error);
    })
});
When(/^I send request to api "([^"]*)" with method DELETE and request body$/, function (apiUrn, table, done) {
  var requestBody = table.hashes()[0].requestBody
  debuglog("requestBody ", requestBody);
  var self = this;
 // debuglog("self.token ", self.token);
  this.request
    .del(apiUrn)
    .set("x-access-token", self.token)
    .send(JSON.parse(requestBody))
    .then(function (response) {
      self.result = response.body;
      debuglog("self.result ", self.result);
      done();
    }).catch(function (error) {
      debuglog("error ", error);
      done(error);
    })
});
Then(/^I should get "([^"]*)" affected documents and "([^"]*)" items in the returned list$/, function (total, length, callback) {
  if (this.result.error || this.result.errorCode) {
    callback(this.result)
  }
  assert.equal(this.result.res.total, total);
  assert.equal(this.result.res.list.length, length);
  callback();
});

When(/^I send request to login with params$/, function (table, callback) {
  var data = table.hashes()[0]
  var self = this;
  this.request
    .post(this.api.auth.login)
    .set("content-type", "application/json")
    .set("accept", "application/json")
    .send(data)
    .then(function (response) {
      self.result = response.body;
      callback();
    }).catch(callback)
});
Then(/^I should get the return data matches with$/, function (table, callback) {
  if (this.result.error || this.result.errorCode) {
    callback(this.result)
  }
  var self = this;
  var expectedData = self.parseJsonObjectTables(table.hashes())[0].res;
  assert.isTrue(_.matches(expectedData)(self.result), "Result object is not matched with the expected one")
  callback();
});

Then(/^I should get the error object matches with$/, function (table, callback) {
  var self = this;
  var expectedData = self.parseJsonObjectTables(table.hashes())[0].error;
  debuglog("self.result.error ", self.result);
  assert.isTrue(_.matches(expectedData)(self.result), "Error object is not matched with the expected one")
  callback();
});


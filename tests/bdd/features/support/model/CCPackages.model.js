var mongoose = require('mongoose');
var CCPackagesSchema = new mongoose.Schema({
  id:{
    type: String,
  },
  name:{
    type:String,
    required:true
  },
  isActive:{
    type: Boolean
  },
  createdDate: {
    type: Date,
    default: Date.now
  },
  latestUpdate: {
    type: Date,
    default: Date.now
  },
  modules:{
    type:Array
  }

},{collection: "CCPackages"});

module.exports.default = mongoose.model('CCPackages', CCPackagesSchema);

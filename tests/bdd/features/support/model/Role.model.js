var mongoose = require('mongoose');
const RoleSchema = new mongoose.Schema({
  name:{
    type:String,
    required:true,
    trim:true
  },
  fleetId:{
    type:String,
    default:""
  },
  modules:{
    type:Array
  },
  isActive:{
    type: Boolean,
    required: true
  },
  isAdmin:{
    type: Boolean,
    default: false
  },
  createdDate: {
    type: Date,
    default: Date.now
  },
  latestUpdate: {
    type: Date,
    default: Date.now
  }
},{collection: "Roles"});

module.exports.default = mongoose.model('Roles', RoleSchema);

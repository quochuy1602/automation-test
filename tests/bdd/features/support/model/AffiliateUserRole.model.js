var mongoose = require('mongoose');
var AffiliateUserRoleSchema = new mongoose.Schema({
  userName: {
    type: String,
    required:true,
    trim:true,
    unique:true
  },
  firstName:{
    type: String,
    required:true,
    trim:true
  },
  lastName: {
    type: String,
    trim:true
  },
  phone: {
    type: String,
    trim:true
  },
  email:{
    type: String,
    required:true,
    trim:true
  },
  permission:{
    roleName:{
      type: String,
      trim:true
    },
    roleId:{
      type: String,
      trim:true
    },
    modules:{
      type:Array
    }
  },
  userId:{
    type: String,
    trim:true
  },
  isActive:{
    type:Boolean
  },
  createdDate: {
    type: Date,
    default: Date.now
  },
  latestUpdate: {
    type: Date,
    default: Date.now
  }

},{collection: "AffiliateUserRole"});
module.exports.default =  mongoose.model('AffiliateUserRole', AffiliateUserRoleSchema);

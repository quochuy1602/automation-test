var mongoose = require('mongoose');
const UsersSystemSchema = new mongoose.Schema({
  id:{
    type: String,
  },
  firstName: {
    type: String,
  },
  lastName: {
    type: String,
  },
  userName: {
    type: String,
    required: true
  },
  password: {
    type: String,
    required: true
  },
  phone: {
    type: String,
  },
  address:{
    type:String
  },
  email: {
    type: String,
  },
  forgetPassword:{
    type: Boolean,
    default:false
  },
  token: {
    type: String,
    required: false
  },
  isActive:{
    type: Boolean,
    required: true
  },
  defaultPw:{
    type: Boolean,
    default:true
  },
  createdDate: {
    type: Date,
    default: Date.now
  },
  latestUpdate: {
    type: Date,
    default: Date.now
  }
},{collection: "UsersSystem"})

module.exports.default = mongoose.model('UsersSystem', UsersSystemSchema);

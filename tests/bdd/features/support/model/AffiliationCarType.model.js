var mongoose = require('mongoose');
var AffiliationCarTypeSchema = new mongoose.Schema({
  name: {
    type: String,
    required:true,
    trim:true
  },
  iconOnMap:{
    type: String,
  },
  iconSlider: {
    type: String,
  },
  showOnMap:{
    type:Boolean
  },
  destinationRequired:{
    type:Boolean
  },
  no:{
    type:Number
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

},{collection: "AffiliationCarType"});


module.exports.default = mongoose.model('AffiliationCarType', AffiliationCarTypeSchema);

var mongoose = require('mongoose');
var ZoneSchema = new mongoose.Schema({
  zoneName:{
    type:String,
    required:true
  },
  geo:{
    type:{
      type:String,
      enum: ['Point',
        'MultiPoint',
        'LineString',
        'MultiLineString',
        'Polygon',
        'MultiPolygon'
      ],
      default: 'Polygon'
    },
    coordinates:{
      type: Array
    }
  },
  isActive:{
    type: Boolean
  },
  count:{
    type:Number
  },
  createdDate: {
    type: Date,
    default: Date.now
  },
  latestUpdate: {
    type: Date,
    default: Date.now
  },
  fleetId:{
    type:String,
    default:""
  }

},{collection: "FZone"});

module.exports.default = mongoose.model('FZone', ZoneSchema);

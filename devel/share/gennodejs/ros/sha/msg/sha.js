// Auto-generated. Do not edit!

// (in-package sha.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class sha {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.old_framescore_pub = null;
      this.old_variance_pub = null;
    }
    else {
      if (initObj.hasOwnProperty('old_framescore_pub')) {
        this.old_framescore_pub = initObj.old_framescore_pub
      }
      else {
        this.old_framescore_pub = 0.0;
      }
      if (initObj.hasOwnProperty('old_variance_pub')) {
        this.old_variance_pub = initObj.old_variance_pub
      }
      else {
        this.old_variance_pub = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type sha
    // Serialize message field [old_framescore_pub]
    bufferOffset = _serializer.float64(obj.old_framescore_pub, buffer, bufferOffset);
    // Serialize message field [old_variance_pub]
    bufferOffset = _serializer.float64(obj.old_variance_pub, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type sha
    let len;
    let data = new sha(null);
    // Deserialize message field [old_framescore_pub]
    data.old_framescore_pub = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [old_variance_pub]
    data.old_variance_pub = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sha/sha';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6d9c7de78367f107912b0affe8137d22';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 old_framescore_pub
    float64 old_variance_pub
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new sha(null);
    if (msg.old_framescore_pub !== undefined) {
      resolved.old_framescore_pub = msg.old_framescore_pub;
    }
    else {
      resolved.old_framescore_pub = 0.0
    }

    if (msg.old_variance_pub !== undefined) {
      resolved.old_variance_pub = msg.old_variance_pub;
    }
    else {
      resolved.old_variance_pub = 0.0
    }

    return resolved;
    }
};

module.exports = sha;

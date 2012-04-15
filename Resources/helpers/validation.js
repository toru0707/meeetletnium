var Validation;

Validation = (function() {

  function Validation(rules) {
    this.rules = rules;
  }

  Validation.prototype.validate = function() {
    var obj, rule, v, _i, _len, _ref, _results;
    this.errors = {};
    _ref = this.rules;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      rule = _ref[_i];
      Titanium.API.info('rule:' + rule);
      obj = rule["obj"];
      Titanium.API.info('obj.hintText:' + obj.hintText);
      _results.push((function() {
        var _j, _len2, _ref2, _results2;
        _ref2 = rule["validators"];
        _results2 = [];
        for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
          v = _ref2[_j];
          Titanium.API.info('v:' + v + ", v[name]:" + v["name"] + ", v[value]:" + v["value"]);
          switch (v["name"]) {
            case "reqd":
              if (v["value"] === "true") {
                this.errors[obj.hintText] = this.isValidNumber(obj.vaalue);
                _results2.push(Titanium.API.info('@errors[' + obj.hintText + '] :' + this.errors[obj.hintText]));
              } else {
                _results2.push(Titanium.API.info('else'));
              }
              break;
            default:
              _results2.push(void 0);
          }
        }
        return _results2;
      }).call(this));
    }
    return _results;
  };

  Validation.prototype.validateWithItems = function(rules) {
    this.rules = rules;
    return this.validate();
  };

  Validation.prototype.isValidNumber = function(val) {
    var re;
    re = /^[-+]?\d+(\.\d+)?$/;
    Titanium.API.info('isValidNumber:' + re.test(val));
    return re.test(val);
  };

  Validation.prototype.isInteger = function(val) {
    var re;
    re = /^[-+]?\d+$/;
    Titanium.API.info('isInteger:' + re.test(val));
    return re.test(val);
  };

  Validation.prototype.isReal = function(val) {
    var re;
    re = /^[-+]?\d*\.?\d+$/;
    Titanium.API.info('isReal:' + re.test(val));
    return re.test(val);
  };

  Validation.prototype.removeLastEntry = function(val) {
    Titanium.API.info('removeLastEntry:');
    return val.slice(0, val.toString().length - 1);
  };

  Validation.prototype.isEmpty = function(val) {
    if (null === val || "" === al) return true;
    return false;
  };

  Validation.prototype.isPresent = function(val) {
    var re;
    re = /[^.*]/;
    Titanium.API.info('isPresent:' + re.test(val));
    return re.test(val);
  };

  Validation.prototype.isWithinRange = function(val, min, max) {
    if (val >= min && val <= max) {
      Titanium.API.info('isWithinRange:true');
      return true;
    } else {
      Titanium.API.info('isWithinRange:false');
      return false;
    }
  };

  Validation.prototype.isMinChars = function(val, min) {
    if (val.toString().length >= min) {
      Titanium.API.info('isMinChars:true');
      return true;
    } else {
      Titanium.API.info('isMinChars:false');
    }
    return false;
  };

  return Validation;

})();

({
  isWithinMaxChars: function(val, max) {
    if (val.toString().length <= max) {
      Titanium.API.info('isWithinMaxChars:true');
      return true;
    } else {
      Titanium.API.info('isWithinMaxChars:false');
      return false;
    }
  },
  checkValidation: function(obj) {
    Titanium.API.info('checking validation');
    obj.color = obj.validation.color;
    if (!obj.validation.color) obj.validation.color = obj.color;
    setEffect(function(obj, isOff) {
      var isValid;
      if (isValid === false) {
        return false;
      } else {
        if (!isOff) {
          obj.color = 'Red';
          isValid = false;
        }
        if (isOff) {
          obj.color = obj.validation.color;
          isValid = true;
        }
      }
      return isOff;
    });
    if (obj.validation.reqd) setEffect(obj, isPresent(obj.value));
    if (isPresent(obj.value)) {
      if (obj.validation.isdouble) {
        if (!setEffect(obj, isReal(obj.value))) setEffect(obj, isReal(obj.value));
      }
    }
    if (obj.validation.isinteger) {
      if (!setEffect(obj, isInteger(obj.value))) {
        obj.value = removeLastEntry(obj.value);
      }
    }
    if (obj.validation.minchars) {
      setEffect(obj, isMinChars(obj.value, obj.validation.minchars));
    }
    if (obj.validation.maxchars) {
      if (!setEffect(obj, isWithinMaxChars(obj.value, obj.validation.maxchars))) {
        obj.value = removeLastEntry(obj.value);
      }
    }
    if (obj.validation.range) {
      setEffect(obj, isWithinRange(obj.value, obj.validation.range.min, obj.validation.range.max));
    }
    return Ti.API.info('isValid:' + isValid);
  }
});

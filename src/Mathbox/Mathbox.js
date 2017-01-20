"use strict";

exports.trackballControls = THREE.TrackballControls;
exports.orbitControls = THREE.OrbitControls;

exports.setThreeClearColor = function (color) {
    return function(alpha) {
        return function(three) {
            three.renderer.setClearColor(color, alpha);
            return three;
        };
    };
};

exports.mkMathbox = function (options) {
    return function () {
        var mathbox = mathBox(options);
        if (mathbox.fallback) throw "WebGL not supported";
        return mathbox;
    };
};

exports.applyOnThree = function(f) {
    return function(mathbox) {
        return function() {
            f(mathbox.three);
            return mathbox;
        };
    };
};

exports.jsAdd = function (ctx) {
    return function (type) {
        return function (options) {
            return function (fieldConstrName) {
                return function () {
                    var splitted = split(fieldConstrName, options.value0);
                    return ctx.add(type, splitted[0], splitted[1]);
                };
            };
        };
    };
};

exports.jsEnd = function (ctx) {
    return function () {
        return ctx.end();
    };
};

var split = function(fieldConstrName, object) {
    var options = {};
    var binds = {};
    for(var prop in object) {
        var propVal = object[prop];
        try {
          var v = unwrap(fieldConstrName, propVal);
        } catch (e) {
          var str = JSON.stringify(object);
          console.log(str);
          console.log(object);
          console.log(prop);
          throw e;
        }
        if (v != null) {
            if (v[0] != null) {
                options[prop] = v[0];
            } else if (v[1] != null) {
                binds[prop] = v[1];
            }
        }
    }
    return [options, binds];
};

var signalToFun = function (signal) {
  return function(t) {
    return signal.get();
  }
};

var unwrap = function(fieldConstrName, propVal) {
    if (propVal == null) {
      return [null, null];
    }
    if (fieldConstrName(propVal) === 'Val') {
        return [propVal.value0, null];
    }
    if (fieldConstrName(propVal) === 'Fun') {
      return [null, propVal.value0];
    }
    if (fieldConstrName(propVal) === 'Sig') {
      return [null, signalToFun(propVal.value0)];
    }
    console.log(propVal);
    throw "Unexpected propVal:" + propVal;
};

exports.jsSet_k = function (ctx) {
    return function (key) {
        return function () {
            return ctx.set(key);
        };
    };
};

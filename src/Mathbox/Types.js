"use strict";

var Types = MathBox.Primitives.Types.Types;

exports.jsMkMat4 = function (value) {
    return [
        value.value0, value.value1, value.value2, value.value3,
        value.value4, value.value5, value.value6, value.value7,
        value.value8, value.value9, value.value10, value.value11,
        value.value12, value.value13, value.value14, value.value15
    ];
};

exports.jsMkEnum = function (value) {
    return function (keys) {
        return Types.enum(value, keys).make();
    };
};

exports.jsMkClasses = function (stringArr) {
    return Types.classes(stringArr).make();
};

exports.jsMkFont = function (stringArr) {
    return Types.font(stringArr).make();
};

exports.jsMkSelect = function (value) {
    return Types.select(value[0]).make();
};

exports.jsMkRound = function (value) {
    return Types.round(value).make();
};

exports.jsMkTimestamp = function (value) {
    return Types.timestamp(value).make();
};

exports.jsMkTranspose = function (order) {
    return Types.transpose(order).make();
};

exports.jsMkSwizzle = function (order) {
    return function (size) {
        return Types.swizzle(order, size).make();
    };
};

exports.jsMkAxis = function (value) {
    return function (allowZero) {
        return Types.axis(value, allowZero).make();
    };
};

exports.jsMkStringColor = function (string) {
    return new THREE.Color(string);
};

exports.jsMkRgbColor = function (r) {
    return function (g) {
        return function (b) {
            return Types.color(r, g, b).make();
        }
    }
};

exports.jsMkBlending = function (value) {
    return Types.blending(value).make();
};

exports.jsMkFilter = function (value) {
    return Types.filter(value).make();
};

exports.jsMkType = function (value) {
    return Types.type(value).make();
};

exports.jsMkScale = function (value) {
    return Types.scale(value).make();
};

exports.jsMkMapping = function (value) {
    return Types.mapping(value).make();
};

exports.jsMkIndexing = function (value) {
    return Types.indexing(value).make();
};

exports.jsMkJoin = function (value) {
    return Types.join(value).make();
};

exports.jsMkShape = function (value) {
    return Types.shape(value).make();
};

exports.jsMkStroke = function (value) {
    return Types.stroke(value).make();
};

exports.jsMkVertexPass = function (value) {
    return Types.vertexPass(value).make();
};

exports.jsMkFragmentPass = function (value) {
    return Types.fragmentPass(value).make();
};

exports.jsMkEase = function (value) {
    return Types.ease(value).make();
};

exports.jsMkFit = function (value) {
    return Types.fit(value).make();
};

exports.jsMkAnchor = function (value) {
    return Types.anchor(value).make();
};

exports.jsMkTransitionState = function (value) {
    return Types.transitionState(value).make();
};

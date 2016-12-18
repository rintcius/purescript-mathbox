"use strict";

exports.jsColorsToData = function (colors) {
    return [colors.x, colors.y, colors.z].map(function (color) {
        return [color.r, color.g, color.b, 1];
    })
};

exports.jsData = [[2.0, 0.0, 0.0], [0.0, 1.11, 0.0], [0.0, 0.0, 1.0]];

exports.jsTextData = ["x", "y", "z"];

exports.setThreeProps = function (three) {
    three.camera.position.set(-.15, .15, 3.6);
    three.renderer.setClearColor(new THREE.Color(0xFFFFFF), 1.0);
    return three;
};

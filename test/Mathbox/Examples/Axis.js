"use strict";

exports.jsColorsToData = function (colors) {
    return [colors.x, colors.y, colors.z].map(function (color) {
        return [color.r, color.g, color.b, 1];
    })
};

exports.setThreeProps = function (three) {
    three.camera.position.set(-.15, .15, 3.6);
    three.renderer.setClearColor(new THREE.Color(0xFFFFFF), 1.0);
    return three;
};

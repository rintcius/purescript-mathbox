"use strict";

exports.setThreeProps = function (three) {
    three.camera.position.set(0, 0, 3);
    three.renderer.setClearColor(new THREE.Color(0xFFFFFF), 1.0);
    return three;
};

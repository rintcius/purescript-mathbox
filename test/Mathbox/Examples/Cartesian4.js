"use strict";

exports.setThreeProps = function (three) {
    three.camera.position.set(2.3, 1, 2);
    three.renderer.setClearColor(new THREE.Color(0xFFFFFF), 1.0);
    return three;
};

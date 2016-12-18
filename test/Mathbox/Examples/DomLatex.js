"use strict";

// Define global DOM handler to format 'latex' into an HTML span
MathBox.DOM.Types.latex = MathBox.DOM.createClass({
    render: function (el) {
        this.props.innerHTML = katex.renderToString(this.children);
        return el('span', this.props);
    }
});

exports.htmlExpr = function (emit) {
    return function (el) {
        return function (i) {
            return function (j) {
                // Emit latex element
                emit(el('latex', null, 'c = \\pm\\sqrt{' + i + ' a^2 + ' + j + ' b^2}'));
            }
        }
    }
};

exports.setThreeProps = function (three) {
    three.camera.position.set(1.1, 1.45, 1);
    three.camera.lookAt(new THREE.Vector3())
    three.renderer.setClearColor(new THREE.Color(0xFFFFFF), 1.0);
    return three;
};

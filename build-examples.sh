OUT="examples/output"

mkdir -p $OUT

pulp browserify -I test --main Mathbox.Examples.Main --to $OUT/main.js

pulp browserify -I test --main Mathbox.Examples.Axis --to $OUT/axis.js
pulp browserify -I test --main Mathbox.Examples.Camera --to $OUT/camera.js
pulp browserify -I test --main Mathbox.Examples.Cartesian4 --to $OUT/cartesian4.js
pulp browserify -I test --main Mathbox.Examples.Compose --to $OUT/compose.js
pulp browserify -I test --main Mathbox.Examples.Curve --to $OUT/curve.js
pulp browserify -I test --main Mathbox.Examples.DomLatex --to $OUT/domLatex.js

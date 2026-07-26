# ForgeGrid

ForgeGrid is a parametric, 3D-printable modular workstation ecosystem. This
alpha release establishes the ForgeLock Gen 1 connector experiment and the
first print-validation workflow.

## First print

Either slice the included pre-rendered
`prototypes/FG-CONN-100/FG-CONN-100.stl`, or open
`prototypes/FG-CONN-100/FG-CONN-100.scad` in OpenSCAD, render (`F6`), export
STL, and print it. The fixture produces five separately labelled rail/channel
pairs with clearances from 0.10 mm through 0.30 mm.

Read the prototype [instructions](prototypes/FG-CONN-100/README.md) before
printing. Record your observations in `RESULTS.csv` or the printable worksheet.

## Repository layout

```text
lib/          Reusable OpenSCAD library files
prototypes/   Engineering experiments and test fixtures
docs/         Project, print, and engineering documentation
specs/        Design contracts and engineering rules
tests/        Renderable regression layouts
examples/     Small example models
assets/       Reserved for images and brand assets
```

## Status

`v0.2.0-alpha` is an experimental release. ForgeLock Gen 1 is **not yet a
frozen interface**; select its baseline clearance only after printing
FG-CONN-100 on the target printer and material.

## Design rules

- Dimensions are millimetres.
- Public OpenSCAD modules use the `fg` prefix; private helpers use `_fg`.
- Avoid magic dimensions in product files: place standards in
  `lib/FG_Standards.scad` and printer tuning in `lib/FG_Config.scad`.
- Production modules must identify their revision and have a relevant test.

## Suggested first commit

`feat: add ForgeGrid v0.2.0-alpha connector calibration release`

## License and name

Code and models in this repository are released under the MIT License. The
ForgeGrid and ForgeLock names are project identifiers; conduct a trademark
search before using either name commercially.

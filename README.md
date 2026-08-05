# ForgeGrid

ForgeGrid is an engineering-first OpenSCAD system for modular card, gaming,
workshop, and desktop accessories.

## Release

**v0.3.1-alpha**

This release corrects the ForgeLock datum/orientation bug found in v0.3.0-alpha.

## What changed

- All printable test parts now begin at **Z = 0**.
- Rail geometry is constructed from axis-aligned solids rather than a rotated
  2D extrusion.
- Channel geometry and labels use the same bottom datum.
- Added `FG-CONN-000`, a small geometry verification print.
- Rebuilt `FG-CONN-200` using the corrected connector library.

## Print order

1. Print `prototypes/FG-CONN-000/FG-CONN-000.scad`.
2. Confirm every piece is flat on the build plate in your slicer.
3. If it looks correct, print
   `prototypes/FG-CONN-200/FG-CONN-200.scad`.

All dimensions are millimeters.

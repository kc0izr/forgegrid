# FG-CONN-100 — ForgeLock clearance calibration

FG-CONN-100 is the first ForgeGrid print. It separates the mechanical sliding
fit from magnets, detents, and module weight so you can choose a baseline
clearance using direct observations.

## What it prints

Five labelled pairs are laid out as separate pieces in one OpenSCAD scene.
For each label, the left piece is the rail and the right piece is its captured
channel. Match only pieces with the same label:

| Pair | Clearance |
| --- | ---: |
| C1 | 0.10 mm |
| C2 | 0.15 mm |
| C3 | 0.20 mm |
| C4 | 0.25 mm |
| C5 | 0.30 mm |

The connector slides along its long axis. The channel's closed end is the
mechanical stop. The rail should be inserted at the channel's open end.

## Print settings

- Printer baseline: Anycubic Kobra 2 Neo
- Material: PLA or PLA+
- Nozzle: 0.4 mm
- Layer height: 0.20 mm
- Walls: 3
- Infill: 15% gyroid (or your normal structural infill)
- Supports: off
- Brim: off unless your material needs it

Print all pieces flat as supplied. The receiver's top bridge is deliberately
short; inspect the bridge quality before interpreting fit results.

## Test procedure

1. Let the parts cool completely and remove any brim/stringing.
2. Try every matching rail/channel pair by hand—do not force a tight pair.
3. For each pair, record insertion smoothness, side-to-side wobble, removal
   feel, stop feel, and visible print defects in `RESULTS.csv`.
4. Pick the tightest pair that inserts smoothly without force, binds neither at
   entry nor near the stop, and has no objectionable rattle.
5. Photograph the winning pair beside its labels and add a short note.

## Acceptance target

The preferred baseline should insert with firm finger pressure, slide without
sticking, reach a clear positive stop, and have only slight perceptible play.
This fixture is a fit experiment, **not** a structural-load or magnet test.

## Next result needed

Return the chosen C-number plus printer, material, nozzle, layer height, and
any notes about bridge quality. That result will set `FG_SLIDING_CLEARANCE` for
the next ForgeLock revision.

# FG-CONN-100 — ForgeGuide sliding-fit calibration

FG-CONN-100 is the first ForgeGrid print. It validates a 45-degree,
self-supporting V-guide before any final lock, magnet, or anti-lift mechanism
is added. The open-top receiver removes the long internal bridge found in the
withdrawn v0.2.1-alpha fixture.

## What it prints

Five labelled pairs are laid out as separate pieces in one OpenSCAD scene.
For each row, the left piece is the labelled rail and the right piece is its
matching open-top V-guide receiver. Match by row:

| Pair | Clearance |
| --- | ---: |
| C1 | 0.10 mm |
| C2 | 0.15 mm |
| C3 | 0.20 mm |
| C4 | 0.25 mm |
| C5 | 0.30 mm |

Lower the rail into the receiver's open V-guide, then slide it along its long
axis toward the closed end. The channel's closed end is the mechanical stop.
The rail can intentionally lift out: this fixture tests the guide profile only,
not the final retention mechanism.

## Print settings

- Printer baseline: Anycubic Kobra 2 Neo
- Material: PLA or PLA+
- Nozzle: 0.4 mm
- Layer height: 0.20 mm
- Walls: 3
- Infill: 15% gyroid (or your normal structural infill)
- Supports: off
- Brim: off

Print all pieces flat as supplied. There are no internal roof bridges or
unsupported horizontal surfaces in this revision.

## Test procedure

1. Let the parts cool completely and remove any brim/stringing.
2. Try every matching rail/channel pair by hand—do not force a tight pair.
3. For each pair, record insertion smoothness, side-to-side wobble, removal
   feel, stop feel, and visible print defects in `RESULTS.csv`.
4. Pick the tightest pair that inserts smoothly without force, binds neither at
   entry nor near the stop, and has no objectionable rattle.
5. Photograph the winning pair beside its labels and add a short note.

## Acceptance target

The preferred baseline should lower into the guide with light pressure, slide
without sticking, reach a clear positive stop, and have only slight perceptible
side play. This is a profile-fit experiment, **not** a structural-load,
magnet, or retention test.

## Next result needed

Return the chosen C-number plus printer, material, nozzle, layer height, and
any notes about bridge quality. That result will set `FG_SLIDING_CLEARANCE` for
the next ForgeLock revision.

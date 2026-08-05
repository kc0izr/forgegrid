# EDR-0002: Printable Part Datum

- Status: Approved
- Date: 2026-08-04

## Decision

Every standalone printable ForgeGrid module must occupy `Z >= 0`, with its
intended print-bed contact surface located at `Z = 0`.

## Reason

FG-CONN-200 v0.3.0-alpha exposed a connector orientation error caused by
rotating an extruded 2D profile. The profile extended below the build plane.

## Implementation

ForgeLock rail and channel geometry is now built from axis-aligned solids.
Rotated profile extrusion is not used for standalone test parts.

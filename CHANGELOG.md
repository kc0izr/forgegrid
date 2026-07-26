# Changelog

All notable changes to ForgeGrid are documented here.

## v0.2.2-alpha — 2026-07-26

### Changed

- Replaced the bridge-dependent captured T-slot test with an open, 45-degree
  ForgeGuide V-profile that prints flat without supports or brim.
- Explicitly scoped FG-CONN-100 to sliding-profile fit validation. Retention,
  magnets, and structural load testing are deferred to later experiments.

## v0.2.1-alpha — 2026-07-26 (withdrawn)

### Fixed

- Corrected FG-CONN-100 rail/channel mating geometry. The rail now starts at
  the mating floor, allowing its stem to enter the channel and its head to be
  captured by the channel lips.
- Re-rendered the included FG-CONN-100 STL using OpenSCAD.

## v0.2.0-alpha — 2026-07-26 (withdrawn)

### Added

- Git-ready repository layout and project documentation.
- Core OpenSCAD configuration, standards, common geometry, hardware, version,
  and ForgeLock Gen 1 library skeletons.
- FG-CONN-100, a printable five-variant rail/channel clearance calibration
  fixture.
- Results CSV and a printable testing worksheet.
- Initial ForgeLock Gen 1 and engineering-rules specifications.

### Known limitations

- The channel uses short bridge spans; validate it on the target printer.
- Magnet pockets and detents are intentionally deferred until baseline sliding
  tolerance is measured.
- This fixture validates fit only; it is not a load-rated connector.

# ForgeGrid engineering rules

1. Use millimetres.
2. Put printer tuning in `FG_Config.scad`; put engineering dimensions in
   `FG_Standards.scad`.
3. Public modules start with `fg`; private helpers start with `_fg`.
4. A production module must include its module ID and revision.
5. A connector change requires a corresponding printable regression fixture.
6. Avoid unsupported overhangs and supports unless documented and approved.
7. Treat a selected fit as printer/material specific until replicated.

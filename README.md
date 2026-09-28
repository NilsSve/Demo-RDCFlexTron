# Demo-RDCFlexTron

The **RDCFlexTron** library at work in a DataFlex 26 Windows program (`AppSrc/RDCFlexTronDemo.src`):

- ONE themed host for the whole window, the library's `cFTGridHost`: laid out on a grid of 8 px columns
  the way a Windows dialog is - one column and the page's row take the extra space - with the buttons,
  the glyph combo, the glyph list beside the page, a row of air, and the message boxes with Exit in its
  five rows (`piRowIndex`);
- the page, a `cFTHtmlPage`: its title is `psLabel`, and its body is built with the `FTMarkupBuilders`
  functions. The RDC Tools mark beside the title is a class of the demo's own, `ftg-rdcmark` in
  `AppHtml/CssStyle/demo.css`, so the Studio's Designer shows it too - an image file in `psTitleIcon`
  shows only when the program runs. The Designer shows Lorem ipsum for the body - nothing in the demo
  asks for it, the class does it;
- `cFTWebButton` objects - real web buttons, so the Studio's Designer draws them - with `DashIcon`
  glyphs; a click's work runs in `OnButtonClick`, after the web click has returned. A button's span is
  its width in 8 px steps - `cFTWebButton` takes 10 unless it says otherwise - so it keeps its size when
  the window grows;
- an Exit button at the bottom right, with the `CS_GlyphExit` glyph;
- a `cFTWebCombo` of glyph names, in the FT look (`FtCompact`, from the library's `ftcontrols.css`): its
  `OnChange` sends the glyph to the Preview button's `UpdateGlyph`, which changes it while the program
  runs;
- a `cFTWebList` of the same glyphs, beside the page: its rows come from code (`OnManualLoadData`), and
  choosing one gives its glyph to the Preview button and the combo (`OnChangeCurrentRow`);
- the message boxes: `FTInfoBox`, `FTStopBox` and `FTYesNoBox` (the library's `FTMessageBox.dg`) -
  `Info_Box`, `Stop_Box` and `YesNo_Box` in the FT look, with the same arguments and return values;
- a `cFTModalPanel` in a dialog file of its own (`AppSrc/DemoDialog.dg`), with one grid host - the
  page, and a Close button (a `cFTWebButton`) under it at the right - which the panel fits to itself
  (`phoClientHost`). The program Uses it at its top, above the application object, as it does the
  library's `FTMessageBox.dg`: both take the theme as soon as the application object reads it;
- the Dark / Light / Follow Windows choice (`cThemeButton`, `AppSrc/cThemeButton.pkg`): the library's
  `cFTApplication` - the demo's application object - reads it when the program starts, and saves a new
  one under the program's registry key and restarts the demo in it;
- `AppHtml/CssStyle/application.css`, which imports the library's style sheets - `ftglyphs.css`, the
  DashIcon glyphs as classes (`ftg-exit`, `ftg-info` ...), among them - so the Studio's Designer draws
  the buttons in the FT look, glyphs included. A button names its glyph in `psCSSClass`
  (`"ftbtn ftg-exit"`): the Designer runs none of the library's code, so `psGlyph` shows only when the
  program runs.

> **Private until FlexTron is released.** The library is a separate repository,
> **Library-RDCFlexTron** - a package, so it carries no programs; this is where they go.

## Running it

`RDCFlexTronDemo.sws` takes the library as a package from GitHub, pinned to a commit
(`https://github.com/NilsSve/Library-RDCFlexTron.git`, `RDC-FlexTron-Library.sws`). Open
`RDCFlexTronDemo.sws` in the DataFlex 26 Studio, compile `RDCFlexTronDemo.src` and run it. The package
manager installs the library, the web framework, the Material theme and the library's style sheets (into
`AppHtml\RDCFlexTron`) itself.

The Material theme package is required: without it the FlexTron pages wait several seconds for a theme
stylesheet that never arrives before they show their controls.

To work on the library and see each change here at once, point the dependency at a clone by path instead
(`"../Libraries/RDCFlexTron/RDC-FlexTron-Library.sws"`, the library pool beside this folder) and run
`setup.bat`, once and again after changing one of the library's style sheets. A path dependency is a local
library to df-cli, and it skips the library's install step ("its install files are ignored");
`setup.bat` copies the sheets into `AppHtml\RDCFlexTron` instead. (A junction to the library folder does
not do: through one, the pages stayed unstyled.)

## Licence

MIT - see [LICENSE](LICENSE).

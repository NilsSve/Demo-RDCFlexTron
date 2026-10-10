# Demo-RDCFlexTron

The **RDCFlexTron** library at work in a DataFlex 26 Windows program (`AppSrc/RDCFlexTronDemo.src`):

- ONE themed host for the whole window, the library's `cFTGridHost`: laid out on a grid of 8 px columns
  the way a Windows dialog is - one column and the page's row take the extra space - with the buttons,
  the glyph combo, the dialogs of controls, the two boxes, the glyph list beside the page, a row of air,
  and the message boxes with About and Exit in its seven rows (`piRowIndex`);
- the page, a `cFTHtmlPage`: its title is `psLabel`, and its body is built with the `FTMarkupBuilders`
  functions. The RDC Tools mark beside the title is a glyph of the demo's own: `rdcmark.svg` in
  `AppHtml/FTGlyphs`. The program writes the folder's classes into `AppHtml/FTGlyphs/ftglyphs-app.css`
  when it starts, and `application.css` imports that sheet, so the Studio's Designer shows the mark too.
  The Designer shows Lorem ipsum for the body - nothing in the demo asks for it, the class does it;
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
- the mockups the Studio's Designer draws for content built at run time (`AppSrc/DemoMockups.dg`, the
  Designer mockups button): six pages, each a `cFTHtmlPage` whose `psHtml` is one short literal - a grid, a list, a
  tree, a log, a chart and cards, drawn by the library's `ftcontrols.css`. Nothing replaces the literals
  there, so the running demo shows each shape just as the Designer does;
- what the library does to the framework's own web controls, as a before and after
  (`AppSrc/DemoWebControls.dg`, the Web controls button): the same objects, line for line - a `cWebForm`, a
  `cWebCombo`, a `cWebDateForm`, check boxes and radio buttons in each of their states (not ticked or chosen,
  ticked or chosen, and both again switched off), a `cWebGroup` with a `cWebEdit` in it, and tab pages, one
  of them switched off - on an FT host on the left and on the framework's own `cLocalWebControlHost` on the
  right. An FT host takes the theme and marks its page with the class `FtHost`, and the library's
  `ftcontrols.css` gives the framework's controls there the FT look - the FT text size, the palette's
  colours, a label on the left right-justified, a box that is green when ticked and dim when switched off,
  a group and tab pages as FT cards, the date picker in the palette; the right-hand host has none of it, and
  does not follow the Dark / Light choice. So a control needs a cFT class for what it does, not for how it
  looks. A bar at the bottom, a third
  host, says what a control reported: a `cFTWebHtmlBox` whose `UpdateHtml` takes new markup from another
  host's event, a `cFTWebCheckbox` that switches it off, and a markup button in a box of its own, whose
  click reaches `OnHtmlClick` after the web click has returned;
- native Windows controls on a `cFTModalPanel` (`AppSrc/DemoWindowsControls.dg`, the Windows controls
  button): a `Form`, a `cFTComboForm`, a check box with a `cFTCheckBoxCaption`, a `cFTRadioGroup` whose
  radios have a `cFTRadioCaption` each, a `cFTCJSelectionGrid` with rows from code, and a `cFTDeferTimer`
  behind the line that says what changed; the buttons at the bottom are web buttons on a small grid host.
  The program Uses this dialog below the application object: the grid's library, RDCToolsLib, asks the
  application object for the program's name and folder as it is Used;
- the data-aware classes (`AppSrc/DemoData.dg`, the Data-aware button) on CodeType and CodeMast, the two
  code tables DataFlex gives every workspace: a `cFTDbModalPanel` with two `cFTDbCJGrid` grids on the left -
  the code types, and the chosen type's codes - and a `cFTDbGridHost` on the right, whose web fields are
  bound to the chosen type with `Entry_Item`, the comment in the framework's own `cWebEdit`, and whose
  data-aware `cFTWebList` shows the same codes as the grid beside it: its columns are bound with
  `Entry_Item` and it reads its rows from the data dictionary, where the main window's glyph list gets
  them from code. The grid and the list share one data dictionary. A new type is added on either side:
  the down arrow on the types grid's last row appends one, and Clear, beside Save, empties the fields for
  one - the types grid gets an empty row for it, and Save saves it. A type's key is typed for a new type
  only: the data dictionary says so (`DD_COMMIT`, with `Field_CommitNoEnterOnIndex`), and the grid's column
  and the web field both follow it. The two data dictionaries are the
  demo's (`cCodeTypeDataDictionary.dd`, `cCodeMastDataDictionary.dd`). A repository carries no tables, so
  the program copies the two empty ones DataFlex ships (`Usr\New\Data` in the DataFlex folder) into `Data`
  the first time it runs, and adds a few rows (`AppSrc/DemoCodeTables.pkg`). This dialog is Used below the
  application object too: its data dictionaries open their tables as the program starts;
- `FTInputBox`, the message box with one field to type in, and `FTHtmlMessage`, a message written in HTML
  with button captions of its own (the Input box and HTML message buttons);
- the About dialog (the About button): the library's `FTStdAbout.pkg`, Used in the main window as
  `StdAbout.pkg` is in a client area, and wired the standard way - the button sends `Activate_About`, as a
  menu's About item does, and the window's own `Activate_About` sends `DoAbout` with plain strings. The name
  and the version come from the application object and the program's version resource; the demo adds its
  author, its mark and a line, and the dialog shows them over the build facts, then its About file -
  `Help/About.html`, which `FTStdAbout.pkg` compiles in as the DFAbout library's resource, shown while
  `pbShowAboutFile` is True in `Activate_About` - and the Powered by DataFlex mark, with System information,
  Copy and Close. The lines are plain strings; the file is where markup goes;
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

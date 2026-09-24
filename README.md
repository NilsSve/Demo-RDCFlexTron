# Demo-RDCFlexTron

The **RDCFlexTron** library at work in a DataFlex 26 Windows program (`AppSrc/RDCFlexTronDemo.src`):

- a themed `cFTLocalWebControlHost` whose page, a `cFTHtmlPage`, is built with the `FTMarkupBuilders`
  functions and `DashIcon` glyphs, with the RDC Tools mark as its title picture (`psTitleIcon`);
- a button band in a host of its own, with the click handed to a timer so nothing heavy runs inside
  the web click;
- a `cFTModalPanel` in a dialog file of its own (`AppSrc/DemoDialog.dg`), with a content host and a
  button band, placed from the panel's measured size;
- the Dark / Light / Follow Windows choice, saved under the program's registry key; the demo
  restarts in the new theme.

> **Private until FlexTron is released.** The library is a separate repository,
> **Library-RDCFlexTron** - a package, so it carries no programs; this is where they go.

## Running it

`RDCFlexTronDemo.sws` takes the library as a package from GitHub, pinned to a commit
(`https://github.com/NilsSve/Library-RDCFlexTron.git`, `RDC-FlexTron-Library-26.0.sws`). Open
`RDCFlexTronDemo.sws` in the DataFlex 26 Studio, compile `RDCFlexTronDemo.src` and run it. The package
manager installs the library, the web framework, the Material theme and the library's style sheets (into
`AppHtml\RDCFlexTron`) itself.

The Material theme package is required: without it the FlexTron pages wait several seconds for a theme
stylesheet that never arrives before they show their controls.

To work on the library and see each change here at once, point the dependency at a clone by path instead
(`"../Libraries/RDCFlexTron/RDC-FlexTron-Library-26.0.sws"`, the library pool beside this folder) and run
`setup.bat`, once and again after changing one of the library's style sheets. A path dependency is a local
library to df-cli, and it skips the library's install step ("its install files are ignored");
`setup.bat` copies the sheets into `AppHtml\RDCFlexTron` instead. (A junction to the library folder does
not do: through one, the pages stayed unstyled.)

## Licence

MIT - see [LICENSE](LICENSE).

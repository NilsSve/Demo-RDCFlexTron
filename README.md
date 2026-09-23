# Demo-RDCFlexTron

The **RDCFlexTron** library at work in a DataFlex 26 Windows program (`AppSrc/RDCFlexTronDemo.src`):

- a themed `cFTLocalWebControlHost` whose page is built with the `FTMarkupBuilders` functions and
  `DashIcon` glyphs;
- a button band in a host of its own, with the click handed to a timer so nothing heavy runs inside
  the web click;
- a `cFTModalPanel` with a content host and a button band, placed from the panel's measured size;
- the Dark / Light / Follow Windows choice, saved under the program's registry key and applied at
  the next start.

> **Private until FlexTron is released.** The library is a separate repository,
> **Library-RDCFlexTron** - a package, so it carries no programs; this is where they go.

## Running it

While the library is developed, `RDCFlexTronDemo.sws` points at it by path -
`../Libraries/RDCFlexTron/RDCFlexTronLibrary26.0.sws`, the library pool beside this folder - so a change
to the library shows here straight away. Once the library is published this becomes a pinned package.

Run `setup.bat` once. A path dependency is a local library to df-cli, and it skips the library's
install step ("its install files are ignored"), so the style sheets would never reach `AppHtml`.
`setup.bat` links `AppHtml\RDCFlexTron` to the library's own folder instead - a junction, so an edit to a
sheet shows here straight away.

Then open `RDCFlexTronDemo.sws` in the DataFlex 26 Studio, compile `RDCFlexTronDemo.src` and run it. The
package manager installs the web framework and the theme into `AppHtml` itself.

## Licence

MIT - see [LICENSE](LICENSE).

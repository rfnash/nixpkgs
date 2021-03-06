{ cabal, alsaCore, alsaMixer, dbus, filepath, hinotify, HTTP
, libmpd, libXrandr, mtl, parsec, regexCompat, stm, time
, timezoneOlson, timezoneSeries, utf8String, wirelesstools, X11
, X11Xft
}:

cabal.mkDerivation (self: {
  pname = "xmobar";
  version = "0.21";
  sha256 = "1h0gsb808zm4j4kmw7fl4339wllc16ldy1ki96l8w3fvj30bcxpm";
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    alsaCore alsaMixer dbus filepath hinotify HTTP libmpd mtl parsec
    regexCompat stm time timezoneOlson timezoneSeries utf8String X11
    X11Xft
  ];
  extraLibraries = [ libXrandr wirelesstools ];
  configureFlags = "-fall_extensions";
  meta = {
    homepage = "http://projects.haskell.org/xmobar/";
    description = "A Minimalistic Text Based Status Bar";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})

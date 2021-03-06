{ cabal, exceptions, filepath, transformers }:

cabal.mkDerivation (self: {
  pname = "temporary";
  version = "1.2.0.3";
  sha256 = "0is67bmsjmbbw6wymhis8wyq9gax3sszm573p5719fx2c9z9r24a";
  buildDepends = [ exceptions filepath transformers ];
  jailbreak = true;
  meta = {
    homepage = "http://www.github.com/batterseapower/temporary";
    description = "Portable temporary file and directory support for Windows and Unix, based on code from Cabal";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})

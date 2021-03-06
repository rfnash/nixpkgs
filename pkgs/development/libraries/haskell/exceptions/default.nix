{ cabal, mtl, QuickCheck, testFramework, testFrameworkQuickcheck2
, transformers
}:

cabal.mkDerivation (self: {
  pname = "exceptions";
  version = "0.6.1";
  sha256 = "09jv5jskv48fd5la1pdvafwc9j2jxj1ncf6yxzkwcjddynbkyszm";
  buildDepends = [ mtl transformers ];
  testDepends = [
    mtl QuickCheck testFramework testFrameworkQuickcheck2 transformers
  ];
  meta = {
    homepage = "http://github.com/ekmett/exceptions/";
    description = "Extensible optionally-pure exceptions";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.ocharles ];
  };
})

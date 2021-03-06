{ cabal, deepseq }:

cabal.mkDerivation (self: {
  pname = "abstract-par";
  version = "0.3.3";
  sha256 = "0q6qsniw4wks2pw6wzncb1p1j3k6al5njnvm2v5n494hplwqg2i4";
  buildDepends = [ deepseq ];
  meta = {
    homepage = "https://github.com/simonmar/monad-par";
    description = "Type classes generalizing the functionality of the 'monad-par' library";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})

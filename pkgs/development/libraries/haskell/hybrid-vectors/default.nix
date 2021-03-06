{ cabal, deepseq, primitive, vector }:

cabal.mkDerivation (self: {
  pname = "hybrid-vectors";
  version = "0.1.2";
  sha256 = "1scx1xr9rqdpxc1kj5zgf8w1ld1mj68hxr3nl1p352wspvpgd3qf";
  buildDepends = [ deepseq primitive vector ];
  meta = {
    homepage = "http://github.com/ekmett/hybrid-vectors";
    description = "Hybrid vectors e.g. Mixed Boxed/Unboxed vectors";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})

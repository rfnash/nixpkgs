{ cabal, filepath, hxt, mtl, parsec, split, text }:

cabal.mkDerivation (self: {
  pname = "vcswrapper";
  version = "0.0.4";
  sha256 = "130pmzxdsqv703k2g197vd5rl60fwkqqv2xck66ygb932wsq3fnk";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ filepath hxt mtl parsec split text ];
  meta = {
    homepage = "https://github.com/forste/haskellVCSWrapper";
    description = "Wrapper for source code management systems";
    license = "GPL";
    platforms = self.ghc.meta.platforms;
  };
})

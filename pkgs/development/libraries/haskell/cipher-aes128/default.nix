{ cabal, cereal, cryptoApi, tagged }:

cabal.mkDerivation (self: {
  pname = "cipher-aes128";
  version = "0.6.4";
  sha256 = "093zpw86wimniwmd73g3nnbfy530q52kynccssqf7jxafbsw75aa";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ cereal cryptoApi tagged ];
  meta = {
    homepage = "https://github.com/TomMD/cipher-aes128";
    description = "AES and common modes using AES-NI when available";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})

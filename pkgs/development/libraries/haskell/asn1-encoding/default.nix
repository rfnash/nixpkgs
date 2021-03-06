{ cabal, asn1Types, mtl, text, time }:

cabal.mkDerivation (self: {
  pname = "asn1-encoding";
  version = "0.8.1.3";
  sha256 = "000rajx9gdxfyx521yg2mvp1z8h61sr96w1lzwawiw7n5ng6v8ni";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ asn1Types mtl text time ];
  meta = {
    homepage = "http://github.com/vincenthz/hs-asn1";
    description = "ASN1 data reader and writer in RAW, BER and DER forms";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})

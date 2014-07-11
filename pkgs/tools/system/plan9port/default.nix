{stdenv, fetchurl, libX11, which, perl
, xproto ? null
, libXt ? null
, xextproto ? null
, libXext ? null }:

stdenv.mkDerivation rec {
  name = "plan9port-20140306";

  patches = [ ./fontsrv.patch ];

  builder = ./builder.sh;

  src = fetchurl {
    url = "https://plan9port.googlecode.com/files/${name}.tgz";
    sha256 = "1sza12j3db7i54r3pzli8wmby6aiyzmyfj8w0nidmawkwv6jdf6b";
  };

  buildInputs = stdenv.lib.optionals (!stdenv.isDarwin) [ libX11 xproto libXt xextproto libXext which perl ];

  meta = {
    homepage = "http://swtch.com/plan9port/";
    description = "Plan 9 from User Space";
    license="free";
  };
}

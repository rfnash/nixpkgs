{ stdenv, fetchurl, dpkg, wxGTK, libuuid, xlibs, ykpers, xercesc }:

let
  libPath = stdenv.lib.makeLibraryPath [ wxGTK libuuid xlibs.libXtst xlibs.libX11 ykpers xercesc ];
  version = "0.93BETA";
in

assert stdenv.system == "x86_64-linux" || stdenv.system == "i686-linux";

stdenv.mkDerivation rec {
  name = "passwordsafe-${version}";

  src =
    if stdenv.system == "x86_64-linux" then
      fetchurl {
        url    = "http://downloads.sourceforge.net/project/passwordsafe/Linux-BETA/0.93/passwordsafe-debian-0.93BETA.amd64.deb";
        sha256 = "0128v0izwdnxqkfnw01ax9h0bp78z8hn60d0z1xif1qbp7r3kccz";
      }
    else
      fetchurl {
        url    = "http://downloads.sourceforge.net/project/passwordsafe/Linux-BETA/0.93/passwordsafe-debian-0.93BETA.i686.deb";
        sha256 = "0bvqzwpxppli53c5mwiy787fcphbwcn9c4lcdb4ri2dh7hrnzlq6";
      };

  meta = with stdenv.lib; {
    description = "Simple and secure password manager, from Debian package";
    homepage    = http://passwordsafe.sourceforge.net;
    license     = licenses.artistic2;
    maintainers = with maintainers; [ rfnash ];
    platforms   = platforms.linux;
  };

  buildInputs = [ dpkg ];
  phases = "installPhase";
  installPhase = ''
      mkdir -p $out
      dpkg-deb -x $src $out
      cp -r $out/usr/* $out/
      rm -rf $out/usr
      patchelf \
        --interpreter "$(cat $NIX_GCC/nix-support/dynamic-linker)" \
        --set-rpath ${libPath}:${stdenv.gcc.gcc}/lib${stdenv.lib.optionalString stdenv.is64bit "64"} \
        $out/bin/pwsafe
'';
}

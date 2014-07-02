{ stdenv, fetchurl, dpkg, curl, libarchive, openssl, ruby, rubyLibs, libiconv
, libxml2, libxslt }:

assert stdenv.system == "x86_64-linux" || stdenv.system == "i686-linux";

let
  version = "1.4.3";
in
stdenv.mkDerivation rec {
  name = "vagrant-${version}";

  src =
    if stdenv.system == "x86_64-linux" then
      fetchurl {
        url    = "https://dl.bintray.com/mitchellh/vagrant/vagrant_${version}_x86_64.deb";
        sha256 = "dbd06de0f3560e2d046448d627bca0cbb0ee34b036ef605aa87ed20e6ad2684b";
#        sha256 = "1gmdg92dw7afnvpji0wg4nzr7vhk8mrmcqk3hcrkwscby2f2bhqg";
      }
    else
      fetchurl {
        url    = "https://dl.bintray.com/mitchellh/vagrant/vagrant_${version}_i686.deb";
        sha256 = "66e613fc1c9e31ecaf8e5f1d07d2ae4fca3d4fc2e43593543962664258d9af9b";
#        sha256 = "1z26b6yghqgx8jbi2igf4kk4h6rzy869gli2vj7ayl7vbqdfvb60";
      };

  meta = with stdenv.lib; {
    description = "A tool for building complete development environments";
    homepage    = http://vagrantup.com;
    license     = licenses.mit;
    maintainers = with maintainers; [ lovek323 ];
    platforms   = platforms.linux;
  };

  unpackPhase = ''
    ${dpkg}/bin/dpkg-deb -x ${src} .
  '';

  buildPhase = false;

  installPhase = ''
    sed -i "s|/opt|$out/opt|" usr/bin/vagrant

    mkdir -p "$out"
    cp -r opt "$out"
    cp -r usr/bin "$out"
  '';
}

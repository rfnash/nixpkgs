{stdenv, fetchurl, cmake}:

stdenv.mkDerivation rec {
  name = "taskwarrior-${version}";
  version = "2.3.0";

  enableParallelBuilding = true;

  src = fetchurl {
    url = "http://www.taskwarrior.org/download/task-${version}.tar.gz";
    sha256 = "0wxcfq0n96vmcbwrlk2x377k8cc5k4i64ca6p02y74g6168ji6ib";
  };

  nativeBuildInputs = [ cmake ];

  meta = {
    description = "GTD (getting things done) implementation";
    homepage = http://taskwarrior.org;
    license = stdenv.lib.licenses.mit;
    maintainers = [stdenv.lib.maintainers.marcweber];
    platforms = stdenv.lib.platforms.linux;
  };
}

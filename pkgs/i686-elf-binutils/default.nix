{ lib
, stdenv
, fetchurl
, buildPackages
, zlib ? null
}:

stdenv.mkDerivation rec {
  pname = "i686-elf-binutils";
  version = "2.42";

  src = fetchurl {
    url = "mirror://gnu/binutils/binutils-${version}.tar.xz";
    hash = "sha256-9uTUH9X8d4sGt4kUV7NiDaXs6hAGxqSkGumYEJ+FqAA=";
  };

  outputs = [ "out" "info" ];

  configureFlags = [
    "--target=i686-elf"
    "--disable-multilib"
    "--disable-nls"
    "--disable-werror"
    "--with-sysroot"
    "--enable-deterministic-archives"
    "--enable-ld=yes"
    "--enable-gold=yes"
  ];

  depsBuildBuild = [ buildPackages.stdenv.cc ];
  nativeBuildInputs = [ ];
  buildInputs = [ zlib ];

  CFLAGS = "-O2 -Wno-implicit-function-declaration";
  CXXFLAGS = "-O2";
  LDFLAGS = lib.optionalString (zlib != null) "-L${zlib}/lib";

  postInstall = ''
    rm -rf $out/share/locale
    find $out -name '*.la' -delete
  '';

  meta = with lib; {
    description = "GNU Binutils for i686-elf cross-compiler";
    homepage = "https://www.gnu.org/software/binutils/";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ "MinimalMio" ];
    platforms = platforms.all;
    badPlatforms = [ ];
  };
}

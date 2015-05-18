class Micmac < Formula
  homepage "http://logiciels.ign.fr/?-Micmac,3-"
  version "1.0.beta3"
  url 'https://culture3d:culture3d@geoportail.forge.ign.fr/hg/culture3d/archive/15b5ca0606eb.tar.gz'
  sha256 '6f2312dc570ba26161a642035b1d859a6cceebd323340a0580149567c741c0cf'

  depends_on 'qt5'
  depends_on 'cmake' => :build
  depends_on 'imagemagick'
  depends_on 'exiftool'
  depends_on 'proj'
  depends_on :x11

  def install
    args = std_cmake_args
    args << "-DWITH_QT5=ON"
    args << "-DQt5_DIR=#{Formula["qt5"].opt_prefix}"
    args << "-DBUILD_POISSON=OFF"
    args << "-DCUDA_ENABLED=OFF"
    args << "-DNO_X11=ON"
    system "cmake", ".", *args
    system "make"
    system "make", "install"
    prefix.install "bin"
  end


  test do
    system "#{bin}/mm3d"
  end
end

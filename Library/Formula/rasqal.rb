require 'formula'

class Rasqal < Formula
  homepage 'http://librdf.org/rasqal/'
  url 'http://download.librdf.org/source/rasqal-0.9.33.tar.gz'
  sha1 '281c2e0a352c53ef1656bfe778c380226d61726f'

  bottle do
    cellar :any
    sha1 "8c0c46000f6722eeeb94ebe41c8faca108fd807d" => :yosemite
    sha1 "d86ff8b2e52b8a09ce018a757b84c1b2b66fb2ee" => :mavericks
    sha1 "14efc7d7f18b8b9697cdacb43000cfa478579405" => :mountain_lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'raptor'

  def install
    system './configure', "--prefix=#{prefix}",
                          "--with-html-dir=#{share}/doc",
                          '--disable-dependency-tracking'
    system "make install"
  end
end

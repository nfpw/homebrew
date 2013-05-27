require 'formula'

class Otf2bdf < Formula
  homepage 'http://www.math.nmsu.edu/~mleisher/Software/otf2bdf/'
  url 'http://www.math.nmsu.edu/~mleisher/Software/otf2bdf/otf2bdf-3.1.tgz'
  sha1 '111f96e896f3d49202f4c82d1b16843fcb7a1208'

  depends_on 'freetype'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    inreplace 'Makefile' do |s|
      s.sub! "$(MKINSTALLDIRS) $(bindir) $(mandir)/man1", "mkdir -p $(bindir); mkdir -p $(mandir)/man1"
    end
    system "make", "install"
  end

  test do
    system "which otf2bdf"
  end
end

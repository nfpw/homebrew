require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Otf2bdf < Formula
  homepage 'http://www.math.nmsu.edu/~mleisher/Software/otf2bdf/'
  url 'http://www.math.nmsu.edu/~mleisher/Software/otf2bdf/otf2bdf-3.1.tgz'
  sha1 '111f96e896f3d49202f4c82d1b16843fcb7a1208'

  depends_on 'freetype' # if your formula requires any X11/XQuartz components

  def install
    # ENV.j1  # if your formula's build system can't parallelize
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    inreplace 'Makefile' do |s|
      s.sub! "$(MKINSTALLDIRS) $(bindir) $(mandir)/man1", "mkdir -p $(bindir); mkdir -p $(mandir)/man1"
    end
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test otf2bdf`.
    system "which otf2bdf"
  end
end

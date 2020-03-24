class Butterfly < Formula
  VERSION = "3.0.0"

  desc "Application code transformation tool"
  homepage "https://github.com/paypal/butterfly"
  url "https://search.maven.org/remotecontent?filepath=com/paypal/butterfly/butterfly-cli-package/#{VERSION}/butterfly-cli-package-#{VERSION}.zip"
  sha256 "3031194c36e173cdd4ce7c9865f121eaabae138c3a6ef2e32ad30525926f80b0"

  depends_on :java => "1.7+"

  def install
    inreplace "butterfly" do |s|
      s.prepend <<-EOS
        BUTTERFLY_HOME="#{prefix}"
      EOS
    end
    prefix.install("butterfly")
    prefix.install("lib")
    prefix.install("extensions")
    bin.install_symlink "#{prefix}/butterfly"
  end

  test do
    assert(system("butterfly", "-l"))
  end
end

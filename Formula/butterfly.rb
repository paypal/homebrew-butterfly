class Butterfly < Formula
  VERSION = "3.2.0"

  desc "Application code transformation tool"
  homepage "https://github.com/paypal/butterfly"
  url "https://search.maven.org/remotecontent?filepath=com/paypal/butterfly/butterfly-cli-package/#{VERSION}/butterfly-cli-package-#{VERSION}.zip"
  sha256 "7d662cf82f0018188a046c2b490a00729c04b792d1756d77541933f5308c7ea2"

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

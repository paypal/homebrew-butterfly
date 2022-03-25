class Butterfly < Formula
  VERSION = "3.2.3"

  desc "Application code transformation tool"
  homepage "https://github.com/paypal/butterfly"
  url "https://search.maven.org/remotecontent?filepath=com/paypal/butterfly/butterfly-cli-package/#{VERSION}/butterfly-cli-package-#{VERSION}.zip"
  sha256 "b9caf40f1127b6db0cab895ba5c3c224b6e3dc0e22561709013d870b6cf73738"

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

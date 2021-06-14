class Butterfly < Formula
  VERSION = "3.1.0"

  desc "Application code transformation tool"
  homepage "https://github.com/paypal/butterfly"
  url "https://search.maven.org/remotecontent?filepath=com/paypal/butterfly/butterfly-cli-package/#{VERSION}/butterfly-cli-package-#{VERSION}.zip"
  sha256 "17b976bb1f2b5dadf1022a4907633df953a6592afdce4bcb6d4c524cd8a659b9"

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

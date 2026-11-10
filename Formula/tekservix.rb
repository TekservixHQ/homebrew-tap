class Tekservix < Formula
  desc "Send SMS (SMS Gora) and WhatsApp messages (WAservix) from the command-line"
  homepage "https://github.com/TekservixHQ/tekservix-cli"
  url "https://github.com/TekservixHQ/tekservix-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "124f1c134010977d8eda0f8eb88bc2331bff3d4455d4a0e782a9639799e80ee3"
  license "MIT"

  uses_from_macos "curl"

  def install
    bin.install "bin/smsgora", "bin/waservix"
  end

  test do
    assert_match "smsgora #{version}", shell_output("#{bin}/smsgora --version")
    assert_match "waservix #{version}", shell_output("#{bin}/waservix --version")
    assert_match "set SMSGORA_KEY", shell_output("#{bin}/smsgora account 2>&1", 2)
  end
end

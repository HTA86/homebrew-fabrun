class Fabrun < Formula
  desc "A simple tool to run predefined commands"
  homepage "https://github.com/HTA86/fabrun"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HTA86/fabrun/releases/download/0.5.0/fabrun-darwin-arm64"
      sha256 "a31b412b33f910fb42e46c54693005c935ef4ec4f63eaf2ae036d3647213bdfa"
    else
      url "https://github.com/HTA86/fabrun/releases/download/0.5.0/fabrun-darwin-amd64"
      sha256 "041ee907e6296ee1cef1e147d62521c49867c0a5c6876c7a24186117ba1a04f2"
    end
  end

  on_linux do
    url "https://github.com/HTA86/fabrun/releases/download/0.5.0/fabrun-linux-amd64"
    sha256 "fa039e2d3af5d56d2a0cb140b49872e67a91b1c249286dff0000e264bdc9598b"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "fabrun-darwin-arm64" => "fabrun"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "fabrun-darwin-amd64" => "fabrun"
    elsif OS.linux?
      bin.install "fabrun-linux-amd64" => "fabrun"
    end
  end

  test do
    system "#{bin}/fabrun", "--version"
  end
end

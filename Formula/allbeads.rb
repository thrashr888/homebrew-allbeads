# Homebrew formula for AllBeads
# Install: brew tap thrashr888/allbeads && brew install allbeads
# Update SHA256 values when releasing a new version.

class Allbeads < Formula
  desc "Distributed protocol for agentic orchestration and communication"
  homepage "https://github.com/thrashr888/AllBeads"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-macos-aarch64"
      sha256 "1ca86260af4fc86f007d22e84c083420d779a7cb8cfa4a5a8f3ce4da1eec7077"
    end
    on_intel do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-macos-x86_64"
      sha256 "322932c74350d0195e19c144c2b9821ff836d650eba0f30905f4ea8f9eb073cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-linux-aarch64"
      sha256 "dc571312bfd6888ed95e7a8e4c7e668163a4f137ef5bb6e3a1d56ff04175bd6b"
    end
    on_intel do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-linux-x86_64"
      sha256 "0cb0e09be1e2fd6edecd39312c131f3dbf8e2a945b3ce9e99f6922eba3ef6b06"
    end
  end

  def install
    bin.install Dir["allbeads*"].first => "allbeads"
  end

  def caveats
    <<~EOS
      AllBeads has been installed as 'allbeads'.

      To use the shorter 'ab' alias, add to your shell config:
        alias ab='allbeads'

      Note: /usr/sbin/ab is Apache Bench, so we don't override it.

      Quick start:
        allbeads init            # Initialize configuration
        allbeads context add     # Add current repo as context
        allbeads stats           # View aggregated statistics
        allbeads tui             # Launch interactive dashboard

      Documentation: https://github.com/thrashr888/AllBeads
    EOS
  end

  test do
    system "#{bin}/allbeads", "--version"
  end
end

# Homebrew formula for AllBeads
# Install: brew tap thrashr888/allbeads && brew install allbeads
# Update SHA256 values when releasing a new version.

class Allbeads < Formula
  desc "Distributed protocol for agentic orchestration and communication"
  homepage "https://github.com/thrashr888/AllBeads"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-macos-aarch64"
      sha256 "7cb27d68da4ee0e6ed6f68bbf5f1c90512905f1db2a90c348f463fb97da10b34"
    end
    on_intel do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-macos-x86_64"
      sha256 "cfd044b81fcf57d818de6c65200e2a3563eac98203f7f2a9e6691497a48287a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-linux-aarch64"
      sha256 "94ef1d0d3e54f6c15d5a2b305d3f6806b0acbd586265e60991aba4e844fdb8a9"
    end
    on_intel do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-linux-x86_64"
      sha256 "b3d72907089cf7f7e9228fb87b8b2a0137680b4a8140dc3d91ad8fedad71e827"
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

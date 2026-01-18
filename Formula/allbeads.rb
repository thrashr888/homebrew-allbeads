# Homebrew formula for AllBeads
# Install: brew tap thrashr888/allbeads && brew install allbeads
# Update SHA256 values when releasing a new version.

class Allbeads < Formula
  desc "Distributed protocol for agentic orchestration and communication"
  homepage "https://github.com/thrashr888/AllBeads"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-macos-aarch64"
      sha256 "bdb9edcd1f8a159ec1aba9fe8d54c7953b47fe70a246fcadde2942b5b0af8a29"
    end
    on_intel do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-macos-x86_64"
      sha256 "7f464995cb6081fc066f8913adba8c5f83ccdac1ea2c7f86681f42436defa84c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-linux-aarch64"
      sha256 "009ca3fb307d764ef15df5deb1532893ec3efd962ec37e46a79d0e032eb5f32f"
    end
    on_intel do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-linux-x86_64"
      sha256 "4f33ec00b5c7293afb8abad68e5c61d36378b56fd485a47387778ac1c9cc353e"
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

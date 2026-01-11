# Homebrew formula for AllBeads
# Install: brew tap thrashr888/allbeads && brew install allbeads
# Update SHA256 values when releasing a new version.

class Allbeads < Formula
  desc "Distributed protocol for agentic orchestration and communication"
  homepage "https://github.com/thrashr888/AllBeads"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-macos-aarch64"
      sha256 "5a7980d6b2824bb8cff0553316c13721bf7a42027e9b3b38e7154d95b9df5219"
    end
    on_intel do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-macos-x86_64"
      sha256 "9e7c73a2fb63a499c9edbcbee920d757e0307381167347d929f5df6b7011f856"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-linux-aarch64"
      sha256 "be7ae1e880b328d76b89d45ec244c30d59a19fcb2e36fa94e0849647102a9b87"
    end
    on_intel do
      url "https://github.com/thrashr888/AllBeads/releases/download/v#{version}/allbeads-linux-x86_64"
      sha256 "5c71473d12f77d27921c4380f3a1ce8d9500f3bee09325db6a2e64976e4ca8f0"
    end
  end

  def install
    bin.install Dir["allbeads*"].first => "ab"
  end

  def caveats
    <<~EOS
      AllBeads has been installed as 'ab'.

      Quick start:
        ab init                  # Initialize configuration
        ab context add           # Add current repo as context
        ab stats                 # View aggregated statistics
        ab tui                   # Launch interactive dashboard

      For AI agents:
        ab quickstart            # Quick start guide
        ab prime                 # Prime agent context
        ab info                  # Project overview

      Documentation: https://github.com/thrashr888/AllBeads
    EOS
  end

  test do
    system "#{bin}/ab", "--version"
  end
end

cask "useragent-console" do
  version "0.5.0-rc.7"
  sha256 "b891b057eb467333ac68289f8f9a46bf9c3b21f5d9fe5ab1cb58c323fa18914e"

  url "https://github.com/tricorelife-labs/useragent-releases/releases/download/v#{version}/UserAgent-Console-aarch64.dmg"
  name "UserAgent Console"
  desc "Desktop dashboard for the UserAgent fleet / mesh broker"
  homepage "https://github.com/tricorelife-labs/useragent-releases"

  # Installing the GUI pulls the CLI (broker / mesh / agent) too, so one
  # `brew install tricorelife-labs/tap/useragent-console` gives the full kit.
  depends_on formula: "tricorelife-labs/tap/useragent"
  depends_on arch: :arm64

  app "UserAgent Console.app"

  caveats <<~EOS
    UserAgent Console is not Apple-notarized. On first launch macOS
    Gatekeeper will block it. To open it:
      - System Settings -> Privacy & Security -> "Open Anyway", or
      - xattr -dr com.apple.quarantine "/Applications/UserAgent Console.app"

    The console connects to a local broker at http://127.0.0.1:9999.
    Start one with:  useragent mesh
    Then paste your broker token in the app: Settings -> Connection.
  EOS
end

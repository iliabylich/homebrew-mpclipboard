cask "mpclipboard" do
  version "4.0.2"
  sha256 "6345b8ea594fca6bf9082836fb964f04012c0ed04a2d2e3cef968134f42a2841"

  url "https://github.com/iliabylich/mpclipboard/releases/download/v#{version}/mpclipboard_#{version}_arm64.dmg"
  name "mpclipboard"
  desc "Multi Platform Clipboard"
  homepage "https://github.com/iliabylich/mpclipboard"

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "mpclipboard.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/mpclipboard.app"]
  end

  uninstall quit: "mpclipboard.app"
end

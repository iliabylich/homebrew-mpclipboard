cask "mpclipboard" do
  version "3.0.1"
  sha256 "423a62555b27247d4988907a39112248fe77da65184cb685c3f96eaf4ec35d94"

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

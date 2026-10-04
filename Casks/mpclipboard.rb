cask "mpclipboard" do
  version "4.0.0"
  sha256 "c64f48ab90686157248d2989794a9ec0e7acba9766422a480b90e23a89ffc878"

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

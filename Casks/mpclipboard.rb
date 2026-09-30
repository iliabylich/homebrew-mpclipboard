cask "mpclipboard" do
  version "3.0.4"
  sha256 "f89d0f8eb9f106270a48dfd13dc76cd8112883e02957c44391ca08b1be6c6ba0"

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

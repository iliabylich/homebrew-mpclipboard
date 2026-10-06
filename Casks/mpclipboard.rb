cask "mpclipboard" do
  version "4.0.1"
  sha256 "891a8337ea8251f83b78c1a3b280fee188a4239cf443071367b256dc793a3cab"

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

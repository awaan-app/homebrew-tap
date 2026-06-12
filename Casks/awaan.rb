cask "awaan" do
  version "0.5.0"
  sha256 arm:   "e49114946fccac3cf50923db5560ba43a235fe736245d9d2addadd5db2f9fc0b",
         intel: "e49114946fccac3cf50923db5560ba43a235fe736245d9d2addadd5db2f9fc0b"

  url "https://7r9tr1bhb9tyyxrv.public.blob.vercel-storage.com/Awaan_0.5.0_universal.dmg"
  name "Awaan"
  desc "Privacy-first Islamic prayer times app for your desktop"
  homepage "https://awaan.cloud"

  livecheck do
    url "https://app.awaan.cloud/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  app "Awaan.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Awaan.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/cloud.awaan.app",
    "~/Library/Preferences/cloud.awaan.app.plist",
    "~/Library/Saved Application State/cloud.awaan.app.savedState",
  ]
end

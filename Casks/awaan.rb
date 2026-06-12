cask "awaan" do
  version "0.3.0"
  sha256 "b3b2c8a8498989bb3942a6f886cf79a4a2da91670c303acd6a41b55b966ef1d3"

  url "https://7r9tr1bhb9tyyxrv.public.blob.vercel-storage.com/Awaan_0.3.0_aarch64.dmg"
  name "Awaan"
  desc "Privacy-first Islamic prayer times app for your desktop"
  homepage "https://app.awaan.cloud"

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
    "~/Library/Application Support/com.digitalsanctuary.awaan",
    "~/Library/Preferences/com.digitalsanctuary.awaan.plist",
    "~/Library/Saved Application State/com.digitalsanctuary.awaan.savedState",
  ]
end

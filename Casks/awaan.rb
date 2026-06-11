cask "awaan" do
  version "0.2.0"
  sha256 "15db531ed145aa830dd115a71d74838856877bcad0f8a87bf15495672a02e9ba"

  url "https://7r9tr1bhb9tyyxrv.public.blob.vercel-storage.com/Awaan_0.2.0_aarch64.zip"
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

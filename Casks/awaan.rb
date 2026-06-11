cask "awaan" do
  version "0.2.0"
  sha256 "1b468e682069b1286e3578093cbdb8f8d99b3237839097fbf4da7a4b98c364d6"

  url "https://7r9tr1bhb9tyyxrv.public.blob.vercel-storage.com/Awaan_0.2.0_aarch64.dmg"
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

  zap trash: [
    "~/Library/Application Support/com.digitalsanctuary.awaan",
    "~/Library/Preferences/com.digitalsanctuary.awaan.plist",
    "~/Library/Saved Application State/com.digitalsanctuary.awaan.savedState",
  ]
end

cask "jennefer-hub" do
  version "0.1.44"
  sha256 "771760230d70b22acff8d6306caf8ba6a928021fdc42a5649bdfefc1226c7981"

  url "https://releases.jennefer.dev/apps/hub/stable/#{version}/Jennefer_Hub_#{version}_aarch64.dmg"
  name "Jennefer Hub"
  desc "Home of the Jennefer apps: local and cloud AI models, IDE, Studio and more"
  homepage "https://jennefer.dev/"

  livecheck do
    url "https://releases.jennefer.dev/apps/hub/stable/macos-dmg.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Jennefer Hub.app"

  # Yalnız Hub'ın kendi dosyaları; ~/.jennefer diğer Jennefer uygulamalarıyla ortak olduğu için silinmez.
  zap trash: [
    "~/Library/Application Support/com.jennefer.hub",
    "~/Library/Caches/com.jennefer.hub",
    "~/Library/Preferences/com.jennefer.hub.plist",
    "~/Library/Saved Application State/com.jennefer.hub.savedState",
    "~/Library/WebKit/com.jennefer.hub",
  ]
end

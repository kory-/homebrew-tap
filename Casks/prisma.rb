cask "prisma" do
  version "0.7.0"
  sha256 "79a38c29387e39c0cde04e190ee05f0e81dc2d29d12fb7b4b2b1a799d1e7acaa"

  url "https://github.com/kory-/prisma/releases/download/v#{version}/Prisma-#{version}-macOS-arm64.zip"
  name "Prisma"
  desc "Per-app volume mixer with menu bar controls"
  homepage "https://github.com/kory-/prisma"

  # Prisma currently ships public previews, which GitHub does not mark as latest.
  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next unless match
        next unless release.fetch("assets", []).any? do |asset|
          asset["name"] == "Prisma-#{match[1]}-macOS-arm64.zip"
        end

        match[1]
      end
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Prisma.app"

  caveats <<~EOS
    Prisma requires macOS 14.4 or later and an Apple Silicon Mac.
    This public preview is ad-hoc signed and is not notarized by Apple.
    macOS may require approval in System Settings > Privacy & Security
    before the first launch. Setup: https://github.com/kory-/prisma#install

    Chrome and Stream Deck integrations are optional; set them up in Prisma.
    Quit Prisma before upgrading. Uninstalling preserves your settings.
  EOS
end

# Prisma for Homebrew

The developer-maintained Homebrew tap for [Prisma](https://github.com/kory-/prisma), a native per-app volume mixer for macOS.

**Apple Silicon · macOS 14.4 or later · Public preview**

## Install

```sh
brew install --cask kory-/tap/prisma
```

Open Prisma from Applications, enable volume control, and allow system audio access when macOS asks. Chrome tab controls and Stream Deck are optional integrations with their own [setup instructions](https://github.com/kory-/prisma#install).

This installs the same app published on [GitHub Releases](https://github.com/kory-/prisma/releases), with a pinned SHA-256 checksum. The app is ad-hoc signed and **not notarized by Apple**. Homebrew does not remove macOS's security checks. If the first launch is blocked, follow [Apple's instructions for an app you trust](https://support.apple.com/en-us/102445). This tap is maintained by the Prisma developer and is not part of `homebrew/cask`.

If you already installed Prisma manually, quit it and move the old `Prisma.app` out of Applications before installing through Homebrew. Your per-app levels and preferences are stored separately and are retained. Avoid keeping two copies running.

## Update and uninstall

Quit Prisma before updating:

```sh
brew update
brew upgrade --cask kory-/tap/prisma
```

The tap follows published Prisma previews and stable releases. `brew upgrade` installs a newer version when its cask has been updated here. It does not update a running app in the background.

```sh
brew uninstall --cask kory-/tap/prisma
```

Uninstalling removes the app and preserves settings. Separately installed Chrome extensions and Stream Deck plugins are retained.

## 日本語

Apple Silicon搭載Mac、macOS 14.4以降に対応します。

```sh
brew install --cask kory-/tap/prisma
```

「アプリケーション」からPrismaを開き、音量コントロールをオンにしてシステムオーディオへのアクセスを許可してください。Chrome・Stream Deck連携は任意です。

この試験版はAppleの公証を受けていません。brew経由でも初回起動時の確認は必要になる場合があります。ブロックされた場合は、信頼するアプリ向けの[Appleの案内](https://support.apple.com/ja-jp/102445)を確認してください。

手動で導入済みの場合は、Prismaを終了し、古い `Prisma.app` を「アプリケーション」の外へ移動してからインストールしてください。設定は維持されます。更新はPrismaを終了してから上記の `brew update` と `brew upgrade` を実行します。

## Maintaining this tap

For each release, update `version` and `sha256` in `Casks/prisma.rb` to match the published Apple Silicon ZIP and `SHA256SUMS.txt`. Never point the cask at an unpublished local build. `brew livecheck --cask kory-/tap/prisma` includes published previews that have the matching app ZIP.

The prerelease audit exception is limited to the current preview version in `audit_exceptions/github_prerelease_allowlist.json`. Update it when distributing another preview; remove it for a stable release.

CI installs the checked-out cask on an Apple Silicon macOS runner, verifies the app metadata, architecture and ad-hoc signature integrity, and checks Homebrew style and online audits. It then uninstalls the app. It does not exercise audio capture or certify Apple notarization.

Report app problems in [Prisma issues](https://github.com/kory-/prisma/issues); report installation problems in [this tap's issues](https://github.com/kory-/homebrew-tap/issues).

MIT licensed. See [LICENSE](LICENSE).

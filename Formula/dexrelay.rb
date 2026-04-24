class Dexrelay < Formula
  desc "DexRelay installer and CLI for the Codex Relay Mac runtime"
  homepage "https://assets.dexrelay.app/setup-guide.html"
  url "https://assets.dexrelay.app/install.sh"
  sha256 "8a511abff116006820f554c21197c9949518afd143864ffcf6b8d44f074a7352"
  version "0.1.31"

  depends_on "jq"
  depends_on "node"
  depends_on "python"

  resource "bridge.js" do
    url "https://assets.dexrelay.app/bridge.js"
    sha256 "8cf75c516e42ccbc0f1dc5d4299ed454ecf0210dc98d614e54e7ee7750ac1023"
  end

  resource "relay-server.js" do
    url "https://assets.dexrelay.app/relay-server.js"
    sha256 "0d5c28c834f5e1c189a9139c8c9dfea118450cb2af263ed42be8a4156fe474ce"
  end

  resource "relay-connector.js" do
    url "https://assets.dexrelay.app/relay-connector.js"
    sha256 "1d29d5681798bc067a89e2d09c7f8ad25f6fc3dd53348c65e0763bf4fe60d7ec"
  end

  resource "helper.py" do
    url "https://assets.dexrelay.app/helper.py"
    sha256 "8adaa178ee00fe197638e696a0e98010d1e30ae04c7a62c4bc3e905ed48d2161"
  end

  resource "package.json" do
    url "https://assets.dexrelay.app/package.json"
    sha256 "e32c8d84aaf2515282f3b1446a30a6ca015e6a39219634527988a8692710e5ca"
  end

  resource "dexrelay" do
    url "https://assets.dexrelay.app/dexrelay"
    sha256 "8782bfcd726ec52221aee04cca32c125de711562a6e8dcaf3da970a198ab1fc1"
  end

  resource "create-mac-project.sh" do
    url "https://assets.dexrelay.app/create-mac-project.sh"
    sha256 "8de2b32e37a651bf2da4580c9cc1c672048c443ffdf8b450720eeac8b1ec27be"
  end

  resource "git-project-automation.sh" do
    url "https://assets.dexrelay.app/git-project-automation.sh"
    sha256 "22adee936f1fdf73597d0412ee3b824621afc4f61b0e336ed5f74bdcedd78477"
  end

  resource "governancectl.py" do
    url "https://assets.dexrelay.app/governancectl.py"
    sha256 "6ff68fd36fff0e4baf10447622447321f7d41490b57a683f887bf80b2b59a1fa"
  end

  resource "services.registry.json" do
    url "https://assets.dexrelay.app/services.registry.json"
    sha256 "1b459dbe5ae219cdc278eb1d0c086236ba28855edeb7223f20e57429f7dd026d"
  end

  resource "servicectl.py" do
    url "https://assets.dexrelay.app/servicectl.py"
    sha256 "fe498ad2f7ffa1b1b5e31477d73030ef983d487afeec7b3d94654a7c671f64b9"
  end

  resource "rebuild-workspace-services.py" do
    url "https://assets.dexrelay.app/rebuild-workspace-services.py"
    sha256 "58946bf099a0eb3267ce250bf641c91b3fd93d9a9ad17212ac487b206afe919e"
  end

  resource "migrate-dexrelay-state.py" do
    url "https://assets.dexrelay.app/migrate-dexrelay-state.py"
    sha256 "c963f5e2a9756f466d7d71805764aefdb7a646f2fd60bbe522237f6d1e6cc5ea"
  end

  resource "xcode-devdir.sh" do
    url "https://assets.dexrelay.app/xcode-devdir.sh"
    sha256 "a0a6c2c4c93352db76235e2425252351d08dab9b9455881ee1067eef90129f21"
  end

  resource "run-ios-device.sh" do
    url "https://assets.dexrelay.app/run-ios-device.sh"
    sha256 "72161356f18bd188df8524b33e1b3dce62a0224b54028fd4881e891e43eae1a6"
  end

  resource "run-ios-on-phone.sh" do
    url "https://assets.dexrelay.app/run-ios-on-phone.sh"
    sha256 "7201f46bec8b383ac5452fd3c08ed1103592691385678b80503432cf1236145e"
  end

  resource "publish-ios-adhoc-ota.sh" do
    url "https://assets.dexrelay.app/publish-ios-adhoc-ota.sh"
    sha256 "3e01206d5220e3a67ab6fe0bfe4b2c5a13020026932c9bc65ca83e281bc512bd"
  end

  resource "prepare-ios-testflight.py" do
    url "https://assets.dexrelay.app/prepare-ios-testflight.py"
    sha256 "4e75f4cdbf0e9a054c74d9697ecfae8f2006e9d5148d12e97e2d91888451140a"
  end

  resource "ios_testflight_common.py" do
    url "https://assets.dexrelay.app/ios_testflight_common.py"
    sha256 "5d1344643c50a79586a2282c3e9b7e7ca580ee0923f72b8679423ab1ddba89d4"
  end

  resource "codex-health-daemon.py" do
    url "https://assets.dexrelay.app/codex-health-daemon.py"
    sha256 "b1909ca2378c79792ce2dc94663d39d36885165f0c2865785665a4843ad03795"
  end

  resource "health-ui-index.html" do
    url "https://assets.dexrelay.app/health-ui-index.html"
    sha256 "ff365713fd9a8be56ade162a86e9a989138e46df566433154afe5f2d46f899a3"
  end

  resource "health-ui-app.js" do
    url "https://assets.dexrelay.app/health-ui-app.js"
    sha256 "b494bc44b5fd60ac42201e64c16b5adad34b8620bce84a93a0077b03b9d745c3"
  end

  resource "health-ui-styles.css" do
    url "https://assets.dexrelay.app/health-ui-styles.css"
    sha256 "ef789b18a3c401aab70b4830d70fedced2df57beb52e640c3cffd138d95e7b58"
  end

  def install
    (libexec/"payload").mkpath
    mv "install.sh", libexec/"install.sh"

    resource("bridge.js").stage do
      (libexec/"payload").install "bridge.js"
    end

    resource("relay-server.js").stage do
      (libexec/"payload").install "relay-server.js"
    end

    resource("relay-connector.js").stage do
      (libexec/"payload").install "relay-connector.js"
    end

    resource("helper.py").stage do
      (libexec/"payload").install "helper.py"
    end

    resource("package.json").stage do
      (libexec/"payload").install "package.json"
    end

    resource("dexrelay").stage do
      (libexec/"payload").install "dexrelay"
    end

    (bin/"dexrelay").write <<~EOS
      #!/usr/bin/env bash
      set -euo pipefail
      export CODEX_RELAY_INSTALL_SCRIPT="#{libexec}/install.sh"
      export CODEX_RELAY_LOCAL_PAYLOAD_ROOT="#{libexec}/payload"
      export CODEX_RELAY_CLI_VERSION="#{version}"
      exec "#{libexec}/payload/dexrelay" "$@"
    EOS

    resource("create-mac-project.sh").stage do
      (libexec/"payload").install "create-mac-project.sh"
    end

    resource("git-project-automation.sh").stage do
      (libexec/"payload").install "git-project-automation.sh"
    end

    resource("governancectl.py").stage do
      (libexec/"payload").install "governancectl.py"
    end

    resource("services.registry.json").stage do
      (libexec/"payload").install "services.registry.json"
    end

    resource("servicectl.py").stage do
      (libexec/"payload").install "servicectl.py"
    end

    resource("rebuild-workspace-services.py").stage do
      (libexec/"payload").install "rebuild-workspace-services.py"
    end

    resource("migrate-dexrelay-state.py").stage do
      (libexec/"payload").install "migrate-dexrelay-state.py"
    end

    resource("xcode-devdir.sh").stage do
      (libexec/"payload").install "xcode-devdir.sh"
    end

    resource("run-ios-device.sh").stage do
      (libexec/"payload").install "run-ios-device.sh"
    end

    resource("run-ios-on-phone.sh").stage do
      (libexec/"payload").install "run-ios-on-phone.sh"
    end

    resource("publish-ios-adhoc-ota.sh").stage do
      (libexec/"payload").install "publish-ios-adhoc-ota.sh"
    end

    resource("prepare-ios-testflight.py").stage do
      (libexec/"payload").install "prepare-ios-testflight.py"
    end

    resource("ios_testflight_common.py").stage do
      (libexec/"payload").install "ios_testflight_common.py"
    end

    resource("codex-health-daemon.py").stage do
      (libexec/"payload").install "codex-health-daemon.py"
    end

    resource("health-ui-index.html").stage do
      (libexec/"payload").install "health-ui-index.html"
    end

    resource("health-ui-app.js").stage do
      (libexec/"payload").install "health-ui-app.js"
    end

    resource("health-ui-styles.css").stage do
      (libexec/"payload").install "health-ui-styles.css"
    end

    chmod 0755, bin/"dexrelay"
    chmod 0755, libexec/"payload/dexrelay"
  end

  test do
    assert_match "dexrelay", shell_output("#{bin}/dexrelay version")
  end
end

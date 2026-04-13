class Dexrelay < Formula
  desc "DexRelay installer and CLI for the Codex Relay Mac runtime"
  homepage "https://assets.dexrelay.app/setup-guide.html"
  url "https://assets.dexrelay.app/install.sh"
  sha256 "485c32f39a5a4e018a5e37d02022839061e9edff15d8b710e58fa4740fa8d759"
  version "0.1.18"

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
    sha256 "99922fcc80ffc4cc29200602db58def88f2be1b90b945103c4a217513e6e0a9a"
  end

  resource "package.json" do
    url "https://assets.dexrelay.app/package.json"
    sha256 "2cc1887907457c2bc4bebb8e44f5eab1c69f528b2a07f27971cc727905164bed"
  end

  resource "dexrelay" do
    url "https://assets.dexrelay.app/dexrelay"
    sha256 "bd543f011d5a782643f21dc9f74320176fb42b9ae3f7dcb10206e51c60969499"
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
    sha256 "cd84234716d7703e7664b586a8a86aa621358c22798ca06d3239bc00b58c3bfe"
  end

  resource "services.registry.json" do
    url "https://assets.dexrelay.app/services.registry.json"
    sha256 "1b459dbe5ae219cdc278eb1d0c086236ba28855edeb7223f20e57429f7dd026d"
  end

  resource "servicectl.py" do
    url "https://assets.dexrelay.app/servicectl.py"
    sha256 "e7fc0c6f13626a32a5a7bf13a1c528f98ac335d9aafc6efff1c0ffd397279929"
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

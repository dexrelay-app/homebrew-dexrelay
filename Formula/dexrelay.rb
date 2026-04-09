class Dexrelay < Formula
  desc "DexRelay installer and CLI for the Codex Relay Mac runtime"
  homepage "https://assets.dexrelay.app/setup-guide.html"
  url "https://assets.dexrelay.app/install.sh"
  sha256 "c4f2e0b4407e539c27f373db59f9abcb49ca8874d37e09b14f31ef98e318d815"
  version "0.1.13"

  depends_on "jq"
  depends_on "node"
  depends_on "python"

  resource "bridge.js" do
    url "https://assets.dexrelay.app/bridge.js"
    sha256 "eef5620571684477d4834a93517228f4c4227a3c027778e7c556ce1b39eb47e8"
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
    sha256 "a70821591a1ccf04eb498ef12eab93005cd361e866b3d94a95e77c3493071e74"
  end

  resource "package.json" do
    url "https://assets.dexrelay.app/package.json"
    sha256 "2cc1887907457c2bc4bebb8e44f5eab1c69f528b2a07f27971cc727905164bed"
  end

  resource "dexrelay" do
    url "https://assets.dexrelay.app/dexrelay"
    sha256 "8ddb84b2bebf8dbb911d33f910654fd07e34815626e81a731f884318415f9f2d"
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
    sha256 "11e3973073339149b9005362edc3ddabb4291608ad64ed9b22a2a242609995db"
  end

  resource "services.registry.json" do
    url "https://assets.dexrelay.app/services.registry.json"
    sha256 "1b459dbe5ae219cdc278eb1d0c086236ba28855edeb7223f20e57429f7dd026d"
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

    chmod 0755, bin/"dexrelay"
    chmod 0755, libexec/"payload/dexrelay"
  end

  test do
    assert_match "dexrelay", shell_output("#{bin}/dexrelay version")
  end
end

{
  fetchFromGitHub,
  lib,
  bash,
  lemurs,
  linux-pam,
  rustPlatform,
  systemdMinimal,
  testers,
}:
rustPlatform.buildRustPackage {
  pname = "lemurs";
  version = "0.3.2-unstable-2024-07-24";

  src = fetchFromGitHub {
    owner = "coastalwhite";
    repo = "lemurs";
    rev = "1d4be7d0c3f528a0c1e9326ac77f1e8a17161c83";
    hash = "sha256-t/riJpgy0bD5CU8Zkzket4Gks2JXXSLRreMlrxlok0c=";
  };

  cargoHash = "sha256-iQ46b0EzhHBm10IHQ5SYPJKKiySj0Q1j+91UoswAX/c=";

  buildInputs = [
    bash
    linux-pam
    systemdMinimal
  ];

  passthru.tests.version = testers.testVersion {
    package = lemurs;
    version = "0.3.2";
  };

  meta = with lib; {
    description = "Customizable TUI display/login manager written in Rust";
    homepage = "https://github.com/coastalwhite/lemurs";
    license = with licenses; [
      asl20
      mit
    ];
    maintainers = with maintainers; [
      jeremiahs
      nullcube
    ];
    mainProgram = "lemurs";
  };
}

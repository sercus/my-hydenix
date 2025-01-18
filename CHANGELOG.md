## [1.3.1](https://github.com/richen604/hydenix/compare/v1.3.0...v1.3.1) (2025-01-18)


### Bug Fixes

* added user hostname to nix configurations, improves dot notation ([373caed](https://github.com/richen604/hydenix/commit/373caed0d7d2600aa617a096e532aa91664c6d9a))
* removed pkgs from special args, fixes user provided overlays ([1c40217](https://github.com/richen604/hydenix/commit/1c402174434ea5243c765ae6b222894d3be8a824))

# [1.3.0](https://github.com/richen604/hydenix/compare/v1.2.0...v1.3.0) (2025-01-16)


### Bug Fixes

* allow themepatcher to run on activationScripts ([43bad79](https://github.com/richen604/hydenix/commit/43bad793079b37e8fe98fc027a22474a065f5245))
* allow themeswitch to work without hyprland ([363720b](https://github.com/richen604/hydenix/commit/363720b7a3376e498257dd7dd44920f51c0d294f))
* commit hash for fonts package ([2362241](https://github.com/richen604/hydenix/commit/236224139850530cc415703f536c32401c39e675))
* re-added hyprland xdg portal ([c44fa02](https://github.com/richen604/hydenix/commit/c44fa02066420f2e09dda26b1d37b4459421556a))


### Features

* 25.05 update ([899d39a](https://github.com/richen604/hydenix/commit/899d39aadf67b288622136d1743572f0f215ec2d))
* add separate nixpkgs instance for user packages ([#17](https://github.com/richen604/hydenix/issues/17)) ([5394a94](https://github.com/richen604/hydenix/commit/5394a943867d55bd7e6b269f9607b9586a2453d7))
* common rebuild command, added better updating docs ([ad5b8c3](https://github.com/richen604/hydenix/commit/ad5b8c30e9f6e7e35ea349bf037f3625d893eec6))
* gave display for settheme ([6c88a34](https://github.com/richen604/hydenix/commit/6c88a3462e4efefd3f1ef8537739d839fd9f19f2))
* home-manager hyprland, xdg ([6992ff5](https://github.com/richen604/hydenix/commit/6992ff58726c55b6a94fe1aae0276e3b6d1b00ad))
* iso builder ([088c5f8](https://github.com/richen604/hydenix/commit/088c5f8c80bb5c2e70afd8958a75bd4157b2bb85))
* kdepackages for qt6 ([0039b4c](https://github.com/richen604/hydenix/commit/0039b4ccc2b88d26956f179558cac2fa8ccc5bce))
* update hyprdots, no more dconf ([2c5cb4c](https://github.com/richen604/hydenix/commit/2c5cb4cb12dd24b991fe36293ab0d4960f2ffb61))
* updated hyde cli ([bda2305](https://github.com/richen604/hydenix/commit/bda23050bd3752059343a7e74d6c11d67eaa5722))
* updated hyde stub meta ([fdd96fc](https://github.com/richen604/hydenix/commit/fdd96fcf31560f048dfc47e7e3fc4f7e156274f0))
* updated iso build and install script ([0a6d889](https://github.com/richen604/hydenix/commit/0a6d889feb4db35824f383fa5f139fac4077588d))

# [1.2.0](https://github.com/richen604/hydenix/compare/v1.1.1...v1.2.0) (2024-11-25)


### Bug Fixes

* bad blood theme hash, gtk theme link ([88ada26](https://github.com/richen604/hydenix/commit/88ada268f77316dda2eadf4b445afeb0de8d21f6))


### Features

* common gitignore for template ([4b65547](https://github.com/richen604/hydenix/commit/4b655478b69266dce065053a97cce7f657b607e1))

## [1.1.1](https://github.com/richen604/hydenix/compare/v1.1.0...v1.1.1) (2024-11-21)


### Bug Fixes

* removed nixpkgs from custom inputs in template ([1370c44](https://github.com/richen604/hydenix/commit/1370c44d3fd2b0bfb2c33b0d966d954915685f9d))

# [1.1.0](https://github.com/richen604/hydenix/compare/v1.0.0...v1.1.0) (2024-11-21)


### Bug Fixes

* removed overriding nixpkgs from flake template ([85067a4](https://github.com/richen604/hydenix/commit/85067a4402f3b2a303fba22b6a79014722b72502))


### Features

* user flake input args for mkconfig ([ef9feb5](https://github.com/richen604/hydenix/commit/ef9feb53494d697fbac1ed9716e376992e0d426f))

# 1.0.0 (2024-11-18)


### Bug Fixes

* cleaned up source paths for derivs ([8d384e9](https://github.com/richen604/hydenix/commit/8d384e91153de5173a318cafb4398117fdc9159f))
* config/template inconsistencies, makestubmeta ([cac7bbd](https://github.com/richen604/hydenix/commit/cac7bbdfe69b8ab3a2b815c680d2edd132bf8d56))
* gen-config ([62477d4](https://github.com/richen604/hydenix/commit/62477d420e76c1a0a2cc3b2d2e85356f98815e67))
* hydenix ascii for template ([9ae9f99](https://github.com/richen604/hydenix/commit/9ae9f99ffc96a7ab8a8051b762b523206502ebc1))
* improper gen-config ([5202f97](https://github.com/richen604/hydenix/commit/5202f975d974c8bb439bcf9922e837b20ff6a0c1))
* mutable performance ([469a02a](https://github.com/richen604/hydenix/commit/469a02a4abeebd45d40daf4ef763f27a58c533b7))
* polkit and udisk stuff ([571cfa5](https://github.com/richen604/hydenix/commit/571cfa539d80db7028c38a89cd6c06ee2f629666))
* removed auto backup file extension ([81129d7](https://github.com/richen604/hydenix/commit/81129d7a7c62b071cfaa723a71d6a07f27f3265b))
* removed hyde-firefox, Hyde sddm start ([3d4630e](https://github.com/richen604/hydenix/commit/3d4630e095907262e6f6480980bf3c833398eecf))
* revised arc deriv source names and hash handling, rebuilt all hashes ([f2ad3a7](https://github.com/richen604/hydenix/commit/f2ad3a7da37555d259e8aca135dab7ef10101ce9))
* settheme. vscode usersettings ([348de0b](https://github.com/richen604/hydenix/commit/348de0bc87f80c6312a243b0e7078663a51c0778))
* shebangs for hyde and hyde-cli, polkit prep ([e474d3f](https://github.com/richen604/hydenix/commit/e474d3f61fe332b36258c28badcd6065360c798c))
* split home.file calls for hyde configs ([7550875](https://github.com/richen604/hydenix/commit/75508754c88f57a90761c1dd95e79e6396f8a398))
* syntax error ([ade9b71](https://github.com/richen604/hydenix/commit/ade9b7192966bd093652ff0fa613a28123481820))
* update template flake input for hydenix ([a8ced50](https://github.com/richen604/hydenix/commit/a8ced5001032318f4cbcaf9cdbb6eeef50866b87))
* xdg config and icon top level ([4a65525](https://github.com/richen604/hydenix/commit/4a6552516f24fa46aca3c9cb0e98e3044f738fae))
* xdg flag for opening in portal, xdg gtk portal ([1c0baf2](https://github.com/richen604/hydenix/commit/1c0baf2f342f71d5fba022e1854bd1c4c46dc243))


### Features

* added back gen-config as its useful again ([7e25094](https://github.com/richen604/hydenix/commit/7e25094471c1f0c74f5b8d8fa0454ed4d17a6e2e))
* added comma ([977b582](https://github.com/richen604/hydenix/commit/977b5823d31a95c0c5c31d28bd1a9df19c9d3d2b))
* added hardware config to main config ([4a08080](https://github.com/richen604/hydenix/commit/4a080800fe20424b2c8074145391f4fd1691db35))
* driver.nix config ([32e7d82](https://github.com/richen604/hydenix/commit/32e7d820e62faac871eed83c135b857a221cef4b))
* extend modules using config.nix. cleaned flake ([bc37b63](https://github.com/richen604/hydenix/commit/bc37b63d33b19b244e6e00a8bfd152420c851900))
* function in flake for customizing imported builds ([edbf586](https://github.com/richen604/hydenix/commit/edbf5864e3b50ec3cc94f3b85703532f1c89fccb))
* gen-theme-activation ([84e3085](https://github.com/richen604/hydenix/commit/84e30859b85e844776a2fe99102d0e612017fb38))
* hyde.conf to config.nix ([b787bde](https://github.com/richen604/hydenix/commit/b787bde456645291d912e91f62018ad00769130a))
* icon builds, pinned arcs to hash ([59ccd28](https://github.com/richen604/hydenix/commit/59ccd2818dff806ce2e56e3cb8d96bb0fd80e556))
* revamp global config.nix to support home-manager options ([280e8b3](https://github.com/richen604/hydenix/commit/280e8b3ad64c6701160bf79122998027910f06b2))
* rtkit and bluetooth ([9c22554](https://github.com/richen604/hydenix/commit/9c225546bcaace21e0e4a7f60d920be7f470960a))
* sddm-themes, working with cursor, bumped arcs ([391bdb8](https://github.com/richen604/hydenix/commit/391bdb847e5c7852f06b298d0952757720eab0c4))
* skipwallbash for config, userconfig example ([9aff8ae](https://github.com/richen604/hydenix/commit/9aff8ae851c938e6cf972f333de822f4e28b7751))
* template for easy setup ([9198ffe](https://github.com/richen604/hydenix/commit/9198ffe58e9024f2819673214dd5eb48c4cfc38f))
* wallbash config option, removed unnecessary git args ([b294707](https://github.com/richen604/hydenix/commit/b294707a1d730776bf19dd8ba54fc3660b4168d2))

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial release
- NixOS VM support
- Cross-distro VM support (beta)
- HyDE-cli integration
- Build-time theme fetching
- Home-manager configuration

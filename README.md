# bluebiri &nbsp; [![bluebuild build badge](https://github.com/a0leaves/bluebiri/actions/workflows/build.yml/badge.svg)](https://github.com/a0leaves/bluebiri/actions/workflows/build.yml)

The aim of this project is to ship a cutting edge stack of desktop tools complementary to Niri. At present, the `bluefin:stable` and `bazzite-gnome:stable` images serve as the foundation which means the full GNOME DE can be used as a fallback.

At present, the image includes the app launcher Walker, the status bar Ironbar, awww for wallpapers, and Soteria as the polkit solution. Services to start them are also included and enabled. However, there is no configuration or styling ready at this time. 

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

## Installation

> [!WARNING]
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  # Bluefin-based
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/a0leaves/bluebiri:latest
  ```
  ```
  # Bazzite-based
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/a0leaves/bazzbiri:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  # Bluefin-based
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/a0leaves/bluebiri:latest
  ```
    ```
  # Bazzite-based
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/a0leaves/bazzbiri:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/a0leaves/bluebiri
```

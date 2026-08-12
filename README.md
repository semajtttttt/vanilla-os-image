# Custom Vanilla Gaming

A custom Vanilla OS 2 Orchid image based on `ghcr.io/vanilla-os/nvidia:main` with gaming-focused additions: Steam, Docker, Devin Desktop (via .deb), xpadneo, a themed GNOME desktop, the Vanilla OS wallpaper collection, and a folder for your own wallpapers.

## Repository layout

- `recipe.yml`: Vib recipe describing the image build.
- `.github/workflows/vib-build.yml`: GitHub Actions workflow that checks the base image for updates, builds the Vib image, and pushes it to GHCR.
- `.github/workflows/release.yml`: Creates a GitHub release and uploads the generated `Containerfile` when a tag is pushed.
- `.github/dependabot.yml`: Dependabot configuration for keeping the GitHub Actions versions up to date.
- `modules/`: Shared Vib modules used by `recipe.yml`.
- `modules/55-vanilla-backgrounds.yml`: Downloads and installs the Vanilla OS wallpaper collection.
- `includes.container/usr/share/backgrounds/custom/`: Drop your own wallpaper images here and they will be included in the image.
- `includes.container/`: Files that are added to the image, including the ABRoot configuration.

## Custom wallpapers

Place your own `.jpg`, `.png`, `.webp`, or `.svg` wallpapers in `includes.container/usr/share/backgrounds/custom/`. They will appear in the image at `/usr/share/backgrounds/custom/` alongside the Vanilla OS wallpapers.

## Build

Pushing to `main`, creating a tag, or running the workflow manually triggers a build. The image is published to:

```
ghcr.io/<your-github-username>/custom-vanilla-gaming
```

## Use

After a successful build, point ABRoot to the image:

```bash
abroot config-editor
```

Change the `name` entry from `vanilla-os/nvidia` to `ghcr.io/<your-github-username>/custom-vanilla-gaming` (all lowercase) and run:

```bash
abroot upgrade
```

# bat, the better cat

## Good to know options

1. -p, --plain
    - Output the plain content of the file without any line number or addition.
1. --paging=never
    - For long files, by default, the output is piped into less. This option removes that behavior.

## Integrate with other tools

bat can be integrated with other tools by becoming their printer, bringing syntax highlighting to places where it was only a dream.
[Check out](https://github.com/sharkdp/bat?#integration-with-other-tools) for a list of tools and how the integration works.

## Install additional theme

bat comes bundled with a good set of preconfigured themes.
However, it is missing the Catppuccin theme.
Follow the guide below to download and update bat with this theme.

> _**NOTE:**_ As the config sets the default theme to Cappuccin if the step below are not completed expect to see failures when invoking bat

Create the directory where bat will look for additional themes

```sh
mkdir -p "$(bat --config-dir)/themes"
```

Download the theme from the repo

```sh
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
```

Update bat with the new theme

```sh
bat cache --build
```

Enjoy

Guide derived from [Catppuccin theme](https://github.com/catppuccin/bat)

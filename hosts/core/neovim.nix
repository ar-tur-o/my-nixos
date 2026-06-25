{ inputs, ... }: {
  imports = [ inputs.nvf.nixosModules.default ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      theme.enable = true;

      treesitter = {
        enable = true;
        autotagHtml = true;
        context.enable = true;
      };

      autopairs.nvim-autopairs.enable = true;
      comments.comment-nvim.enable = true;
      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
      };

      options = {
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
      };

      syntaxHighlighting = true;

      visuals = {
        blink-indent.enable = true;
        cinnamon-nvim.enable = true;
        highlight-undo.enable = true;
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
        rainbow-delimiters.enable = true;
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers.wl-copy.enable = true;
      };

      lsp = {
        enable = true;
        trouble.enable = true;
        # tailwind is a separate setting here for some reason
        presets.tailwindcss-language-server.enable = true;
      };

      languages = {
        enableTreesitter = true;

        # General scripting for systems
        nix.enable = true;
        bash.enable = true;
        lua.enable = true;
        python.enable = true;

        # General good-to-haves
        markdown.enable = true;
        json.enable = true;
        yaml.enable = true;
        toml.enable = true;
        xml.enable = true;

        # web dev
        svelte.enable = true;
        tsx.enable = true;
        html.enable = true;
        css.enable = true;
        typescript.enable = true;

        # Fun!
        csharp.enable = true;
      };
    };
  };
}

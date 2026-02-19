{ pkgs, ... }:
{
  config = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "agentic-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "carlos-algms";
          repo = "agentic.nvim";
          rev = "53dcb741bcfe7ffcc4f8d6b282659d5bedbf08c0";
          hash = "sha256-ZJ4VQgaunGTAuzV2uCGtGQbg92Efoe3b0PT2mVbDa+o=";
        };
        doCheck = false;
      })
      (pkgs.vimPlugins.img-clip-nvim)
    ];

    extraConfigLua = ''
      require("img-clip").setup({})

      require("agentic").setup({
        provider = "claude-acp",
      })
    '';

    keymaps = [
      {
        key = "<leader>at";
        mode = [
          "n"
          "v"
        ];
        action.__raw = "function() require('agentic').toggle() end";
        options = {
          desc = "Toggle Agentic Chat";
        };
      }
      {
        key = "<leader>aa";
        mode = [
          "n"
          "v"
        ];
        action.__raw = "function() require('agentic').add_selection_or_file_to_context() end";
        options = {
          desc = "Add file or selection to Agentic Context";
        };
      }
      {
        key = "<leader>an";
        mode = [
          "n"
          "v"
        ];
        action.__raw = "function() require('agentic').new_session() end";
        options = {
          desc = "New Agentic Session";
        };
      }
      {
        key = "<leader>ac";
        mode = [
          "n"
          "v"
        ];
        action.__raw = "function() require('agentic').close() end";
        options = {
          desc = "Close Agentic Chat";
        };
      }
      {
        key = "<leader>ao";
        mode = [
          "n"
          "v"
        ];
        action.__raw = "function() require('agentic').open() end";
        options = {
          desc = "Open Agentic Chat";
        };
      }
      {
        key = "<leader>af";
        mode = [
          "n"
        ];
        action.__raw = "function() require('agentic').add_file() end";
        options = {
          desc = "Add current file to Agentic Context";
        };
      }
      {
        key = "<leader>as";
        mode = [
          "v"
        ];
        action.__raw = "function() require('agentic').add_selection() end";
        options = {
          desc = "Add selection to Agentic Context";
        };
      }
      {
        key = "<leader>aS";
        mode = [
          "n"
          "v"
        ];
        action.__raw = "function() require('agentic').stop_generation() end";
        options = {
          desc = "Stop Agentic generation";
        };
      }
    ];
  };
}

{ ... }:

# ~/.config/nvim stays a real folder: vim.pack writes its lockfile there.
{
  hjem.users.eduardo.files = {
    ".config/nvim/init.lua".source = ./init.lua;
    ".config/nvim/secretspec.toml".source = ./secretspec.toml;
    ".config/nvim/lua".source = ./lua;
    ".config/nvim/lsp".source = ./lsp;
  };
}

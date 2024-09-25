{
  description = "A very basic flake";

  inputs = {
    emacsConfig = { url = "/home/sst/git/emacs-config"; };
  };

  outputs = { self, emacsConfig }: { devShells = emacsConfig.elixirDevShells; };
}

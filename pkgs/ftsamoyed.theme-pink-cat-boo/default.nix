{
  lib,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    publisher = "ftsamoyed";
    name = "theme-pink-cat-boo";
    version = "1.3.0";
    hash = "sha256-FD7fim0sRWAADzDAbhV3dnYW3mxoSgVPLs5Wkg5r01k=";
  };

  meta = {
    description = "A sweet and cute theme especially for coder girls.";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=ftsamoyed.theme-pink-cat-boo";
    homepage = "https://github.com/ftsamoyed/PinkCatBoo";
    changelog = "https://github.com/ftsamoyed/PinkCatBoo#update";
    license = lib.licenses.mit;
    maintainers = with maintainers; [ "MinimalMio" ];
    platforms = platforms.all;
  };
}
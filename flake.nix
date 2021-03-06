{
  description = ''Implementation of Luhn algorithm in nim.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."luhncheck-master".dir   = "master";
  inputs."luhncheck-master".owner = "nim-nix-pkgs";
  inputs."luhncheck-master".ref   = "master";
  inputs."luhncheck-master".repo  = "luhncheck";
  inputs."luhncheck-master".type  = "github";
  inputs."luhncheck-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."luhncheck-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}
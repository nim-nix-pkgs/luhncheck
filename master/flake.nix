{
  description = ''Implementation of Luhn algorithm in nim.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-luhncheck-master.flake = false;
  inputs.src-luhncheck-master.owner = "sillibird";
  inputs.src-luhncheck-master.ref   = "master";
  inputs.src-luhncheck-master.repo  = "luhncheck";
  inputs.src-luhncheck-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-luhncheck-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-luhncheck-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}
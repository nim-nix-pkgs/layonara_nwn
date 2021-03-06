{
  description = ''Various Layonara related functions for NWN Development'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."layonara_nwn-master".dir   = "master";
  inputs."layonara_nwn-master".owner = "nim-nix-pkgs";
  inputs."layonara_nwn-master".ref   = "master";
  inputs."layonara_nwn-master".repo  = "layonara_nwn";
  inputs."layonara_nwn-master".type  = "github";
  inputs."layonara_nwn-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."layonara_nwn-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
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
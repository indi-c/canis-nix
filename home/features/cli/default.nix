{pkgs, ...}: {

imports = [
./fish.nix
./fzf.nix
./neofetch.nix
];

programs.zoxide = {
	enable = true;
	enableFishIntegration = true;
};

programs.eza = {
	enable = true;
	enableFishIntegration = true;
	enableBashIntegration = true;
	extraOptions = ["-l" "--icons" "--git" "-a"];
};

programs.bat  = { enable = true; };

home.packages = with pkgs; [

	coreutils
	fd
	htop
	procs
	ripgrep
	tldr
	zip
];
}

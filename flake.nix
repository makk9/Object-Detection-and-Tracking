{
  description = "Object Detection and Tracking with Nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      # Development shell setup
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = [
          pkgs.python39                                  # Specify Python 3.9
          pkgs.python39Packages.numpy                    # Numerical computing
          pkgs.python39Packages.opencv4                  # Computer vision
          pkgs.python39Packages.scipy                    # Scientific computing
          pkgs.python39Packages.pillow                   # Image processing
          pkgs.python39Packages.tensorflow               # TensorFlow
          pkgs.python39Packages.keras                    # Deep learning
          pkgs.python39Packages.torch                    # PyTorch for deep learning
          pkgs.python39Packages.torchvision              # PyTorch vision library
          pkgs.python39Packages.scikit-learn             # Machine learning algorithms
          pkgs.python39Packages.matplotlib               # Data visualization
          pkgs.python39Packages.tensorboard              # TensorFlow logging
          pkgs.python39Packages.terminaltables           # Table formatting in terminal
          pkgs.python39Packages.tqdm                     # Progress bar for loops
          pkgs.python39Packages.python-dateutil          # Date utilities
          pkgs.python39Packages.pyparsing                # Text parsing
          pkgs.python39Packages.kiwisolver               # Dependency of matplotlib
          pkgs.python39Packages.cycler                   # Dependency of matplotlib
          pkgs.python39Packages.six                      # Compatibility library
          pkgs.python39Packages.pytz                     # Time zone utilities
        ];

        shellHook = ''
          echo "Development environment for Object Detection and Tracking Project with Python"
        '';
      };

      # Example package setup for testing
      packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    };
}

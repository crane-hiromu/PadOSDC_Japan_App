help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "    install                        to install all dependencies"
	@echo "    install_licence_plist          to install LicensePlist"
	@echo "    license                        to generate license plist file"
	@echo "    install_swiftgen               to install SwiftGen"
	@echo "    asset                          to generate Asset swift file"
	@echo "    git_rm                         to reset gitignore cache when updating file"

# Installation

install: install_licence_plist install_swiftgen

# LicensePlist

install_licence_plist:
	brew install mono0926/license-plist/license-plist

license:
	license-plist --output-path ./Resources/License

# SwiftGen

install_swiftgen:
	brew install swiftgen

asset:
	swiftgen

# Git
git_rm:
	git rm -r --cached .

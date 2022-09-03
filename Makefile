PRODUCT_NAME := PadOSDC
TOOLS_PACKAGE_PATH := Tools/${PRODUCT_NAME}Tools
TOOLS_PATH := ${TOOLS_PACKAGE_PATH}/.build/release

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
	$(MAKE) build-tool TOOL_NAME=license-plist

license:
	${TOOLS_PATH}/license-plist --output-path ./App/Resources/License

# SwiftGen

install_swiftgen:
	$(MAKE) build-tool TOOL_NAME=swiftgen

asset:
	${TOOLS_PATH}/swiftgen

# SwiftPM

build-tool:
	swift build -c release --package-path ${TOOLS_PACKAGE_PATH} --product ${TOOL_NAME}

# Git

git_rm:
	git rm -r --cached .

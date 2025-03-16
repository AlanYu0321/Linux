#!/usr/bin/bash


# Download package
wget https://github.com/jgm/pandoc/releases/download/3.1.3/pandoc-3.1.3-1-arm64.deb

# Install package
sudo dpkg -i pandoc-3.1.3-1-arm64.deb

# Update apt
sudo apt update

# Install dependencies
sudo apt install -y texlive texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended \
    texlive-fonts-extra texlive-xetex texlive-font-utils librsvg2-bin texlive-science-doc texlive-science


# Instructions to test development in different environments

## Ubuntu Example
Build the image:
`docker build -t ubuntu2204 .`

Run the image:
`docker run -it --rm -v ~/NeoVimConfig/auto_install.sh:/workspace/install.sh:z ubuntu2204 bash`

then inside: `bash ./install.sh`


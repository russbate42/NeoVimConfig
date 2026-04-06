# Instructions to test development in different environments

Build the image:
`docker build -t myproject-ubuntu docker/ubuntu/`

Run the image:
`docker run -it --rm -v /path/to/install.sh:/workspace/install.sh myproject-ubuntu bash`

then inside: `bash /workspace/install.sh`


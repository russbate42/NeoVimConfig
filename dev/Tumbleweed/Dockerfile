FROM opensuse/tumbleweed
RUN zypper refresh && zypper install -y git bash zsh
RUN zypper install -y -t pattern devel_basis devel_C_C++
# RUN zypper install -y build-essential clang libclang-dev patch cmake
ENV TZ=UTC
WORKDIR /workspace

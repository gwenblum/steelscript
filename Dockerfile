# Dockerfile
# version: 24.10.31

# Use Python iamge full version
FROM python:3.13
LABEL org.opencontainers.image.authors="Riverbed Community"
LABEL org.opencontainers.image.source="https://github.com/riverbed/steelscript"

# Install tools and deps for build
RUN set -ex && \
        tools=' \
                git \
        ' && \
        buildDeps=' \
                libpcap-dev \
        ' && \
        apt-get update && \ 
        apt-get upgrade -y && \ 
        apt-get install -y $tools $buildDeps --no-install-recommends && \
        rm -rf /var/lib/apt/lists/* 

# Install SteelScript and modules        
RUN set -ex && \           
        pip install --no-cache-dir --upgrade pip && \
        pip install --no-cache-dir --src /src \
            -e git+https://github.com/riverbed/steelscript#egg=steelscript \
            -e git+https://github.com/riverbed/steelscript-netprofiler#egg=steelscript-netprofiler \
            -e git+https://github.com/riverbed/steelscript-wireshark#egg=steelscript-wireshark \
            -e git+https://github.com/riverbed/steelscript-cmdline#egg=steelscript-cmdline \
            -e git+https://github.com/riverbed/steelscript-scc#egg=steelscript-scc \
            -e git+https://github.com/riverbed/steelscript-appresponse#egg=steelscript-appresponse \
            -e git+https://github.com/riverbed/steelscript-netim.git#egg=steelscript-netim \
            -e git+https://github.com/riverbed/steelscript-client-accelerator-controller#egg=steelscript-cacontroller \
            -e git+https://github.com/riverbed/steelscript-steelhead#egg=steelscript-steelhead \
            -e git+https://github.com/riverbed/steelscript-packets.git@master#egg=steelscript-packets

# Cleanup, purging build deps
RUN set -ex && \
        distroExtra=' \
                python3.11 \
                gcc \
        ' && \                
        apt-get remove -y --purge --autoremove $buildDeps $distroExtra && \
        apt-get clean && \
        rm -rf ~/.cache

# Create a non-root user and group
ARG USERNAME=steelscript
ARG GROUPNAME=$USERNAME
ARG USER_ID=1000
ARG GROUP_ID=$USER_ID
RUN groupadd --gid $GROUP_ID $GROUPNAME && useradd --create-home --gid $GROUP_ID --uid $USER_ID $USERNAME

# Create SteelScript workspace
RUN set -ex && steel mkworkspace -d /home/steelscript/workspace
WORKDIR /root/steelscript/workspace

# Configure container startup
CMD ["/bin/bash"]

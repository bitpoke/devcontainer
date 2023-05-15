FROM gitpod/workspace-base:latest

LABEL org.opencontainers.image.source="https://github.com/bitpoke/devcontainer"

COPY library-scripts /usr/local/share/library-scripts

# install bitpoke aliases
RUN set -eux; \
    { \
        echo "# load aliases for running commands inside docker compose containers"; \
            echo "source /usr/local/share/library-scripts/aliases"; \
            echo ""; \
    } | sudo tee -a /etc/bash.bashrc

# allow gitpod user to access docker
RUN sudo usermod -aG docker gitpod

RUN sudo /usr/local/share/library-scripts/install-google-cloud-sdk.sh --additional-components beta kubectl gke-gcloud-auth-plugin

ENTRYPOINT ["/usr/local/share/library-scripts/entrypoint.sh"]
CMD ["sleep", "infinity"]

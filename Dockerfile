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

# install Percona client tools
RUN sudo /usr/local/share/library-scripts/install-percona-client.sh

# configure MySQL client
RUN set -eux; \
    { \
        echo "[client]"; \
        echo "host=127.0.0.1"; \
        echo "user=root"; \
        echo "password=not-so-secure"; \
        echo ""; \
    } | tee -a ~/.my.cnf

# install Google Cloud SDK
RUN sudo /usr/local/share/library-scripts/install-google-cloud-sdk.sh --additional-components beta kubectl gke-gcloud-auth-plugin

ENTRYPOINT ["/usr/local/share/library-scripts/entrypoint.sh"]
CMD ["sleep", "infinity"]

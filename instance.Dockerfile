ARG BASE_IMAGE_VERSION
ARG REPO_NAME
FROM europe-docker.pkg.dev/superb-blend-305320/lex-public-registry/django_process_admin:${BASE_IMAGE_VERSION}
ARG REPO_NAME
WORKDIR /app/DjangoProcessAdminGeneric
COPY . /app/DjangoProcessAdminGeneric/generic_app/submodels/${REPO_NAME}
RUN if [ -f /app/DjangoProcessAdminGeneric/generic_app/submodels/${REPO_NAME}/requirements.txt ]; then \
    pip install -r /app/DjangoProcessAdminGeneric/generic_app/submodels/${REPO_NAME}/requirements.txt; \
    fi

RUN touch extra_startup_cmds.sh && \
    chmod +x extra_startup_cmds.sh && \
    ./extra_startup_cmds.sh

RUN chmod +x /app/DjangoProcessAdminGeneric/build/start_worker_new.sh  && \
    chmod +x /app/DjangoProcessAdminGeneric/build/container_startup_new.sh

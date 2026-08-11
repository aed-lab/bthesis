FROM paperist/texlive-ja:latest

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

# ------------------------------------------------------------
# Development tools + Locale
# ------------------------------------------------------------
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        sudo \
        openssh-client \
        ca-certificates \
        locales \
    && printf 'en_US.UTF-8 UTF-8\nja_JP.UTF-8 UTF-8\n' > /etc/locale.gen \
    && locale-gen \
    && rm -rf /var/lib/apt/lists/*

# デフォルトの locale
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en

# ------------------------------------------------------------
# TeX Live packages
#
# IPSJ / DiGRA を含む一般的な学術論文執筆用。
# 旧 texlive-sci-ja とほぼ同等の範囲を用意する。
# ------------------------------------------------------------
#RUN tlmgr install \
#        collection-basic \
#        collection-fontsrecommended \
#        collection-langcjk \
#        collection-langjapanese \
#        collection-latex \
#        collection-latexrecommended \
#        collection-latexextra \
#        collection-mathscience \
#        collection-pictures

# ------------------------------------------------------------
# Dev Container user
# ------------------------------------------------------------
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd \
        --uid ${USER_UID} \
        --gid ${USER_GID} \
        --create-home \
        --shell /bin/bash \
        ${USERNAME} \
    && echo "${USERNAME} ALL=(root) NOPASSWD:ALL" \
        > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

USER ${USERNAME}

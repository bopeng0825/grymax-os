FROM ghcr.io/liuyangos/basegrymax:latest

#COPY system_files/kernel /tmp
COPY system_files/desktop/shared  /
RUN chmod +x /usr/libexec/bazzite-autologin &&\
    chmod +x /usr/share/wayland-sessions/grymax.desktop

RUN mkdir -p /var/lib/alternatives && \
    # rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:liuyangos:grymaxos steamdeck-kde-presets && \
    rpm-ostree install mpv && \
    useradd -m -G wheel grymax && \
    echo 'grymax:grymax' | chpasswd && \
    echo 'grymax ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/grymax && \
    chmod 0440 /etc/sudoers.d/grymax && \
    ostree container commit

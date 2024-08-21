FROM kripeshalt/ubuntu-novnc-20.04

EXPOSE 80

ENV RESOLUTION 1366x768


CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

FROM kripeshalt/ubuntu-novnc-20.04

EXPOSE 80

ENV RESOLUTION 1366 x 768


CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

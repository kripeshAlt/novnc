# Use the base image with Ubuntu 20.04
FROM ubuntu:20.04

# Set environment variables
ENV VNC_PASSWD=password \
    PORT=10000 \
    AUDIO_PORT=1699 \
    WEBSOCKIFY_PORT=6900 \
    VNC_PORT=5900 \
    SCREEN_WIDTH=1024 \
    SCREEN_HEIGHT=768 \
    SCREEN_DEPTH=24

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    wget \
    x11vnc \
    xvfb \
    pulseaudio \
    websockify \
    noVNC \
    && apt-get clean

# Configure PulseAudio
RUN echo "load-module module-native-protocol-unix auth-anonymous=1" >> /etc/pulse/default.pa

# Create directories for noVNC and VNC
RUN mkdir -p /root/.vnc /root/.noVNC

# Set up noVNC
RUN ln -s /usr/share/novnc /root/.noVNC

# Set up VNC password
RUN mkdir -p /root/.vnc && \
    x11vnc -storepasswd $VNC_PASSWD /root/.vnc/passwd

# Expose ports
EXPOSE 8080 1699 6900 5900

# Start the services
CMD ["/bin/bash", "-c", " \
    pulseaudio -D --exit-idle-time=-1 && \
    websockify --web=/root/.noVNC $WEBSOCKIFY_PORT localhost:$VNC_PORT & \
    x11vnc -display :0 -forever -usepw -create -rfbport $VNC_PORT -shared && \
    xvfb-run -a -s \"-screen 0 $SCREEN_WIDTH"x"$SCREEN_HEIGHT"x$SCREEN_DEPTH\" xterm"]

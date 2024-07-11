# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN apt-get update && \
    apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xorg \
    dbus-x11 \
    x11-xserver-utils \
    wget \
    supervisor \
    curl \
    && apt-get clean

# Download and install TurboVNC
RUN wget https://sourceforge.net/projects/turbovnc/files/3.0.1/turbovnc_3.0.1_amd64.deb && \
    dpkg -i turbovnc_3.0.1_amd64.deb && \
    rm turbovnc_3.0.1_amd64.deb
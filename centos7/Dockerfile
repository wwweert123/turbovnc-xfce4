# Use an official CentOS 7 image as the base
FROM centos:centos7.9.2009

# Add the CentOS vault repository configuration
RUN echo -e '[base]\n\
name=CentOS-$releasever - Base\n\
baseurl=http://vault.centos.org/7.9.2009/os/$basearch/\n\
gpgcheck=1\n\
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\n\
\n\
[updates]\n\
name=CentOS-$releasever - Updates\n\
baseurl=http://vault.centos.org/7.9.2009/updates/$basearch/\n\
gpgcheck=1\n\
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\n\
\n\
[extras]\n\
name=CentOS-$releasever - Extras\n\
baseurl=http://vault.centos.org/7.9.2009/extras/$basearch/\n\
gpgcheck=1\n\
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7\n\
\n\
[centosplus]\n\
name=CentOS-$releasever - Plus\n\
baseurl=http://vault.centos.org/7.9.2009/centosplus/$basearch/\n\
gpgcheck=1\n\
enabled=0\n\
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7' > /etc/yum.repos.d/CentOS-Base.repo

# Install EPEL repository for additional packages
RUN yum install -y epel-release && \
    yum update -y

# Install necessary packages
RUN yum groupinstall -y "Xfce" && \
    yum install -y wget supervisor xorg-x11-xinit xauth xorg-x11-server-Xvfb xorg-x11-fonts-Type1 xorg-x11-xkb-utils xorg-x11-server-utils

# Install perl and expect
RUN yum install -y perl expect

# Install environment-modules
RUN yum install -y environment-modules

# Download and install TurboVNC
RUN wget https://sourceforge.net/projects/turbovnc/files/3.0.1/turbovnc-3.0.1.x86_64.rpm && \
    yum install -y turbovnc-3.0.1.x86_64.rpm && \
    rm turbovnc-3.0.1.x86_64.rpm

# Add TurboVNC binaries to PATH
ENV PATH="/opt/TurboVNC/bin:$PATH"

# Expose the VNC port
EXPOSE 5901

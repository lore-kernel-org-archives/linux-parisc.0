From: Helge Deller <deller@gmx.de>
Subject: Pre-DEBIAN 8.0 install images for HPPA architecture  (debian-ports
 unstable release)
Date: Tue, 24 Feb 2015 18:13:52 +0100
Message-ID: <54ECB150.80907@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
To: HPPA porters <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello everyone,

I've prepared some initial netboot installation medias for
	DEBIAN 8.0 on HPPA

which are available at:
	http://ftp.debian-ports.org/debian-cd/hppa/debian-8.0/

You can find the instructions on how to install Debian 8.0 on hppa in our wiki at
	https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation

The install images will install binaries from debian-ports (Debian "unstable").

Major changes include:
- Based on Debian 8.0 code base
- Full systemd support
- Linux kernel modules for SATA included
- Lots of bug fixes
- Should support all common PA-RISC hardware (on C8000 installation needs to be done via serial port)

I'm happy to get your feedback (either as bug report or successful installation report).

Helge

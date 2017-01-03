From: Helge Deller <deller@gmx.de>
Subject: Re: New installation media
Date: Tue, 3 Jan 2017 11:44:05 +0100
Message-ID: <4a7124aa-cac8-22da-7712-9a8a3fd8e6f0@gmx.de>
References: <39af2e8ac53993b42705f10216806a0b@purple-cat.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: debian-hppa@lists.debian.org,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: mike@purple-cat.net
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <39af2e8ac53993b42705f10216806a0b@purple-cat.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Forwarding to parisc kernel devel list...

On 03.01.2017 11:07, mike@purple-cat.net wrote:
> Hello debian-hppa list members,
> 
> There is new instalation media available at http://prometheus.parisc-linux.org/debian-cd/debian-9.0/debian-9.0r1/
> 
> This allows instalation of the latest unstable/sid release of Debian GNU/Linux for the HP PARISC (hppa) architecture.
> 
> An installation guide will be updated on
> 
> https://parisc.wiki.kernel.org/index.php/Debian_Ports_Installation
> 
> *Installation instructions*
> 
>   * Instructions to burn the ISO image on a Mac: https://discussions.apple.com/thread/5132196
>   * *IMPORTANT: * If your machine has a DVD-drive, you should better burn the image to a DVD disc. The first-generation DVD-drives in some older PA-RISC machines may have problems booting from e.g. a CD-RW so you may get this error message: /IPL error: bad LIF magic./
>   * Those images should work on all machines, with 32- and 64bit kernels. Installation of a C8000 workstation needs to happen via serial console since the install image will not activate the ATI graphics card. After installation the ATI cards will work in non-accelerated mode though.
>   * If your machine is behind a firewall, enter the proxy at the IPL command line the Linux kernel command line (change parameter 7)
>   * Choose the automatic disc partitioning, unless you know all details about disc partitions for PA-RISC (e.g. PALO bootloader needs ext2).
>   * The palo bootloader needs to reside on a SCSI disc. The installer will detect SATA discs and will not complain if you install to a SATA disc!
>   * After reboot add this line to /etc/apt/sources.list and run *apt-get update*:
>   *
> 
>       deb http://ftp.ports.debian.org/debian-ports unstable main
> 
> 
>     Technical background of the install images
> 
>     The installer images: debian-9.0r1-hppa-CD-1.iso and debian-9.0r1-hppa-NETINST-1.iso pull the debian packages from the repositories at http://prometheus.parisc-linux.org/debian-hppa-install/
>     which contains a full archive of the Debian Ports (hppa) 3/01/16
>     This is realized by the /preseed/url=http://prometheus.parisc-linux.org/debian-hppa-install/preseed.9.0r1nb.cfg/ Linux kernel parameter which is hardcoded in the palo bootloader code in those images and require an internet conection to install.
> 
>  
> 
> Please send an installation report, any errors and any feed back to the list debian-hppa@lists.debian.org <mailto:debian-hppa@lists.debian.org>
> 
> Mike Hosken
> mike@purple-cat.net


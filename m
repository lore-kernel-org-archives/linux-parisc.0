Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id DAA20783
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Feb 2000 03:28:18 -0700
Message-ID: <00c401bf7ea9$a7216660$0a14d793@esiee.fr>
From: "Thierry SIMONNET" <t.simonnet@esiee.fr>
To: <parisc-linux@puffin.external.hp.com>, "Martin K. Petersen" <mkp@mkp.net>
References: <yq1itzr9zwt.fsf@leyland.socsci.auc.dk>
Subject: Re: [parisc-linux] nfsroot howto
Date: Thu, 24 Feb 2000 10:29:30 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

I have a 712/60 Workstation as NFS server and a 712/80 as parisc-linux box.
I  have some trouble with nfsroot :bootp and tftp process works but
IP-Config says : IP-Config : No Network device available.

Thanks for your help

Th. SIMONNET

----- Original Message -----
From: Martin K. Petersen <mkp@mkp.net>
To: <parisc-linux@puffin.external.hp.com>
Sent: Monday, February 14, 2000 11:34 PM
Subject: [parisc-linux] nfsroot howto


>
> LINUX/PA-RISC NFSROOT HOWTO
>
> (Or how to get to a working shell prompt)
>
>
> YOU NEED:
>
> A fresh linux-2.3 checkout from CVS
>
> The .config included below
>
> puffin.external.hp.com/pub/parisc/binaries/nfsroot/nfsroot-20000214.tar.gz
>
> A supported PA-RISC box with serial console
>
> A Linux (any Unix will do) server with NFS server, bootpd and tftpd
>
>
> Note on consoles:
>
> Yes, you *will* need serial console on the PA-RISC box.  IODC console
> was a quick hack to get output during development, but it will never
> be usable as an interactive console.  When HP releases docs for STI we
> will implement a proper framebuffer console.  Until then, serial is
> the only option.  Sorry.
>
> Futhermore this will only work on boxes with LASI.  I'm still working
> on support for the NS87560UBD Super I/O chip on [BCJ]x000 boxes.
>
>
> STEP 1. KERNEL BUILDING
>
> Get the latest linux-2.3 tree from CVS.
>
>
> a) If you use the standard boot loader
>
> Edit DEFAULT_COMMANDLINE in linux-2.3/arch/parisc/boot/boot_code/ipl_c.c
> to read:
>
> "vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=10.0.0.1"
>
>
> b) If you use PALO
>
> Edit the echo line in palo/mklifimage to read
>
> "vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=10.0.0.1"
>
>
> In both cases replace 10.0.0.1 with the IP address of your NFS server.
>
>
> Copy the .config included below to the root of the linux source tree.
>
> make oldconfig
> make dep
> make clean
> make Image (Or make palo, if you use Paul's loader)
>
> Due to linker issues cross compiling is still not possible.  I.e. you
> have to build on HP/UX.
>
>
> STEP 2. BOOTP, TFTP AND NFS
>
> Copy linux-2.3/arch/parisc/boot/Image (or palo/lifimage) to
> /tftpboot/vmlinux on the server.  Make sure the file is world
> readable.
>
> Edit /etc/bootptab on the server.  I have an entry like this:
>
> mybox:\
>         :hd=/tftpboot:\
>         :bf=vmlinux:\
>         :ht=ether:\
>         :ha=0060b007e4ab:\
>         :sm=255.255.255.0:\
>         :hn:\
>         :ip=10.0.0.6:\
>         :vm=rfc1048:
>
> Replace ``mybox'' with the hostname of your PA-RISC box.
>
> You need to insert the MAC address of the PA-RISC box in the ha=
> field.  You can find the MAC by typing "in la" at the PDC prompt.
>
> You should also change the IP to something appropriate for your LAN.
>
> Add an entry for the host in /etc/hosts.
>
> Unpack the nfsroot tarball in /tftpboot and rename the unpacked
> directory (mybox) to the hostname of your box.
>
> Make sure both bootps and tftp are enabled in /etc/inetd.conf.
>
> Edit your /etc/exports to contain a line like this:
>
> /tftpboot/mybox mybox(rw,no_root_squash)
>
> Again, replace mybox with your hostname.
>
> Restart inetd and nfs services if you made any modifications.
>
>
> STEP 3. GO
>
> Type "bo lan" at the PDC prompt on the PA-box and kapow.  You've got a
> prompt (I hope).
>
> Here's what I get...
>
> ---8<---
>
> Stand-alone shell (version 3.4)
> 500 5 1970 53b
> > -mount -t proc proc /proc
> quux
> quuux
> > -more /proc/cpuinfo
> quux
> quuux
> << cpuinfo >>
> processor       : 0
> cpu family      : PA-RISC <NULL>
> cpu             : PA8000
> cpu MHz         : 160.000000
> cpu category    : category A
> cpu level       : level 0
> cpu shadow regs : no
> model           :
> model name      : Raven U 160 (9000/780/C160)
> sw_id           : 0
> hversion        : 0x00000000
> sversion        : 0x00000000
> I-cache         : 0 KB
> D-cache         : 0 KB (WB)
> ITLB entries    : 0
> DTLB entries    : 0
> BTLB            : not supported
> ---8<---
>
>


----------------------------------------------------------------------------
----


>
> --
> Martin Kasper Petersen BOFH, IC1&2, Aalborg University, DK
> mailto:mkp@SunSITE.auc.dk http://SunSITE.auc.dk/~mkp/
>

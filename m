Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA01263
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 15:30:14 -0700
Date: Thu, 30 Nov 2000 20:32:29 -0200 (BRST)
From: "Jorge L. deLyra" <delyra@latt.if.usp.br>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com, assirati@socrates.if.usp.br
Subject: Re: [parisc-linux] HP 9000/735-125 
In-Reply-To: <200011302104.NAA29773@milano.cup.hp.com>
Message-ID: <Pine.LNX.3.96.1001130202814.25437A-100000@latt.if.usp.br>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

> > Yes, we are working towards this, but I read in the docs that for the time
> > being you can only cros-compile the kernel on HP-UX,
> 
> That's definitely wrong. Where did you read this?
> (I would like fix the reference)

It is on the nfsroot howto linked from the home page of the project:

http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/02-Feb/0069.html

<quote>
STEP 1. KERNEL BUILDING

Get the latest linux-2.3 tree from CVS.

a) If you use the standard boot loader

Edit DEFAULT_COMMANDLINE in linux-2.3årch/parisc/boot/boot_code/ipl_c.c
to read:

        "vmlinux HOME=/TERM=LINUX root=/dev/nfs nfsroot=10.0.0.1"

b) If you use PALO

Edit the echo line in palo/mklifimage to read

        "vmlinux HOME=/TERM=LINUX root=/dev/nfs nfsroot=10.0.0.1"

In both cases replace 10.0.0.1 with the IP address of your NFS server.

Copy the .config included below to the root of the linux source tree.

make oldconfig
make dep
make clean
make Image (Or make palo, if you use Paul's loader)
Due to linker issues cross compiling is still not possible. I.e. you
have to build on HP/UX. 
</quote>

I suppose this is old...

> Those of us still cross compiling are using x86-linux hosts.

Wonderful, that makes it a lot easier...		Thanks,

----------------------------------------------------------------
        Jorge L. deLyra,  Associate Professor of Physics
            The University of Sao Paulo,  IFUSP-DFMA
       For more information: finger delyra@latt.if.usp.br
----------------------------------------------------------------

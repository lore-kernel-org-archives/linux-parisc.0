Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA02546
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 15:54:48 -0700
To: "Jorge L. deLyra" <delyra@latt.if.usp.br>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com,
        assirati@socrates.if.usp.br
Subject: Re: [parisc-linux] HP 9000/735-125 
In-Reply-To: Your message of "Thu, 30 Nov 2000 20:32:29 -0200."
             <Pine.LNX.3.96.1001130202814.25437A-100000@latt.if.usp.br>
References: <Pine.LNX.3.96.1001130202814.25437A-100000@latt.if.usp.br> 
Date: Thu, 30 Nov 2000 15:57:14 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E141cde-0008Fu-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= a) If you use the standard boot loader
= 
= Edit DEFAULT_COMMANDLINE in linux-2.3årch/parisc/boot/boot_code/ipl_c.c
= to read:
= 
=         "vmlinux HOME=/TERM=LINUX root=/dev/nfs nfsroot=10.0.0.1"

The boot_code directory should be gone -- that stuff is obsolete.

= b) If you use PALO

PALO is the only current bootloader 

= Edit the echo line in palo/mklifimage to read
= 
=         "vmlinux HOME=/TERM=LINUX root=/dev/nfs nfsroot=10.0.0.1"
= 
= In both cases replace 10.0.0.1 with the IP address of your NFS server.
= 
= Copy the .config included below to the root of the linux source tree.

make oldconfig or make config, without a .config to start with, works
fine just as it does with x86

= make oldconfig
= make dep
= make clean
= make Image (Or make palo, if you use Paul's loader)
Must be 'make palo'
= Due to linker issues cross compiling is still not possible. I.e. you
= have to build on HP/UX. 
= </quote>
= 
= I suppose this is old...
= 
= > Those of us still cross compiling are using x86-linux hosts.
= 
= Wonderful, that makes it a lot easier...		Thanks,
= 
= ----------------------------------------------------------------
=         Jorge L. deLyra,  Associate Professor of Physics
=             The University of Sao Paulo,  IFUSP-DFMA
=        For more information: finger delyra@latt.if.usp.br
= ----------------------------------------------------------------
= 
= ---------------------------------------------------------------------------
= To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
= `unsubscribe' as the subject.
= 
= 
= 

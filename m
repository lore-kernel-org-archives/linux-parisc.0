Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA14827
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Mar 2000 15:10:39 -0700
Received: from localhost (funnyguy@localhost)
	by morph.net (8.9.3/8.9.3) with ESMTP id RAA18840
	for <parisc-linux@thepuffingroup.com>; Mon, 27 Mar 2000 17:07:03 -0500
Date: Mon, 27 Mar 2000 17:07:03 -0500 (EST)
From: Mike Brancato <funnyguy@digitalsmackdown.net>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] build errors, recipe still not up to date?
In-Reply-To: <Pine.LNX.4.10.10003271628390.18589-100000@morph.net>
Message-ID: <Pine.LNX.4.10.10003271704100.18835-100000@morph.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

ok, I guess I forgot to ask my real question, how would I create the
ramdisk image?

also, say I want nfs, I have two hpux 11.0 machines I could mount from.
machine A has a raid array (/users/) attached to it, and machine B mounts
that same array in /users/ via nfs.  can i have the root for the parisc
linux in /opt/linuxroot/ or something, and have the parisc machine mount
that thru nfs?  i'm new to nfs.

mike


On Mon, 27 Mar 2000, Mike Brancato wrote:

> 
> I've been folowing the recipe step by step, yet i still get build
> problems.  i'm working witht he march 26th 2.3.42 version, and everything
> in the kernel is building fine, except the link at the end.
> 
> anyone know?  did i not get something?
> 
> mike
> 
> make[2]: Entering directory `/tmp/mabran3/palo/ipl'
> echo "char *bld_info = \"`whoami`@`hostname` `date`\";" > build.c
> hppa1.1-linux-gcc -I/tmp/mabran3/palo/../linux-2.3/include -I../lib -O2
> -fwritable-strings -mdisable-fpregs -Wall -c -o build.o build.c
> rm -f build.c
> hppa1.1-linux-ld -N -Ttext 0x500000 -e '$START$' -o ipl crt0.o byteio.o
> elf64.o        ipl.o         offset.o      som.o diskpart.o    ext2.o
> lib.o         pdc_bootio.o  vsprintf.o elf32.o            fileio.o
> load.o        pdc_cons.o build.o
> /tmp/mabran3/palo/../linux-2.3/arch/parisc/lib/milli.o
> rm -f build.o
> make[2]: Leaving directory `/tmp/mabran3/palo/ipl'
> ./palo/palo -s -b ipl/ipl -k /tmp/mabran3/palo/../linux-2.3/vmlinux -r
> /tmp/mabran3/palo/../linux-2.3/ramdisk.bin \
> -c "0/vmlinux HOME=/ TERM=LINUX root=/dev/ram initrd=0/ramdisk" lifimage
> palo version 0.8 mabran3@alpha Mon Mar 27 16:30:10 EST 2000
> /tmp/mabran3/palo/../linux-2.3/ramdisk.bin: No such file or directory
> make[1]: *** [lifimage-only] Error 2
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 

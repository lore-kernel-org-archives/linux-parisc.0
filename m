Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA04594
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Dec 2000 15:37:13 -0700
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id eBHMdmK14915
	for <parisc-linux@thepuffingroup.com>; Sun, 17 Dec 2000 23:39:54 +0100
Date: Sun, 17 Dec 2000 23:39:47 +0100 (CET)
From: "M. Grabert" <xam@deathsdoor.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0012172113360.11612-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] (still) booting problems with HP9000/730
List-ID: <linux-parisc.vger.kernel.org>


Hello there,

i'm glad to see that Linux/HPPA makes such great efforts.
But unfortunately I've still problems in booting Linux/HPPA
on my 'king cobra'. :(((((

Today I got the latest nfsroot, xc (binaries) and compiled
the linux-kernel from CVS.
i just unpacked the nfsroot to the hd and changed /etc/fstab
accordingly. kernel build just works fine :))))

I just have one scsi-device on in my HP (scsi id 6, 1GB),
which has 3 partitions (like in the palo-readme).
the workstation has 32MB ram, a builtin network card,
and a crx color display (8bit 1280x1024, 19" A1097C screen).
nothing special, just an ordinary hp9000/730.
i don't use bootp/dhcp.

The kernel starts booting, but the scsi driver (old Ncr)
reports some warnings/errors like
shared memory is not coherent (or so), failed to reset scsi bus,
irq probe failed etc...

the scsi driver finally recognizes my Quantum HD and
tries to boot from it (mount it)..
There is nothing like VFS: unable to mount blabla;
instead it runs in to an infinite loop of kernel oops,
it prints continously kernel stack/register traces 
(seem to look all the same).

unfortunatly i can't write them down (since i cannot
interrupt the debug output or i don 't know how to)

the boot partition is /dev/sda3, and i use sti as console
the latter one seems not to work properly, as not all letters /lines
are printed on the screen, at least after the scsi HD is recognized
and the kernel tries to mount the root partition; e.g. i
can see something like this:

"Moun     partit  .."  or 
"VF  :un   to"         or 
"bootp    ..... .."

so at least i can guess what the output means

I've read that some guy here has successfully
booted linux/HPPA on an 730 before (about 2 months ago),
but i always fail. any hints what i'm don' wrong ?

thanks in advance,
greetings max

PS: keep on the good work!

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA16090
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 19:40:07 -0600
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199910220139.SAA29964@bart.allegro.com>
Subject: Re: [parisc-linux] boot loader
To: bame@debian.fc.hp.com (Paul Bame)
Date: Thu, 21 Oct 1999 18:39:36 -0700 (PDT)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199910220055.SAA20611@debian.fc.hp.com> from "Paul Bame" at Oct 21, 99 06:55:38 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi,

> My proposal is to have a LIF volume on the beginning of any disk
> from which one might boot.  Make that LIF volume at least 2Mb, and
> maybe 10Mb if you want to store several kernels and ramdisk images.
> Here are the files it would hold:
> 
> 	IPL		Pretty much the boot loader we're using today
> 			with some LIF intelligence added
> 	vmlinuz		The kernel image, put there with the 'lifcp'
> 			command.  Could have several kernels
> 			on the LIF volume and boot any of them.
> 	cmdline		The default, or the last?, command line used
> 			to boot Linux.  Could possibly have several
> 			different command lines in one or several files
> 			but the UI for this needs thought.
> 	ramdisk		One or more files containing ramdisk images
> 	ptable		Partition table -- see below

As long as you don't want to use LIF utilities to access those files,
lowercase should be okay.

The LIF tools won't accept lowercase filenames.
Why care?  Because you could possibly boot HP-UX and use the LIF tools 
to manipulate the vmlinuz file, for example.

Example:  

   Oz(su) /: lifcp test /dev/dsk/c0t0d0:vmlinuz
   lifcp: Cannot create vmlinuz   ; improperly formatted LIF name
   Oz(su) /:

(BTW, the lifcp "-t" option won't help)

I'd suggest using uppercase, and making the IPL smart enough
to allow user-entry of lowercase (which gets mapped to uppercase)

> After building a new kernel, you'd have to
> 'lifcp <the-kernel-image> /dev/sda:vmlinuz' instead of
> doing 'mkImage' like we do today.  It's also cool that the ramdisk
> isn't linked into the kernel.

Note: my lifcp test was on 10.20
 
> lifinit and lifcp should already be able to handle the LIF stuff, so
> no new C code required to build the LIF volumes.  We can probably
> talk HP into open sourcing the LIF commands, and if not can grab
> the ones from OpenBSD.  For now we can use the ones on HP-UX.
> [I suspect the HP ones are not byte-order safe (yet).]

If that happens, we could support lowercase.
 
> 			    The Name
> 
> BTW the current contender for the name, instead of hilo, is palo
> for PArisc LOader.  It is also a reminder of of Palo Alto
> which is where HP began.

Great name!
 
-- 
Stan Sieler                                          sieler@allegro.com
                                         http://www.allegro.com/sieler/

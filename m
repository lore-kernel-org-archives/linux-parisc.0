Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA25635
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 13:08:50 -0600
Sender: adevries@feather.thepuffingroup.com
Message-ID: <376A9AF9.5F3DB326@thepuffingroup.com>
Date: Fri, 18 Jun 1999 15:16:09 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] A quick update
References: <199906181504.LAA07298@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John David Anglin wrote:
> 
> 
> After linking, the executable files for the kernel and ipl each have
> a header that describe what kind object file they are.  The header also has
> info about the sections in the executable.  Ideally, the program that
> builds the LIF image would look at the headers in the ipl and kernel
> and build the LIF image.  However, you can probably get away with
> using a simple program to copy the ipl and kernel files.

That all exists in the tools in linux/arch/parisc/hp/boot/boot_tools. 

> 
> You must watch out for the size of the header on each file (file
> offset).  The linker script for the ELF format kernel set the origin
> for .text to 0x8000.  The corresponding option for the HP linker
> would be "-N -R 8000".  When I do this, the file offset to the
> start of the $TEXT$ section (the first section in the file) is
> 0x28000.  Thus, you want to copy starting from 0x28000 in vmlinux
> to 0x8000 in the LIF image.

Oh, okay.  The linker stuff has all been sorted out (and is in CVS now).

So, here's how you can boot this bootloader:
- on HPUX, install gnu gcc and binutils
- check out the latest kernel tree
- do a 'make config ; make dep ; make vmlinux; make Image'
- boot linux/arch/parisc/hp/boot/Image

It should boot and end with:


Loading kernel...done.
Transferring control to the kernel. (At entry point 0x00008000)

and then hang completely.

The next step is to develop a small mini kernel that we can use to test
the launching. It should just print "Hello world" to the screen using
IODC.  There's lots of example code in the bootloader, so this should be
pretty simple.

- Alex "white water rafting this weekend, far away from PA RISC
equipment" deVries
-- 
Alex deVries
Vice President of Engineering
The Puffin Group

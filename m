Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA24422
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 09:04:42 -0600
Message-Id: <199906181504.LAA07298@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] A quick update
To: adevries@thepuffingroup.com (Alex deVries)
Date: Fri, 18 Jun 1999 11:04:39 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <376A51F5.D38ECFFC@thepuffingroup.com> from "Alex deVries" at Jun 18, 99 10:04:37 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> 
> John David Anglin wrote:
> > You probably want to use the same link options as Jason used for the IPL:
> > -N -R address.
> 
> Ah, okay.
> 
> > After the kernel is built, take a look at where the sections start
> > in SOM executable.  Each section must be copied to its corresponding
> > starting address in the LIF image.  Space must be reserved for the bss
> > data if there is a section after it that contains necessary data.
> 
> Should I be using objcopy to cut these sections out of my SOM executable
> and into the LIF image?

I don't think so.  While I haven't checked all the options of objcopy,
its basic function is to copy object modules from one file to another.
If it understood the LIF format, it might work but I don't think it
does.  If I understand the situation,  the LIF image gets loaded directly
into memory.  Thus, the code that builds the LIF image must simulate
a loader, putting each section into it appropriate location in the image.
You must assure when the kernel and ipl are linked that the relocation
address of each section agrees with where it is placed in the LIF image
so that all symbols are appropriately relocated.  IPL doesn't do
anything fancy.  It looks like it just loads the kernel after itself
into memory.

After linking, the executable files for the kernel and ipl each have
a header that describe what kind object file they are.  The header also has
info about the sections in the executable.  Ideally, the program that
builds the LIF image would look at the headers in the ipl and kernel
and build the LIF image.  However, you can probably get away with
using a simple program to copy the ipl and kernel files.

You must watch out for the size of the header on each file (file
offset).  The linker script for the ELF format kernel set the origin
for .text to 0x8000.  The corresponding option for the HP linker
would be "-N -R 8000".  When I do this, the file offset to the
start of the $TEXT$ section (the first section in the file) is
0x28000.  Thus, you want to copy starting from 0x28000 in vmlinux
to 0x8000 in the LIF image.

The $BSS$ section is not in the executables since it loads as all
zeros.  However, since it is the last section in the executables
you simply have to ensure that there is enough space between the
kernel and ipl.  You need enough space for the ipl bss data and
its dynamically allocated stack.

> Two other problems I have:
> 
> 1. The kernel doesn't build yet, it fails to link and dies with:
> 
> 
> ld -e stext arch/parisc/kernel/head.o arch/parisc/kernel/init_task.o
> init/main.o init/version.o \
>         arch/parisc/kernel/kernel.o arch/parisc/mm/mm.o kernel/kernel.o
> mm/mm.o fs/fs.o ipc/ipc.o \
>         fs/filesystems.a \
>         net/network.a \
>         drivers/block/block.a drivers/char/char.a  drivers/net/net.a \
>         /usr/src/linux/arch/parisc/lib/lib.a /usr/src/linux/lib/lib.a
> /usr/src/linux/arch/parisc/lib/lib.a \
>         -o vmlinux
> ld: Unsatisfied symbols:
>    swapper_pg_dir (data)
>    _stext (data)

You want to export swapper_pg_dir in head.S.  I think in init/main.c,
you should change the declaration for _stext to "extern void _stext ();"
and "&_stext" to "_stext".  The linker thinks _stext is a reference
to data rather than text.  The other option would be to put the address
label _stext into a an exported word in the data section of head.S.  
Main.c could then determine the start of text from this location.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

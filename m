Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA19892
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Jun 1999 12:14:07 -0600
Message-Id: <199906151810.OAA18325@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Compiling Linux Kernel on HP-UX
To: kirkb@chrome.rose.hp.com (Kirk Bresniker)
Date: Tue, 15 Jun 1999 14:10:50 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Ulrich.Strelow@Schering.DE, parisc-linux@thepuffingroup.com
In-Reply-To: <199906151532.IAA22453@chrome.rose.hp.com> from "Kirk Bresniker" at Jun 15, 99 08:32:41 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> |
> | Hi,
> |
> | I'm trying to compile the latest CVS-snapshot (19990615) on my HP 715/33
> | using gcc 2.7.2.2 and binutils 2.7. Compiling kernel/sched.c gives the
> | following error:
> |
> | sched.c:579: section attributes are not supported for this target
> |
> gcc 2.8.1 isn't quite enough. Although it does support section
> attributes, there is a bug in the code emitted that cannot be assembled
> with gas 2.9.1. I sucessfully worked around it by changing the condition
> from a fatal error to a warning in gas.
> 
> Here is the text of the bug I submitted to gcc:

I haven't tried your sample but I don't have the the section problem
with gcc-2.95 (prerelease) and binutils-2.9.4 (pre).  I do have a
link problem:

ld -N -e _stext arch/parisc/kernel/head.o arch/parisc/kernel/init_task.o init/ma
in.o init/version.o \
	arch/parisc/kernel/kernel.o arch/parisc/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
	fs/filesystems.a \
	net/network.a \
	drivers/block/block.a drivers/char/char.a  drivers/net/net.a \
	/ehic/a/pa/linux/arch/parisc/lib/lib.a /ehic/a/pa/linux/lib/lib.a /ehic/a/pa/linux/arch/parisc/lib/lib.a \
	-o vmlinux
ld: Unsatisfied symbols:
   swapper_pg_dir (data)
   _stext (data)
make: *** [vmlinux] Error 1

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

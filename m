Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA16446
	for <parisc-linux@puffin.external.hp.com>; Fri, 30 Apr 1999 17:07:59 -0600
Received: from localhost (adevries@localhost)
	by devserv.devel.redhat.com (8.8.7/8.8.7) with SMTP id TAA21732
	for <parisc-linux@thepuffingroup.com>; Fri, 30 Apr 1999 19:07:56 -0400
Date: Fri, 30 Apr 1999 19:07:56 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.3.96.990430190529.10592L-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Linker problems
List-ID: <linux-parisc.vger.kernel.org>


When I build the current kernel in CVS, it gets remarkably far, then dies
on:

parisc-linux-ld -m hppaelf -e stext arch/parisc/kernel/head.o
arch/parisc/kernel/init_task.o init/main.o init/version.o \
        --start-group \
        arch/parisc/kernel/kernel.o arch/parisc/mm/mm.o kernel/kernel.o
mm/mm.o fs/fs.o ipc/ipc.o \
        fs/filesystems.a \
        net/network.a \
        drivers/block/block.a drivers/char/char.a drivers/misc/misc.a
drivers/net/net.a drivers/video/video.a \
        /usr/src/parisc/work/linux/arch/parisc/lib/lib.a
/usr/src/parisc/work/linux/lib/lib.a
/usr/src/parisc/work/linux/arch/parisc/lib/lib.a \
        --end-group \
        -o vmlinux
make: *** [vmlinux] Aborted (core dumped)
make: *** Deleting file `vmlinux'

That's remarkably gross, since it indicates that there's a problem with
the linker.  I'm not quite sure what it is, but the problem seems to come
up when it's processing lib/libc.a.

I think that's a good thing for someone to look into.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
PA RISC Linux Porting Team

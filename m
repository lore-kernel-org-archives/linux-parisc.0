Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA12450
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Mar 2000 18:11:18 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 15 Mar 2000 00:12:39 -0000
Received: from unknown (HELO boilermaker.thepuffingroup.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 15 Mar 2000 00:12:38 -0000
Date: Tue, 14 Mar 2000 19:12:35 -0500 (EST)
From: "Dave O'Neill" <doneill@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.10003141855270.9288-100000@boilermaker.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] ld death
List-ID: <linux-parisc.vger.kernel.org>


I've managed to kill the linker from the x86 cross-binutils while building
a kernel.  Does anyone have any ideas what might be causing this?  Here's
what's happening:

hppa1.1-hp-linux-ld  -T /home/dmo/cvs/linux-2.3/arch/parisc/vmlinux.lds
arch/parisc/real/head.o  init/main.o init/version.o \
        --start-group \
        arch/parisc/kernel/pdc_cons.o arch/parisc/kernel/process.o
arch/parisc/real/real.o /home/dmo/cvs/linux-2.3/arch/parisc/lib/lib.a
arch/parisc/mm/mm.o arch/parisc/kernel/kernel.o arch/parisc/hpux/hpux.o
kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o arch/parisc/kernel/init_task.o \
        drivers/block/block.a drivers/char/char.o drivers/net/net.o
drivers/pci/pci.a drivers/gsc/gsc.a \
        net/network.a \
        /home/dmo/cvs/linux-2.3/arch/parisc/lib/lib.a
/home/dmo/cvs/linux-2.3/lib/lib.a  \
        --end-group \
        -o vmlinux
hppa1.1-hp-linux-ld: Warning: type of symbol `__ashrdi3' changed from 1 to
2 in ashrdi3.o
death: gsc_writeq type 1
hppa1.1-hp-linux-ld: can not size stub section: Bad value
make: *** [vmlinux] Segmentation fault (core dumped)

Dave
-- 
Dave O'Neill, Senior Linux Consultant, Linuxcare, Inc.
doneill@linuxcare.com, http://www.linuxcare.com/ 
Linuxcare. Support for the revolution.

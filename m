Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E3F24849
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 13:15:26 -0700 (MST)
Received: from npyu.esiee.fr (npyu.esiee.fr [147.215.80.150])
	by mail.esiee.fr (Postfix) with ESMTP id 62FE249BDF
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 21:15:25 +0100 (CET)
Date: Mon, 4 Feb 2002 21:15:25 +0100
Mime-Version: 1.0 (Apple Message framework v480)
Content-Type: text/plain; charset=US-ASCII; format=flowed
From: Thibaut VARENE <varenet@esiee.fr>
To: PA/Linux <parisc-linux@lists.parisc-linux.org>
Message-Id: <EC88D53E-19AB-11D6-B4EE-0030656F07A2@esiee.fr>
Subject: [parisc-linux] MacOSX - vmlinux linking error with the latest xc
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi again,

So I tried to compile kernel 2.4.17-pa17 (fetched from CVS), using a 
.config that has already been used to successfully compile the same 
kernel for B132 with Taggart's X86 xc.
It broke when linking vmlinux.

Here is the error output:

hppa-linux-ld  -r -o network.o socket.o core/core.o ethernet/ethernet.o 
802/802.o sched/sched.o netlink/netlink.o ipv4/ipv4.o unix/unix.o 
packet/packet.o sunrpc/sunrpc.o sysctl_net.o
hppa-linux-ld -T /Users/varenet/linux/arch/parisc/vmlinux.lds  
arch/parisc/kernel/head.o  init/main.o init/version.o \
         --start-group \
         arch/parisc/kernel/pdc_cons.o arch/parisc/kernel/process.o 
arch/parisc/lib/lib.a arch/parisc/mm/mm.o arch/parisc/kernel/kernel.o 
arch/parisc/hpux/hpux.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o 
arch/parisc/kernel/init_task.o \
          drivers/char/char.o drivers/block/block.o drivers/misc/misc.o 
drivers/net/net.o drivers/media/media.o drivers/scsi/scsidrv.o 
drivers/pci/driver.o drivers/video/video.o drivers/gsc/gscbus.o 
arch/parisc/math-emu/math.o \
         net/network.o \
         `hppa-linux-gcc -print-libgcc-file-name` 
/Users/varenet/linux/arch/parisc/lib/lib.a 
/Users/varenet/linux/lib/lib.a  \
         --end-group \
         -o vmlinux
make: *** [vmlinux] Bus error
make: *** Deleting file `vmlinux'

Any idea ?


Thibaut VARENE
PA/Linux ESIEE Team
http://www.esiee.fr/puffin

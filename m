Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA23772
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 May 2000 17:25:24 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id 85BFF3DC
	for <parisc-linux@thepuffingroup.com>; Fri, 26 May 2000 19:25:44 -0400 (EDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id QAA09671 for parisc-linux@thepuffingroup.com; Fri, 26 May 2000 16:26:35 -0700 (PDT)
Date: Fri, 26 May 2000 16:26:35 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200005262326.QAA09671@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [MERGE] -pre8 merge status
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
kernel now compiles with default .config but dies in the linker with:

hppa1.1-linux-ld  -T /linux/grundler/linux-2.3/arch/parisc/vmlinux.lds  arch/parisc/real/head.o  init/main.o init/version.o \
        --start-group \
        arch/parisc/kernel/pdc_cons.o arch/parisc/kernel/process.o arch/parisc/real/real.o /linux/grundler/linux-2.3/arch/parisc/lib/lib.a arch/parisc/mm/mm.o arch/parisc/kernel/kernel.o arch/parisc/hpux/hpux.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o arch/parisc/kernel/init_task.o \
        drivers/block/block.a drivers/char/char.o drivers/net/net.o  drivers/pci/pci.a drivers/gsc/gsc.a \
        net/network.a \
        /linux/grundler/linux-2.3/arch/parisc/lib/lib.a /linux/grundler/linux-2.3/lib/lib.a  \
        --end-group \
        -o vmlinux
mm/mm.o: In function `L1575':
mm/mm.o(.text+0x15ec): undefined reference to `clear_user_page'
fs/fs.o: In function `set_fs_altroot':
fs/fs.o(.text+0x11a98): undefined reference to `__emul_prefix'
fs/fs.o: In function `L1184':
fs/fs.o(.text.init+0x18fc): undefined reference to `nfs_debug'
ipc/ipc.o: In function `L1833':
ipc/ipc.o(.text+0x7088): undefined reference to `clear_user_page'
net/network.a(sunrpc.o): In function `rpc_create_client':
sunrpc.o(.text+0x360): undefined reference to `rpc_debug'
make: *** [vmlinux] Error 1

Thanks to all who helped!

later,
grant

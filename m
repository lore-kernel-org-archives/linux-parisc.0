From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] kernel BUG at include/asm/mmzone.h:74!
Date: Sat, 10 Jul 2004 13:54:12 +0200
Message-ID: <200407101354.12456.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I'm now running into this problem when trying to start X11, either with the VisEG stifb or sstfb driver.

Linux version 2.6.7-pa10 (root@p100) (gcc version 3.0.2 20010829 (prerelease)) #52 Sat Jul 10 12:13:50 CEST 2004

Machine: c3k, Kernel 2.6.7-pa10, 32bit kernel.

kernel BUG at include/asm/mmzone.h:74!
Kernel addresses on the stack:
 [<10128b94>] printk+0x108/0x184
 [<10107ee8>] dump_stack+0x18/0x24
 [<10154ab8>] remap_page_range+0x198/0x47c
 [<10166a24>] do_sync_write+0x74/0xa8
 [<102932f0>] fb_mmap+0x11c/0x130
 [<10158594>] do_mmap_pgoff+0x3b8/0x680
 [<10166ae4>] vfs_write+0x8c/0x138
 [<1010f2b4>] do_mmap2+0x74/0xdc
 [<1016615c>] sys_open+0x84/0xa8
 [<1010a35c>] tracesys_exit+0x0/0x34
 [<1010d088>] intr_check_sig+0x0/0xc

Is it maybe related to the latest CONFIG_DISCONTIGMEM or arch/parisc/mm/init.c changes ?

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Anders <dizzey@ing.umu.se>
Subject: [parisc-linux] k-class drivers/parisc/ccio-dma.c
Date: Sun, 27 Mar 2005 18:15:20 +0200
Message-ID: <20050327161520.GA15500@ing.umu.se>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

im having trouble with booting the 2.6 kernels on a k460.

--------------------------------------------------------
CPU(s): 4 x PA8000 (PCX-U) at 180.000000 MHz
Setting cache flush threshold to 40 (4 CPUs online)
Found U2 at 0xfff8a000
kernel BUG at drivers/parisc/ccio-dma.c:1317!
Backtrace:
 [<1025b0e0>] ccio_ioc_init+0x284/0x29c
 [<10131530>] printk+0x20/0x2c
 [<1025b5d4>] ccio_probe+0xd4/0x1f4
 [<10246588>] kobject_hotplug+0x27c/0x2e8
 [<101122e4>] parisc_driver_probe+0x2c/0x60
 [<1027fab4>] driver_probe_device+0x38/0x88
 [<1027fc5c>] driver_attach+0x84/0xc0
 [<102801cc>] bus_add_driver+0xa4/0xcc
 [<10280740>] driver_register+0x70/0x7c
 [<10104db4>] init+0x268/0x340
 [<1010dc5c>] ret_from_kernel_thread+0x1c/0x24

Kernel panic - not syncing: BUG!
----------------------------------------------------
i get this error with linux-2.6.12-rc1-pa4 and linux-2.6.11_p2

gcc version 3.3.5  (Gentoo Linux 3.3.5-r1, pie-8.7.7.1)
binutils-2.15.92.0.2-r1
tanya src # uname -a

Linux tanya 2.4.27-pa4 #6 SMP Wed Mar 23 19:05:42 CET 2005 parisc PA8000 
(PCX-U) 9000/889/K460 GNU/Linux

http://www.ing.umu.se/~dizzey/System.map

i hope this is sufficient

/dizzey
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

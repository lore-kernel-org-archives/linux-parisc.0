From: Richard Hirst <rhirst@levanta.com>
Subject: [parisc-linux] cvs head arch/parisc/kernel/drivers.c issues
Date: Sun, 31 Jul 2005 00:10:56 +0100
Message-ID: <20050730231056.GC5500@levanta.com>
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

Trying to boot cvs head on a C360; this is what happens:

do_device_inventory() calls system_map_inventory(), which calls
pdc_system_map_find_mods() which returns devices in the following
order:

system_map_inventory() f2003000, -1 -1 -1 -1 8 0 + 63
system_map_inventory() ffd00000, -1 -1 -1 -1 -1 8 + 16
system_map_inventory() ffd05000, -1 -1 -1 -1 8 16 + 4
system_map_inventory() ffd06000, -1 -1 -1 -1 8 16 + 5
system_map_inventory() ffd02000, -1 -1 -1 -1 8 16 + 0
system_map_inventory() ffd04000, -1 -1 -1 -1 8 16 + 1
system_map_inventory() ffd08000, -1 -1 -1 -1 8 16 + 7
system_map_inventory() ffd08100, -1 -1 -1 -1 8 16 + 8
system_map_inventory() f203f000, -1 -1 -1 -1 -1 8 + 63
system_map_inventory() f103f000, -1 -1 -1 -1 -1 10 + 63
system_map_inventory() f1000000, -1 -1 -1 -1 -1 10 + 0
system_map_inventory() f2000000, -1 -1 -1 -1 -1 8 + 0

so the first device node we try to create is 8/0/63.  That causes
nodes 8 and 8/0 to get created by create_parisc_device() calling
alloc_tree_node() as it walks the path.  Those two nodes are left
with "dev->id.hw_type = HPHW_FAULTY" by create_tree_node().

Next we try to create device node 8/16.  We end up in match_by_id()
to check if a node for '8' exists already.  Because that node is
marked HPHW_FAULTY it gets ignored, and alloc_tree_node() ends up
creating a second node for device '8'.  We then go on to try and
register this second node '8' with sysfs and things start falling
apart because the node already exists.

I tried making match_by_id() treat HPHW_FAULTY nodes as valid
and then the boot gets much further:


Found devices:
1. Raven U/L2 Dino RS-232 at 0xf2003000 [8/0/63] { 10, 0x0, 0x006, 0x0008c }
2. Raven+ w SE FWSCSI Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x056, 0x0008c }
3. Raven+ w SE FWSCSI Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x056, 0x00082 } 
4. Raven+ w SE FWSCSI Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x056, 0x00074 },  additional addresses: 0xffd01000 0xffd03000 
5. Raven+ w SE FWSCSI Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x056, 0x0007b }
6. Raven+ w SE FWSCSI Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x056, 0x00084 }
7. Raven+ w SE FWSCSI Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x056, 0x00084 }
8. Dino PCI Bridge at 0xf2000000 [8/0] { 13, 0x3, 0x680, 0x0000a },  additional addresses: 0xf2800000 
9. Raven+ w SE FWSCSI Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x056, 0x00081 },  additional addresses: 0xffd0c000 0xffc00000 
10. U2-IOA BC GSC+ Port at 0xf203f000 [8/63] { 7, 0x1, 0x501, 0x0000c }
11. Raven U/L2 Dino PS/2 Port at 0xf2001000 [8/1] { 10, 0x0, 0x006, 0x00096 }
12. U2-IOA BC GSC+ Port at 0xf103f000 [10/63] { 7, 0x1, 0x501, 0x0000c }
13. Cujo PCI Bridge at 0xf1000000 [10/0] { 13, 0x1, 0x682, 0x0000a },  additional addresses: 0xf1800000 0xf6000000 
14. Dino RS-232 at 0xf1003000 [10/3] { 10, 0x0, 0x007, 0x0008c }
15. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 0x0000b }
16. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0xf, 0x580, 0x0000b }
17. Raven W 360 (9000/780) at 0xfffa0000 [32] { 0, 0x0, 0x5c6, 0x00004 }
18. Memory at 0xfffb1000 [49] { 1, 0x0, 0x097, 0x00009 }
CPU(s): 1 x PA8500 (PCX-W) at 367.111100 MHz
Setting cache flush threshold to 720 (1 CPUs online)
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xf2000000
DEV: registering device: ID = 'pci0000:00'
DEV: registering device: ID = '0000:00:13.0'
DEV: registering device: ID = '0000:00:14.0'
Cujo version 2.0 found at 0xf1000000
Enabling Cujo 2.0 bug workaround
DEV: registering device: ID = 'pci0000:01'
DEV: registering device: ID = '0000:01:04.0'
SCSI subsystem initialized
TC classifier action (bugs to netdev@vger.kernel.org cc hadi@cyberus.ca)
unwind_init: start = 0x10423e20, end = 0x10447940, entries = 9138
inotify syscall
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Initializing Cryptographic API
PDC Stable Storage facility v0.09
Backtrace:
 [<10128170>] __wake_up+0x54/0x84
 [<1014b3b8>] __queue_work+0x60/0x80
 [<10142484>] run_timer_softirq+0x148/0x240
 [<1013c2dc>] __do_softirq+0x140/0x194
 [<10104958>] __lock_text_end+0x58/0x64
 [<1010e068>] intr_return+0x0/0x24
 [<103d7990>] klist_next+0x8/0x78
 [<102bea2c>] device_for_each_child+0x30/0x8c
 [<101122c0>] descend_children+0x20/0x50
 [<102bea50>] device_for_each_child+0x54/0x8c
 [<101122c0>] descend_children+0x20/0x50
 [<102bea50>] device_for_each_child+0x54/0x8c
 [<101122c0>] descend_children+0x20/0x50
 [<10112310>] for_each_padev+0x20/0x2c
 [<1011292c>] parse_tree_node+0x48/0x64
 [<10112a08>] check_parent+0x64/0x154


Bad Address (null pointer deref?): Code=6 regs=12ab5380 (Addr=081f0242)
Kernel panic - not syncing: Bad Address (null pointer deref?)


The devices are not printed in a logical order (e.g. 8/0/63 is before
8/0) which I think is a change for earlier kernels.

The change I made to match_by_id() was just to disable the call to
check_dev().

Anyone got any thoughts or suggestions on drivers.c or the device
discovery order?

Thanks,
  Richard

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

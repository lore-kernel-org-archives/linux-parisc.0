From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] c110 panic when try to boot 2.6.10-rc1-pa11?
Date: Sat, 13 Nov 2004 19:42:16 +0000
Message-ID: <41966398.4070303@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
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

hello pa*,

2.6.10-rc1-pa10 works fine on this c110 (as soon as I don't try to use the narrow se crtlr)

unfortunately 2.6.10-rc1-pa11 failled to boot with following message:

SCSI device sda: drive cache: write back
  sda:Backtrace:
  [<10152bd8>] __blk_queue_bounce+0x210/0x290
  [<10244814>] __make_request+0x68/0x508
  [<10245064>] generic_make_request+0x20c/0x2bc
  [<10245180>] submit_bio+0x6c/0x158
  [<1016b710>] submit_bh+0x128/0x1d4
  [<1016a3f8>] block_read_full_page+0x1f8/0x340
  [<101451c0>] read_cache_page+0x90/0x320
  [<1019c374>] read_dev_sector+0x34/0x110
  [<1019cb20>] msdos_partition+0x98/0x5fc
  [<1019bd04>] check_partition+0xd0/0x164
  [<1019c174>] register_disk+0xd0/0x160
  [<10246e58>] add_disk+0x54/0x68
  [<10274764>] sd_probe+0x240/0x39c
  [<1023d87c>] bus_match+0x4c/0x84
  [<1023d9e8>] driver_attach+0x80/0xa8
  [<1023df48>] bus_add_driver+0xb0/0xd8


Kernel Fault: Code=26 regs=109949c0 (Addr=0000000c)
      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 10201000 10152bd8 00000000
r04-07  109a5790 00000200 00000000 00000010
r08-11  10994818 00000000 2fd092f4 1045d810
r12-15  00000000 10000000 1045d810 1045d810
r16-19  1016e9d8 f00000ac f00000a4 10994954
r20-23  10994954 00000000 10991958 10994958
r24-27  00000000 00000010 00000000 1038c010
r28-31  109a2120 10961bd4 109949c0 10146ee4
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10146ed0 10146ed4
  IIR: 0c781099    ISR: 00000000  IOR: 0000000c
  CPU:        0   CR30: 10994000 CR31: 103e4000
  ORIG_R28: 1045a810
  IAOQ[0]: mempool_alloc+0xa0/0x18c
  IAOQ[1]: mempool_alloc+0xa4/0x18c
  RP(r2): __blk_queue_bounce+0x210/0x290
Kernel panic - not syncing: Kernel Fault
  <0>Rebooting in 120 seconds..

Too bad :(

the diff between src trees is very small:
diff -NaurX dontdiff linux-2.6.10-rc1-pa10/Documentation/parisc/00-INDEX linux-2.6.10-rc1-pa11/Documentation/parisc/00-INDEX
--- linux-2.6.10-rc1-pa10/Documentation/parisc/00-INDEX 2004-08-23 10:52:25.000000000 +0200
+++ linux-2.6.10-rc1-pa11/Documentation/parisc/00-INDEX 2004-11-11 17:18:02.000000000 +0100
[snip]
diff -NaurX dontdiff linux-2.6.10-rc1-pa10/Documentation/parisc/todo linux-2.6.10-rc1-pa11/Documentation/parisc/todo
--- linux-2.6.10-rc1-pa10/Documentation/parisc/todo     2004-08-27 19:18:58.000000000 +0200
+++ linux-2.6.10-rc1-pa11/Documentation/parisc/todo     2004-11-11 17:18:02.000000000 +0100
[snip]
diff -NaurX dontdiff linux-2.6.10-rc1-pa10/Makefile linux-2.6.10-rc1-pa11/Makefile
--- linux-2.6.10-rc1-pa10/Makefile      2004-11-06 15:55:05.000000000 +0100
+++ linux-2.6.10-rc1-pa11/Makefile      2004-11-11 17:18:01.000000000 +0100
@@ -1,7 +1,7 @@
  VERSION = 2
  PATCHLEVEL = 6
  SUBLEVEL = 10
-EXTRAVERSION =-rc1-pa10
+EXTRAVERSION =-rc1-pa11
  NAME=Woozy Numbat

  # *DOCUMENTATION*
diff -NaurX dontdiff linux-2.6.10-rc1-pa10/arch/parisc/configs/a500_defconfig linux-2.6.10-rc1-pa11/arch/parisc/configs/a500_defconfig
--- linux-2.6.10-rc1-pa10/arch/parisc/configs/a500_defconfig    2004-08-23 10:52:33.000000000 +0200
+++ linux-2.6.10-rc1-pa11/arch/parisc/configs/a500_defconfig    2004-11-11 17:18:05.000000000 +0100
[snip]
diff -NaurX dontdiff linux-2.6.10-rc1-pa10/arch/parisc/lib/memcpy.c linux-2.6.10-rc1-pa11/arch/parisc/lib/memcpy.c
--- linux-2.6.10-rc1-pa10/arch/parisc/lib/memcpy.c      2004-10-16 18:08:06.000000000 +0200
+++ linux-2.6.10-rc1-pa11/arch/parisc/lib/memcpy.c      2004-11-13 17:15:17.000000000 +0100
@@ -110,8 +110,8 @@
         "\t" EXC_WORD "\t1b\n"                          \
         "\t" EXC_WORD "\t" #_e "\n"                     \
         "\t.previous\n"                                 \
-       : _tt(_t), "+r"(_a)                             \
-       : "1"(_a)                                       \
+       : _tt(_t)                                       \
+       : "r"(_a)                                       \
         : "r8")

  #define def_store_ai_insn(_insn,_sz,_tt,_s,_a,_t,_e)   \
@@ -121,16 +121,16 @@
         "\t" EXC_WORD "\t1b\n"                          \
         "\t" EXC_WORD "\t" #_e "\n"                     \
         "\t.previous\n"                                 \
-       : "+r"(_a)                                      \
-       : _tt(_t), "0"(_a)                              \
+       :                                               \
+       : "r"(_a), _tt(_t)                              \
         : "r8")

  #define ldbma(_s, _a, _t, _e) def_load_ai_insn(ldbs,1,"=r",_s,_a,_t,_e)
  #define stbma(_s, _t, _a, _e) def_store_ai_insn(stbs,1,"r",_s,_a,_t,_e)
  #define ldwma(_s, _a, _t, _e) def_load_ai_insn(ldw,4,"=r",_s,_a,_t,_e)
  #define stwma(_s, _t, _a, _e) def_store_ai_insn(stw,4,"r",_s,_a,_t,_e)
-#define flddma(_s, _a, _t, _e) def_load_ai_insn(fldd,8,"=f",_s,_a,_t,_e)
-#define fstdma(_s, _t, _a, _e) def_store_ai_insn(fstd,8,"f",_s,_a,_t,_e)
+#define flddma(_s, _a, _t, _e) def_load_ai_insn(fldd,8,"=Z",_s,_a,_t,_e)
+#define fstdma(_s, _t, _a, _e) def_store_ai_insn(fstd,8,"Z",_s,_a,_t,_e)

  #define def_load_insn(_insn,_tt,_s,_o,_a,_t,_e)        \
         __asm__ __volatile__ (                          \
@@ -297,7 +297,7 @@
  unsigned long pa_memcpy(void *dstp, const void *srcp, unsigned long len)
  {
         register unsigned long src, dst, t1, t2, t3;
-       register char *pcs, *pcd;
+       register unsigned char *pcs, *pcd;
         register unsigned int *pws, *pwd;
         register double *pds, *pdd;
         unsigned long ret = 0;
diff -NaurX dontdiff linux-2.6.10-rc1-pa10/arch/parisc/mm/init.c linux-2.6.10-rc1-pa11/arch/parisc/mm/init.c
--- linux-2.6.10-rc1-pa10/arch/parisc/mm/init.c 2004-10-30 17:37:52.000000000 +0200
+++ linux-2.6.10-rc1-pa11/arch/parisc/mm/init.c 2004-11-13 19:52:50.425203881 +0100
@@ -59,8 +59,6 @@

  static struct resource sysram_resources[MAX_PHYSMEM_RANGES];

-static unsigned long max_pfn;
-
  /* The following array is initialized from the firmware specific
   * information retrieved in kernel/inventory.c.
   */
diff -NaurX dontdiff linux-2.6.10-rc1-pa10/drivers/parisc/sba_iommu.c linux-2.6.10-rc1-pa11/drivers/parisc/sba_iommu.c
--- linux-2.6.10-rc1-pa10/drivers/parisc/sba_iommu.c    2004-11-12 21:42:51.000000000 +0100
+++ linux-2.6.10-rc1-pa11/drivers/parisc/sba_iommu.c    2004-11-11 17:18:13.000000000 +0100
[snip]
=========><=========
(this last one doesn't affect c110)

I first suspected the more complex i.e. memcpy.c and revert it first but it doesn't help :O

OTC reverting the second one (i.e. init.c) help a bit in the way the system boot again but wrongly as you can judge by your self 
with following init errors:

Cleaning up ifupdown...done.
Starting raid devices:
sed: -e expression #1, char 87: unterminated `s' command
sed: -e expression #1, char 15: unterminated `s' command
sed: -e expression #1, char 15: unterminated `s' command
sed: -e expression #1, char 15: unterminated `s' command
sed: -e expression #1, char 15: unterminated `s' command
sed: -e expression #1, char 15: unterminated `s' command
sed: -e expression #1, char 15: unterminated `s' command
done.
Setting up LVM Volume Groups...

[...]
Discovering hardware: discover: ../../lib/device-xml.c:180: create_device: Assertion `vendor_name != ((void *)0)' f.
Running 0dns-down to make sure resolv.conf is ok..awk: cmd. line:1: BEGIN {FS = "." } /resolv\.conf\.bak/ {print $Ntawk: cmd. line:1:
                                                                           ^ unexpected newline or end of string
done.
/dev/shm/network/...Initializing: /etc/network/ifstate.
grep: /etc/network/option: No such file or directory
Setting up IP spoofing protection: rp_filter.
grep: /etc/network/option: No such file or directory
grep: /etc/network/option: No such file or directory
Configuring network interfaces...run-parts: failed to open directory /etc/network/if-pre-up.: No such file or direcy
Disabled Privacy Extensions on device 103ac490(lo)
run-parts: failed to open directory /etc/network/if-up.: No such file or directory
run-parts: failed to open directory /etc/network/if-pre-up.: No such file or directory
eth0: link ok.
run-parts: failed to open directory /etc/network/if-up.: No such file or directory
done.
Usage: /etc/init.d/portmap {start|stop|reload|restart}
Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Sat Nov 13 19:20:14 CET 2004
Usage: /etc/init.d/ntpdate {start|stop|restart|reload|force-reload}
cat: /proc/sys/kernel/random/poolsiz: No such file or directory
Initializing random number generator...cat: /var/lib/urandom/random-see: No such file or directory
urandom start: failed.
done.
[...]
Starting portmap daemon: portmap.
grep: /etc/inetd.con: No such file or directory
Starting MTA: update-exim4.co: invalid option -- l
Terminating...
grep: /etc/inetd.con: No such file or directory
Starting file alteration monitor: FAM.
Starting mouse interface server: gpm.
Starting printer spooler: lpd/sbin/start-stop-daemo: option `--exec' requires an argument
Try `/sbin/start-stop-daemo --help' for more information.
.
Starting printer spooler: lpd/sbin/start-stop-daemo: option `--exec' requires an argument
Try `/sbin/start-stop-daemo --help' for more information.
.
Starting network benchmark server: netserver.
rsync daemon not enabled in /etc/default/rsync
Starting OpenBSD Secure Shell server: sshd.
Starting the system activity data collector: sadc.
Setting up X font server socket directory /tmp/.font-unix...done.
Starting X font server: xfsusage: /usr/bin/X11/xf [-config config_file] [-daemon] [-droppriv] [-ls listen_socket] []
  already running.
Usage: /etc/init.d/xinetd {start|stop|reload|force-reload|restart}
Usage: nfs-common {start|stop|restart}
Usage: /etc/init.d/ntp-server {start|stop|restart|force-reload}
Starting RAID monitor daemon: mdadm -F.
Starting proxy server: squid.
Starting anac(h)ronistic cron: anacron.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.
cat: /etc/X11/default-display-manage: No such file or directory
Not starting GNOME Display Manager (gdm); it is not the default display manager.

I didn't analyse in much detail but eg /etc/X11/default-display-manage exists but it's name seems to be longer:
# ll /etc/X11/default*                                                                                 ls: 
/etc/X11/default-display-manageß: No such file or directory

Randolph: any idea?

Thanks in advance for attention,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

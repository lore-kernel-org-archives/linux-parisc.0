From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Eliminate sg_virt_addr() and private scatterlist.h
Date: Sat, 21 Mar 2015 18:38:24 -0400
Message-ID: <BLU436-SMTP104E07C2063DB7F0270896D970F0@phx.gbl>
References: <1426873079-32288-1-git-send-email-matthew.r.wilcox@intel.com> <BLU437-SMTP942FD29D20A2E21EC80670970F0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary="Apple-Mail-3--153777285"
Cc: Matthew Wilcox <matthew.r.wilcox@intel.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU437-SMTP942FD29D20A2E21EC80670970F0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-3--153777285
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On 2015-03-21, at 11:04 AM, John David Anglin wrote:

> On 2015-03-20, at 1:37 PM, Matthew Wilcox wrote:
>=20
>> From: Matthew Wilcox <willy@linux.intel.com>
>>=20
>> The only reason to keep parisc's private asm/scatterlist.h was that =
it
>> had the macro sg_virt_addr().  Convert all callers to use something =
else
>> (sometimes just sg->offset was enough, others should use sg_virt()), =
and
>> we can just use the asm-generic scatterlist.h instead.
>>=20
>> Signed-off-by: Matthew Wilcox <willy@linux.intel.com>
>> ---
>>=20
>> I haven't even compile-tested these changes ... I do have some =
PA-RISC
>> equipment, but it hasn't been turned on in seven years.
>=20
> Tested-by: dave.anglin@bell.net

Possibly when I sent the above, it was a little early to say the change =
was "tested".
See attached.  Console log is somewhat truncated.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-3--153777285
Content-Disposition: attachment; filename="oom.txt"
Content-Type: text/plain; name="oom.txt"
Content-Transfer-Encoding: quoted-printable

[10457]  1000 10457     1235      314      19       0      352           =
  0 make
[11456]  1000 11456     1229      298      24       0      102           =
  0 bash
[11465]  1000 11465     1241      290      11       0      114           =
  0 bash
[11483]  1000 11483     2830      314      22       0     1914           =
  0 make
[ 1790]  1000  1790     1218      282      24       0       83           =
  0 bash
[ 1791]  1000  1791     2805      314      22       0     1897           =
  0 make
[ 1859]  1000  1859     1203      282      24       0       68           =
  0 bash
[ 1860]  1000  1860     1208      306      11       0       73           =
  0 bash
[ 1870]  1000  1870    31806      408      51       0     7240           =
  0 expect
[16044]   105 16044     1806      160      32       0      121           =
  0 pickup
[ 1530]  1000  1530      837      282       8       0       54           =
  0 xgcc
[ 1537]  1000  1537      764       16       8       0       36           =
  0 collect2
[ 1538]  1000  1538     1239      314      10       0      444           =
  0 ld.bfd.real
[ 1540]  1000  1540      803      298       8       0       39           =
  0 lto-wrapper
[ 1543]  1000  1543      838      282       8       0       47           =
  0 xgcc
Out of memory: Kill process 2705 (sanlock) score 2 or sacrifice child
Killed process 2705 (sanlock) total-vm:44176kB, anon-rss:37368kB, =
file-rss:2484kB
kthreadd invoked oom-killer: gfp_mask=3D0x2000d0, order=3D2, =
oom_score_adj=3D0
CPU: 2 PID: 2 Comm: kthreadd Not tainted 4.0.0-rc4+ #1
Backtrace:
 [<00000000401588b8>] show_stack+0x20/0x38
 [<000000004037e804>] dump_stack+0x9c/0x110
 [<00000000402142b4>] dump_header.isra.12+0xb4/0x218
 [<0000000040214e44>] oom_kill_process+0x3f4/0x6d8
 [<00000000402153cc>] __out_of_memory+0x2a4/0x488
 [<0000000040215980>] out_of_memory+0x98/0xe8
 [<000000004021b55c>] __alloc_pages_nodemask+0x75c/0x7f0
 [<000000004021b8d4>] alloc_kmem_pages_node+0x5c/0x70
 [<000000004017dd34>] copy_process.part.62+0x184/0x1c18
 [<0000000040144020>] end_fault_vector+0x20/0x28
 [<00000000402136d8>] mempool_alloc_slab+0x28/0x40
 [<0000000040213974>] mempool_alloc+0xa4/0x208
 [<00000000142d47b0>] scsi_sg_alloc+0x50/0x150 [scsi_mod]
 [<0000000040394178>] __sg_alloc_table+0xb0/0x1e0

Mem-info:
Normal per-cpu:
CPU    0: hi:  186, btch:  31 usd:  25
CPU    1: hi:  186, btch:  31 usd: 127
CPU    2: hi:  186, btch:  31 usd:   0
CPU    3: hi:  186, btch:  31 usd:  13
Normal per-cpu:
CPU    0: hi:  186, btch:  31 usd:   0
CPU    1: hi:  186, btch:  31 usd:   0
CPU    2: hi:  186, btch:  31 usd:   0
CPU    3: hi:  186, btch:  31 usd:   0
Normal per-cpu:
CPU    0: hi:  186, btch:  31 usd:   0
CPU    1: hi:  186, btch:  31 usd:   0
CPU    2: hi:  186, btch:  31 usd:   0
CPU    3: hi:  186, btch:  31 usd:   0
active_anon:0 inactive_anon:8 isolated_anon:0
 active_file:56 inactive_file:60 isolated_file:0
 unevictable:10016 dirty:0 writeback:0 unstable:0
 free:77039 slab_reclaimable:171489 slab_unreclaimable:21760
 mapped:729 shmem:0 pagetables:1431 bounce:0
 free_cma:0
Normal free:47364kB min:1384kB low:1728kB high:2076kB active_anon:0kB =
inactive_anon:0kB active_file:224kB inactive_file:240kB =
unevictable:40064kB isolated(anon):0kB isolated(file):0kB =
present:1048576kB managed:995888kB mlocked:40064kB dirty:0kB =
writeback:0kB mapped:2916kB shmem:0kB slab_reclaimable:52584kB =
slab_unreclaimable:19116kB kernel_stack:2672kB pagetables:5704kB =
unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 =
all_unreclaimable? no
lowmem_reserve[]: 0 0
Normal free:132376kB min:5760kB low:7200kB high:8640kB active_anon:0kB =
inactive_anon:52kB active_file:0kB inactive_file:0kB unevictable:0kB =
isolated(anon):0kB isolated(file):0kB present:4192256kB =
managed:4134812kB mlocked:0kB dirty:0kB writeback:0kB mapped:0kB =
shmem:0kB slab_reclaimable:435152kB slab_unreclaimable:46872kB =
kernel_stack:32kB pagetables:20kB unstable:0kB bounce:0kB free_cma:0kB =
writeback_tmp:0kB pages_scanned:416 all_unreclaimable? yes
lowmem_reserve[]: 0 0
Normal free:128416kB min:4324kB low:5404kB high:6484kB active_anon:0kB =
inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB =
isolated(anon):0kB isolated(file):0kB present:3145728kB =
managed:3102620kB mlocked:0kB dirty:0kB writeback:0kB mapped:0kB =
shmem:0kB slab_reclaimable:198220kB slab_unreclaimable:21052kB =
kernel_stack:384kB pagetables:0kB unstable:0kB bounce:0kB free_cma:0kB =
writeback_tmp:0kB pages_scanned:0 all_unreclaimable? yes
lowmem_reserve[]: 0 0
Normal: 11079*4kB (UEM) 467*8kB (UEM) 9*16kB (UMR) 1*32kB (R) 1*64kB (R) =
1*128kB (R) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 48420kB
Normal: 32226*4kB (UEM) 434*8kB (UM) 0*16kB 0*32kB 0*64kB 0*128kB =
0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 132376kB
Normal: 27604*4kB (UEM) 2116*8kB (UEM) 67*16kB (M) 0*32kB 0*64kB 0*128kB =
0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 128416kB
725 total pagecache pages
34 pages in swap cache
Swap cache stats: add 91383, delete 91349, find 928197/954032
Free swap  =3D 7732896kB
Total swap =3D 7815616kB
2096640 pages of RAM
10777 reserved pages
Zone list for zone 0 on node 0: [0/Normal] [0/Normal] [0/Normal]=20
Zone list for zone 1 on node 0: [0/Normal] [0/Normal] [0/Normal]=20
Zone list for zone 0 on node 1: [0/Normal] [0/Normal] [0/Normal]=20
Zone list for zone 1 on node 1: [0/Normal] [0/Normal] [0/Normal]=20
Zone list for zone 0 on node 2: [0/Normal] [0/Normal] [0/Normal]=20
Zone list for zone 1 on node 2: [0/Normal] [0/Normal] [0/Normal]=20
[ pid ]   uid  tgid total_vm      rss nr_ptes nr_pmds swapents =
oom_score_adj name
[ 1114]     0  1114     2700      419      36       0      207         =
-1000 udevd
[ 2271]     0  2271     1040      393      33       0       92           =
  0 rpcbind
[ 2315]   102  2315     1082      399      32       0      133           =
  0 rpc.statd
[ 2348]     0  2348      698      244      16       0       48           =
  0 rpc.idmapd
[ 2586]     0  2586      499      346       6       0       38           =
  0 minissdpd
[ 2607]     0  2607      855      235      15       0       43           =
  0 uuidd
[ 2630]     0  2630      751      384      22       0       75           =
  0 cgmanager
[ 2637]     0  2637     7971      148      34       0      205           =
  0 rsyslogd
[ 2725]     0  2725      750      345      22       0       63           =
  0 cgproxy
[ 2754]     0  2754      621      346      13       0       46           =
  0 atd
[ 2815]     0  2815     1043      346      13       0       52           =
  0 irqbalance
[ 2830]     0  2830    20108      187      23       0      126           =
  0 nscd
[ 2841]     0  2841    24952      173      58       0     2013           =
  0 lwresd
[ 2872]     0  2872      611      354      11       0       29           =
  0 inetd
[ 2916]     0  2916     2519      371      66       0      216           =
  0 cupsd
[ 2934]   104  2934     1239      361      32       0      113           =
  0 dbus-daemon
[ 3006]   120  3006    47532      433      82       0      325          =
-900 postgres
[ 3009]   120  3009    47532      194      55       0      336           =
  0 postgres
[ 3011]   120  3011    47532      213      56       0      337           =
  0 postgres
[ 3012]   120  3012    47532      326      54       0      348           =
  0 postgres
[ 3013]   120  3013    47606      391      59       0      381           =
  0 postgres
[ 3015]   120  3015    11562      391      52       0      336           =
  0 postgres
[ 3042]   106  3042     1499      399      30       0      116           =
  0 ntpd
[ 3130]   118  3130      883      336      27       0       75           =
  0 avahi-daemon
[ 3138]     0  3138      733      345      23       0       53           =
  0 cron
[ 3139]   118  3139      851      219      22       0       61           =
  0 avahi-daemon
[ 3165]     0  3165     1375      357      19       0       93           =
  0 ofonod
[ 3240]     0  3240     1851      322      34       0      152         =
-1000 sshd
[ 3429]     0  3429     1853      167      32       0      122           =
  0 master
[ 3436]   105  3436     1817      148      31       0      118           =
  0 qmgr
[ 3455]     0  3455      569      346      14       0       34           =
  0 getty
[ 3464]     0  3464      851      400      27       0       59           =
  0 systemd-logind
[ 3873]  1000  3873      521       96       6       0       26           =
  0 build
[10439]  1000 10439     1231      314      19       0      336           =
  0 make
[10445]  1000 10445     1208      298      24       0       73           =
  0 bash
[10457]  1000 10457     1235      314      19       0      352           =
  0 make
[11456]  1000 11456     1229      298      24       0      102           =
  0 bash
[11465]  1000 11465     1241      290      11       0      114           =
  0 bash
[11483]  1000 11483     2830      314      22       0     1914           =
  0 make
[ 1790]  1000  1790     1218      282      24       0       83           =
  0 bash
[ 1791]  1000  1791     2805      314      22       0     1897           =
  0 make
[ 1859]  1000  1859     1203      282      24       0       68           =
  0 bash
[ 1860]  1000  1860     1208      306      11       0       73           =
  0 bash
[ 1870]  1000  1870    31806      408      51       0     7240           =
  0 expect
[16044]   105 16044     1806      160      32       0      121           =
  0 pickup
[ 1530]  1000  1530      837      282       8       0       54           =
  0 xgcc
[ 1537]  1000  1537      764       16       8       0       36           =
  0 collect2
[ 1538]  1000  1538     1239      314      10       0      444           =
  0 ld.bfd.real
[ 1540]  1000  1540      803      298       8       0       39           =
  0 lto-wrapper
[ 1543]  1000  1543      838      282       8       0       47           =
  0 xgcc
[ 1544]  1000  1544      838      247       6       0       47           =
  0 xgcc
Out of memory: Kill process 1870 (expect) score 1 or sacrifice child
Killed process 1530 (xgcc) total-vm:3348kB, anon-rss:0kB, =
file-rss:1128kB
INFO: task kswapd1:285 blocked for more than 120 seconds.
      Not tainted 4.0.0-rc4+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
kswapd1         D 00000000401440c0     0   285      2 0x00000000
Backtrace:
 [<000000004014e4e8>] __schedule+0x248/0x5d0
 [<000000004014e8b8>] schedule+0x48/0xc8
 [<000000001d083f40>] _xfs_log_force_lsn+0x230/0x440 [xfs]
 [<000000001d08417c>] xfs_log_force_lsn+0x2c/0x90 [xfs]
 [<000000001d068614>] __xfs_iunpin_wait+0xb4/0x1f0 [xfs]
 [<000000001d06d78c>] xfs_iunpin_wait+0x2c/0x190 [xfs]
 [<000000001d05d7fc>] xfs_reclaim_inode+0x9c/0x550 [xfs]
 [<000000001d05de68>] xfs_reclaim_inodes_ag+0x1b8/0x520 [xfs]
 [<000000001d05ee80>] xfs_reclaim_inodes_nr+0x60/0xb0 [xfs]
 [<000000001d076004>] xfs_fs_free_cached_objects+0x24/0x58 [xfs]
 [<000000004026a79c>] super_cache_scan+0x2fc/0x308
 [<0000000040225f54>] shrink_slab.part.48.constprop.57+0x31c/0x3c8
 [<000000004022927c>] shrink_zone+0xe4/0xe8
 [<0000000040229cf4>] kswapd+0x614/0xae0
 [<00000000401a4824>] kthread+0x144/0x178
 [<0000000040144020>] end_fault_vector+0x20/0x28

INFO: task kswapd2:286 blocked for more than 120 seconds.
      Not tainted 4.0.0-rc4+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
kswapd2         D 00000000401440c0     0   286      2 0x00000000
Backtrace:
 [<000000004014e4e8>] __schedule+0x248/0x5d0
 [<000000004014e8b8>] schedule+0x48/0xc8
 [<000000004014ed58>] schedule_preempt_disabled+0x20/0x38
 [<0000000040151b70>] __mutex_lock_slowpath+0x180/0x3f0
 [<0000000040151e04>] mutex_lock+0x24/0x48
 [<000000001d05df60>] xfs_reclaim_inodes_ag+0x2b0/0x520 [xfs]
 [<000000001d05ee80>] xfs_reclaim_inodes_nr+0x60/0xb0 [xfs]
 [<000000001d076004>] xfs_fs_free_cached_objects+0x24/0x58 [xfs]
 [<000000004026a79c>] super_cache_scan+0x2fc/0x308
 [<0000000040225f54>] shrink_slab.part.48.constprop.57+0x31c/0x3c8
 [<000000004022927c>] shrink_zone+0xe4/0xe8
 [<0000000040229cf4>] kswapd+0x614/0xae0
 [<00000000401a4824>] kthread+0x144/0x178
 [<0000000040144020>] end_fault_vector+0x20/0x28
 [<00000000402136d8>] mempool_alloc_slab+0x28/0x40
 [<0000000040213974>] mempool_alloc+0xa4/0x208
INFO: task postgres:3006 blocked for more than 120 seconds.
      Not tainted 4.0.0-rc4+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
postgres        D 00000000401440c0     0  3006      1 0x00000010
Backtrace:
 [<000000004014e4e8>] __schedule+0x248/0x5d0
 [<000000004014e8b8>] schedule+0x48/0xc8
 [<000000004014ed58>] schedule_preempt_disabled+0x20/0x38
 [<0000000040151b70>] __mutex_lock_slowpath+0x180/0x3f0
 [<0000000040151e04>] mutex_lock+0x24/0x48
 [<000000001d05df60>] xfs_reclaim_inodes_ag+0x2b0/0x520 [xfs]
 [<000000001d05ee80>] xfs_reclaim_inodes_nr+0x60/0xb0 [xfs]
 [<000000001d076004>] xfs_fs_free_cached_objects+0x24/0x58 [xfs]
 [<000000004026a79c>] super_cache_scan+0x2fc/0x308
 [<0000000040225f54>] shrink_slab.part.48.constprop.57+0x31c/0x3c8
 [<000000004022927c>] shrink_zone+0xe4/0xe8
 [<0000000040229570>] try_to_free_pages+0x2f0/0x460
 [<000000004021b1b4>] __alloc_pages_nodemask+0x3b4/0x7f0
 [<000000004021b8d4>] alloc_kmem_pages_node+0x5c/0x70
 [<000000004017dd34>] copy_process.part.62+0x184/0x1c18
 [<0000000040192474>] sigprocmask+0x74/0xb0

INFO: task cron:3138 blocked for more than 120 seconds.
      Not tainted 4.0.0-rc4+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
cron            D 00000000401440c0     0  3138      1 0x00000010
Backtrace:
 [<000000004014e4e8>] __schedule+0x248/0x5d0
 [<000000004014e8b8>] schedule+0x48/0xc8
 [<000000004014ed58>] schedule_preempt_disabled+0x20/0x38
 [<0000000040151b70>] __mutex_lock_slowpath+0x180/0x3f0
 [<0000000040151e04>] mutex_lock+0x24/0x48
 [<000000001d05df60>] xfs_reclaim_inodes_ag+0x2b0/0x520 [xfs]
 [<000000001d05ee80>] xfs_reclaim_inodes_nr+0x60/0xb0 [xfs]
 [<000000001d076004>] xfs_fs_free_cached_objects+0x24/0x58 [xfs]
 [<000000004026a79c>] super_cache_scan+0x2fc/0x308
 [<0000000040225f54>] shrink_slab.part.48.constprop.57+0x31c/0x3c8
 [<000000004022927c>] shrink_zone+0xe4/0xe8
 [<0000000040229570>] try_to_free_pages+0x2f0/0x460
 [<000000004021b1b4>] __alloc_pages_nodemask+0x3b4/0x7f0
 [<000000004021b8d4>] alloc_kmem_pages_node+0x5c/0x70
 [<000000004017dd34>] copy_process.part.62+0x184/0x1c18
 [<000000004026ce74>] SyS_stat64+0x4c/0x70

INFO: task kworker/2:0H:1079 blocked for more than 120 seconds.
      Not tainted 4.0.0-rc4+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
kworker/2:0H    D 00000000401440c0     0  1079      2 0x00000000
Workqueue: xfs-log/sdc5 xfs_log_worker [xfs]
Backtrace:
 [<000000004014e4e8>] __schedule+0x248/0x5d0
 [<000000004014e8b8>] schedule+0x48/0xc8
 [<000000001d0840a4>] _xfs_log_force_lsn+0x394/0x440 [xfs]
 [<000000001d07da14>] xfs_trans_commit+0x224/0x2d0 [xfs]
 [<000000001d040020>] xfs_sync_sb+0x90/0x118 [xfs]
 [<000000001d083c24>] xfs_log_worker+0x94/0x180 [xfs]
 [<000000004019cd88>] process_one_work+0x198/0x458
 [<000000004019dc8c>] worker_thread+0x48c/0x620
 [<00000000401a4824>] kthread+0x144/0x178
[<0000000040144020>] end_fault_vector+0x20/0x28
 [<0000000040145080>] intr_check_sig+0x0/0x3c
 [<000000001c6d8000>] 0x1c6d8000
 [<000000001c6d8000>] 0x1c6d8000
 [<000000001c6d8000>] 0x1c6d8000
 [<000000001c949f5c>] sd_init_command+0x44/0x140 [sd_mod]
 [<000000004035b03c>] blk_recount_segments+0x10c/0x228

INFO: task xgcc:4733 blocked for more than 120 seconds.
      Not tainted 4.0.0-rc4+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
xgcc            D 00000000401440c0     0  4733   4729 0x00000010
Backtrace:
 [<000000004014e4e8>] __schedule+0x248/0x5d0
 [<000000004014e8b8>] schedule+0x48/0xc8
 [<000000004014ed58>] schedule_preempt_disabled+0x20/0x38
 [<0000000040151b70>] __mutex_lock_slowpath+0x180/0x3f0
 [<0000000040151e04>] mutex_lock+0x24/0x48
 [<000000001d05df60>] xfs_reclaim_inodes_ag+0x2b0/0x520 [xfs]
[<000000001d076004>] xfs_fs_free_cached_objects+0x24/0x58 [xfs]
 [<000000004026a79c>] super_cache_scan+0x2fc/0x308
 [<0000000040225f54>] shrink_slab.part.48.constprop.57+0x31c/0x3c8
 [<000000004022927c>] shrink_zone+0xe4/0xe8
 [<0000000040229570>] try_to_free_pages+0x2f0/0x460
 [<000000004021b1b4>] __alloc_pages_nodemask+0x3b4/0x7f0
 [<000000004021b62c>] __get_free_pages+0x3c/0xf0
 [<000000004017cf98>] mm_init.isra.56+0x240/0x308
 [<000000004017d54c>] mm_alloc+0x6c/0x90

INFO: task kthreadd:2 blocked for more than 120 seconds.
      Not tainted 4.0.0-rc4+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
kthreadd        D 00000000401440c0     0     2      0 0x00000000
Backtrace:
 [<000000004014e4e8>] __schedule+0x248/0x5d0
 [<000000004014e8b8>] schedule+0x48/0xc8
 [<000000004014ed58>] schedule_preempt_disabled+0x20/0x38
 [<0000000040151b70>] __mutex_lock_slowpath+0x180/0x3f0
 [<0000000040151e04>] mutex_lock+0x24/0x48
[<000000001d05df60>] xfs_reclaim_inodes_ag+0x2b0/0x520 [xfs]
 [<000000001d05ee80>] xfs_reclaim_inodes_nr+0x60/0xb0 [xfs]
 [<000000001d076004>] xfs_fs_free_cached_objects+0x24/0x58 [xfs]
 [<000000004026a79c>] super_cache_scan+0x2fc/0x308
 [<0000000040225f54>] shrink_slab.part.48.constprop.57+0x31c/0x3c8
 [<000000004022927c>] shrink_zone+0xe4/0xe8
 [<0000000040229570>] try_to_free_pages+0x2f0/0x460
 [<000000004021b1b4>] __alloc_pages_nodemask+0x3b4/0x7f0
 [<000000004021b8d4>] alloc_kmem_pages_node+0x5c/0x70
 [<000000004017dd34>] copy_process.part.62+0x184/0x1c18
 [<0000000040144020>] end_fault_vector+0x20/0x28

INFO: task kswapd1:285 blocked for more than 120 seconds.
      Not tainted 4.0.0-rc4+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
kswapd1         D 00000000401440c0     0   285      2 0x00000000
Backtrace:
 [<000000004014e4e8>] __schedule+0x248/0x5d0
 [<000000004014e8b8>] schedule+0x48/0xc8
 [<000000001d083f40>] _xfs_log_force_lsn+0x230/0x440 [xfs]
[<000000001d08417c>] xfs_log_force_lsn+0x2c/0x90 [xfs]
 [<000000001d068614>] __xfs_iunpin_wait+0xb4/0x1f0 [xfs]
 [<000000001d06d78c>] xfs_iunpin_wait+0x2c/0x190 [xfs]
 [<000000001d05d7fc>] xfs_reclaim_inode+0x9c/0x550 [xfs]
 [<000000001d05de68>] xfs_reclaim_inodes_ag+0x1b8/0x520 [xfs]
 [<000000001d05ee80>] xfs_reclaim_inodes_nr+0x60/0xb0 [xfs]
 [<000000001d076004>] xfs_fs_free_cached_objects+0x24/0x58 [xfs]
 [<000000004026a79c>] super_cache_scan+0x2fc/0x308
 [<0000000040225f54>] shrink_slab.part.48.constprop.57+0x31c/0x3c8
 [<000000004022927c>] shrink_zone+0xe4/0xe8
 [<0000000040229cf4>] kswapd+0x614/0xae0
 [<00000000401a4824>] kthread+0x144/0x178
 [<0000000040144020>] end_fault_vector+0x20/0x28

INFO: task kswapd2:286 blocked for more than 120 seconds.
      Not tainted 4.0.0-rc4+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
kswapd2         D 00000000401440c0     0   286      2 0x00000000
Backtrace:
 [<000000004014e4e8>] __schedule+0x248/0x5d0
[<000000004014e8b8>] schedule+0x48/0xc8
 [<000000004014ed58>] schedule_preempt_disabled+0x20/0x38
 [<0000000040151b70>] __mutex_lock_slowpath+0x180/0x3f0
 [<0000000040151e04>] mutex_lock+0x24/0x48
 [<000000001d05df60>] xfs_reclaim_inodes_ag+0x2b0/0x520 [xfs]
 [<000000001d05ee80>] xfs_reclaim_inodes_nr+0x60/0xb0 [xfs]
 [<000000001d076004>] xfs_fs_free_cached_objects+0x24/0x58 [xfs]
 [<000000004026a79c>] super_cache_scan+0x2fc/0x308
 [<0000000040225f54>] shrink_slab.part.48.constprop.57+0x31c/0x3c8
 [<000000004022927c>] shrink_zone+0xe4/0xe8
 [<0000000040229cf4>] kswapd+0x614/0xae0
 [<00000000401a4824>] kthread+0x144/0x178
 [<0000000040144020>] end_fault_vector+0x20/0x28
 [<00000000402136d8>] mempool_alloc_slab+0x28/0x40
 [<0000000040213974>] mempool_alloc+0xa4/0x208

INFO: task postgres:3006 blocked for more than 120 seconds.
      Not tainted 4.0.0-rc4+ #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this =
message.
postgres        D 00000000401440c0     0  3006      1 0x00000010
Backtrace:
 [<000000004014e4e8>] __schedule+0x248/0x5d0
 [<000000004014e8b8>] schedule+0x48/0xc8
 [<000000004014ed58>] schedule_preempt_disabled+0x20/0x38
 [<0000000040151b70>] __mutex_lock_slowpath+0x180/0x3f0
 [<0000000040151e04>] mutex_lock+0x24/0x48
 [<000000001d05df60>] xfs_reclaim_inodes_ag+0x2b0/0x520 [xfs]
 [<000000001d05ee80>] xfs_reclaim_inodes_nr+0x60/0xb0 [xfs]
 [<000000001d076004>] xfs_fs_free_cached_objects+0x24/0x58 [xfs]
 [<000000004026a79c>] super_cache_scan+0x2fc/0x308
 [<0000000040225f54>] shrink_slab.part.48.constprop.57+0x31c/0x3c8
 [<000000004022927c>] shrink_zone+0xe4/0xe8
 [<0000000040229570>] try_to_free_pages+0x2f0/0x460
 [<000000004021b1b4>] __alloc_pages_nodemask+0x3b4/0x7f0
 [<000000004021b8d4>] alloc_kmem_pages_node+0x5c/0x70
 [<000000004017dd34>] copy_process.part.62+0x184/0x1c18
 [<0000000040192474>] sigprocmask+0x74/0xb0


--Apple-Mail-3--153777285--

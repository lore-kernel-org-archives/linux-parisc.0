From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.8.1-pa7 (some profile data)
Date: Tue, 24 Aug 2004 18:26:52 +0200
Message-ID: <412135A800004CB3@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
To: parisc-linux@parisc-linux.org
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

Hi pa,

I just get the model that Randolph did to get some profile data
(unfortunately, I didn't reach to obtain a 4way system for the moment :(
)

i ran 'readprofile' on a 2.6.8.1-pa7 SMP kernel (N4000, 64-bit, 2way 550M=
hz)
build with profile option and booted with profile=3D2
the results are from
readprofile | sort -rn -k3 | head -30
and the counters were refreshed between test with "readprofile -r".


1) 'make clean; make -j4 vmlinux' on a 2.6.8.1-pa7 kernel tree:
 58253 cpu_idle                                 661.9659
 16622 flush_user_dcache_range_asm              461.7222
 16455 flush_user_icache_range_asm              457.0833
 35995 flush_kernel_icache_page                 359.9500
  3372 $lctu_done                               210.7500
  9650 machine_restart                          150.7812
 16458 __clear_user_page_asm                    146.9464
  1602 $lcfu_done                               133.5000
  1520 $lctu_loop                               126.6667
 41743 established_get_first                     86.9646
  9449 copy_user_page_asm                        62.1645
  1450 flush_data_cache_local                    36.2500
  3576 purge_kernel_dcache_page                  35.7600
  2567 strncpy                                   35.6528
 21036 established_get_next                      35.5338
  3495 flush_kernel_dcache_page                  34.9500
   226 $lslen_done                               28.2500
   443 $lclu_done                                27.6875
  2041 find_vma_prev                             19.6250
  1227 memcpy                                    19.1719
   195 $lcfu_loop                                16.2500
   153 $lslen_loop                               12.7500
    77 syscall_check_resched                      9.6250
   136 $lsfu_loop                                 8.5000
   289 intr_return                                8.0278
  5730 kallsyms_lookup                            7.8709
   746 flush_user_dcache_page                     7.4600
  1388 memset                                     6.9400
  1724 find_get_page                              6.5303
   698 clear_user_page_asm                        5.8167

2) from another machine on the same subnet, scp the whole glibc tree
    as a single tar.bz2 file:
 57213 cpu_idle                                 650.1477
  9409 machine_restart                          147.0156
   323 $lcfu_done                                26.9167
   211 $lctu_done                                13.1875
  2125 established_get_first                      4.4271
   114 flush_user_dcache_range_asm                3.1667
   113 flush_user_icache_range_asm                3.1389
    36 $lctu_loop                                 3.0000
   166 strncpy                                    2.3056
  1243 established_get_next                       2.0997
    19 $lcfu_loop                                 1.5833
   288 kallsyms_lookup                            0.3956
    32 sock_poll                                  0.3636
   114 finish_task_switch                         0.2415
    23 flush_kernel_icache_page                   0.2300
    36 seq_printf                                 0.2250
   179 $$divoI                                    0.1598
     3 syscall_exit                               0.1500
     8 __umoddi3                                  0.1429
    18 kmem_cache_alloc                           0.1250
     1 syscall_check_resched                      0.1250
   110 number                                     0.1228
    19 __wake_up                                  0.1187
     5 __udivdi3                                  0.1042
    13 add_wait_queue                             0.1016
    25 fget                                       0.1008
    18 __kmalloc                                  0.0900
    16 kmem_cache_free                            0.0833
     4 sched_clock                                0.0833
    16 memset                                     0.0800

3) cp -r glibc glibc.bak; sync (the copy on a symple disk slice: no lvm,
no raid, ...)
138222 cpu_idle                                 1570.7045
 22716 machine_restart                          354.9375
   967 $lcfu_done                                80.5833
   746 $lctu_done                                46.6250
   392 $lctu_loop                                32.6667
  5602 established_get_first                     11.6708
   238 flush_user_icache_range_asm                6.6111
   223 flush_user_dcache_range_asm                6.1944
  2821 established_get_next                       4.7652
   280 strncpy                                    3.8889
    44 $lcfu_loop                                 3.6667
   108 memscan                                    1.9286
    26 $lsfu_loop                                 1.6250
    95 memcpy                                     1.4844
   294 memset                                     1.4700
     4 $lsfu_done                                 1.0000
   137 kmem_cache_alloc                           0.9514
   623 kallsyms_lookup                            0.8558
   109 kmem_cache_free                            0.5677
   194 find_get_pages_tag                         0.5389
     4 syscall_check_resched                      0.5000
   525 $$divoI                                    0.4688
    28 memcmp                                     0.4375
    69 seq_printf                                 0.4313
    18 __udivdi3                                  0.3750
   329 number                                     0.3672
     7 syscall_exit                               0.3500
   153 finish_task_switch                         0.3242
    15 strlen                                     0.3125
    38 __getblk                                   0.2969

(isn't there too much machine_restart, no clue for the moment need to stu=
dy
more ;) )

Hope this could be intereting
    Joel




-------------------------------------------------------------------------=
--
Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le moment de fai=
re
le pas!
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

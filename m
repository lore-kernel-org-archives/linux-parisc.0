Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id C04794829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Apr 2003 23:26:43 -0600 (MDT)
Date: Sun, 13 Apr 2003 22:22:48 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030414052248.GG25257@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] some 2.5 kernel profile data
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

i ran 'readprofile' on a 2.5.67-pa3 UP kernel (a500, 64-bit) with
several different workloads. here are the numbers if anyone is
interested.

the results are from 
readprofile -m System.map -d vmlinux | sort -rn -k3 | head -30
Each data set is collected from a freshly booted kernel. 

1) 'make clean vmlinux' on a 2.5 kernel tree:

1040421 cpu_idle                       14450.2917
  7616 fdsync                         380.8000
 32303 flush_kernel_icache_page       323.0300
  9059 flush_user_dcache_range_asm    251.6389
  8762 flush_user_icache_range_asm    243.3889
  1066 fioneloop                      133.2500
 10400 clear_user_page_asm             92.8571
  3133 flush_kernel_dcache_page        31.3300
  2457 purge_kernel_dcache_page        24.5700
  2725 copy_user_page_asm              17.9276
   228 fimanyloop                      11.4000
  2583 handle_interruption              6.9435
  1215 pdc_tod_read                     6.6033
    88 syscall_check_bh                 5.5000
   222 .L1123                           4.6250
   209 flush_all_caches                 3.7321
1128570 total                            3.6959 0.83%
    36 intr_check_sig                   3.0000
    82 syscall_exit                     2.0500
    37 intr_return                      1.8500
   436 syscall_restore                  1.7581
    20 fisync                           1.6667
   379 parisc_acctyp                    1.3536
   546 intr_restore                     1.2080
  1024 do_page_fault                    1.1963
    99 __wake_up                        1.0312
    11 intr_check_resched               0.9167
     7 syscall_check_sig                0.8750
    65 .L1073                           0.8553
   176 update_mmu_cache                 0.6286

2) cp -r glibc glibc.bak; sync
   glibc is a glibc source tree with ~24k files (~726MB)
   (Note that this is on a s/w raid0 partition....)

409712 cpu_idle                       5690.4444
   770 fdsync                          38.5000
   985 flush_user_icache_range_asm     27.3611
   979 flush_user_dcache_range_asm     27.1944
  1788 flush_kernel_icache_page        17.8800
    99 fioneloop                       12.3750
   136 intr_return                      6.8000
   996 pdc_tod_read                     5.4130
   341 copy_user_page_asm               2.2434
   179 flush_kernel_dcache_page         1.7900
    32 fimanyloop                       1.6000
417412 total                            1.3670 0.29%
    13 syscall_check_bh                 0.8125
    67 __wake_up                        0.6979
   165 syscall_restore                  0.6653
    25 syscall_exit                     0.6250
   228 pdc_iodc_putc                    0.6064
    54 current_kernel_time              0.5192
    58 clear_user_page_asm              0.5179
     3 syscall_check_resched            0.3750
   113 handle_interruption              0.3038
    11 remove_wait_queue                0.2750
    24 prepare_to_wait                  0.2500
    27 io_schedule                      0.2109
     5 scheduling_functions_start_here   0.2083
     2 intr_check_sig                   0.1667
   158 schedule                         0.1274
     1 L21                             0.1250
    29 add_timer                        0.1133
    18 sys_adjtimex                     0.1071

3) from another machine on the same subnet, ftp the whole glibc tree 
   as a single 13MB tar file. (@ 1.11MB/s)

138489 cpu_idle                       1923.4583
   743 fdsync                          37.1500
   980 flush_user_icache_range_asm     27.2222
   980 flush_user_dcache_range_asm     27.2222
  2000 flush_kernel_icache_page        20.0000
    93 fioneloop                       11.6250
  1009 pdc_tod_read                     5.4837
   359 copy_user_page_asm               2.3618
   169 flush_kernel_dcache_page         1.6900
    22 fimanyloop                       1.1000
   223 pdc_iodc_putc                    0.5931
    66 clear_user_page_asm              0.5893
145635 total                            0.4769 0.23%
     3 fisync                           0.2500
    83 handle_interruption              0.2231
     8 syscall_exit                     0.2000
    43 syscall_restore                  0.1734
     3 intr_return                      0.1500
     7 add_wait_queue                   0.1250
     5 remove_wait_queue                0.1250
     2 syscall_check_bh                 0.1250
     1 syscall_check_resched            0.1250
     6 flush_cache_all_local            0.1071
     9 purge_kernel_dcache_page         0.0900
    18 pdc_pat_cell_module              0.0833
     1 intr_check_sig                   0.0833
     5 .L1073                           0.0658
    25 intr_restore                     0.0553
     5 __wake_up                        0.0521
     2 .L1123                           0.0417

Hope someone find these useful and can help make the kernel more
optimized.. :-) I'm not quite sure why there are so many cache
flushes.... 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

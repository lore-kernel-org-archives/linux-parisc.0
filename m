From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ext2 vs ext3 on hppa
Date: Fri, 11 Feb 2005 09:53:22 -0700
Message-ID: <20050211165322.GA8835@colo.lackof.org>
References: <20050211071629.GA32318@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050211071629.GA32318@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Feb 11, 2005 at 12:16:29AM -0700, Grant Grundler wrote:
> But not for "tar". I can't find the data I collect before. :^(

I found them:
-rw-r--r--  1 root root  33517 Jan  9 21:27 prof-2.6.10-pa6-01
-rw-r--r--  1 root root  23770 Jan 16 19:46 prof-2.6.10-pa6-02

and posted both on
	http://www.parisc-linux.org/~grundler/prof-a500-65/

> ISTR the culprit in ext3 was the bitmap search using atomic ops.
> On parisc, atomic ops are terrible since it requires a spinlock/op/unlock
> sequence.

Yeah, this seems to be right.
I gather this is only an issue for SMP kernels.

grundler <506>sort -rnk 3 prof-2.6.10-pa6-01
 55063 _spin_lock                               1376.5750
 42958 ext3_test_allocatable                     97.6318
  5974 rb_next                                   57.4423
  5541 flush_kernel_icache_page                  55.4100
   800 fdsync                                    40.0000
  1279 flush_user_icache_range_asm               35.5278
 35341 bitmap_search_next_usable_block           30.6780
  1328 _spin_lock_irqsave                        27.6667
  1470 machine_restart                           22.9688
   747 flush_user_dcache_range_asm               20.7500
  1043 cpu_idle                                  14.4861
   135 fisync                                     8.4375
   647 __clear_user_page_asm                      5.7768
...


Sorry - I didn't note exactly which workload the above represented.

And I suspect -02 data is with willy's vma_prev patch applied
that he proposed here:
http://lists.parisc-linux.org/pipermail/parisc-linux/2004-November/025210.html

grundler <509>sort -rnk 3 prof-2.6.10-pa6-02
 61105 _spin_lock                               1527.6250
 43040 ext3_test_allocatable                     97.8182
  4902 rb_next                                   47.1346
 35646 bitmap_search_next_usable_block           30.9427
  2217 flush_kernel_icache_page                  22.1700
   969 _spin_lock_irqsave                        20.1875
  1055 machine_restart                           16.4844
   764 cpu_idle                                  10.6111
   157 fdsync                                     7.8500
   270 flush_user_icache_range_asm                7.5000
   209 flush_user_dcache_range_asm                5.8056
...

hth, 
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

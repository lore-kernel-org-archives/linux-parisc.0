From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] 2.6.10-rc1-pa11 profile data
Date: Thu, 11 Nov 2004 00:11:54 -0800
Message-ID: <20041111081154.GR15714@tausq.org>
References: <20041111075431.GB9768@colo.lackof.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041111075431.GB9768@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I've collect two profiles for -64SMP and will collect
> some UP profiles tomorrow. profiles so far are measuring
> a full kernel build. I expect I'll do the same for -64UP
> kernels too.

hmm.. interesting. top consumers are (with idle loop functions removed)

 40646 flush_kernel_icache_page                 406.4600
  7364 fdsync                                   368.2000
 10567 flush_user_dcache_range_asm              293.5278
 10387 flush_user_icache_range_asm              288.5278
 21409 __clear_user_page_asm                    191.1518
  5356 _spin_lock_irqsave                       111.5833
  1768 fisync                                   110.5000
  1928 _spin_lock                                48.2000
  4255 purge_kernel_dcache_page                  42.5500
   339 $lclu_done                                42.3750
  4089 flush_kernel_dcache_page                  40.8900
  5053 copy_user_page_asm                        33.2434
   569 _write_unlock_irq                         17.7812
   422 _spin_unlock                              17.5833
  1567 find_vma_prev                             16.3229
   181 $lslen_loop                               15.0833
    96 $lslen_done                               12.0000
   996 _write_trylock                            11.3182
   137 $lsfu_loop                                 8.5625
   748 flush_user_dcache_page                     7.4800

we really need to do better at cache flushing..... anybody have any
ideas? :)

but looking at the other ones:
- __clear_user_page_asm can be optimized for 64-bit by writing 8 bytes
  at a time instead of 4
- _spin_lock* needs investigation to see if we have some bad locks
  someplace. lockmeter anybody?
- *lclu* can be rewritten to do better than 1-byte at a time
- copy_user_page_asm can be sped up slightly by using pa_memcpy, but not
  much when i tried last time
- *lslen* can also probably be written in a smarter way... 

i suspect some areas for further investigation are:
- can we do tlb_flush_mm() in a smarter way for SMP?
- can we improve kernel entry time for interrupts (and syscalls) by
  being smarter about what we save on the stack? (i.e. only callee-save
  registers and not all the registers?)

volunteers? :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

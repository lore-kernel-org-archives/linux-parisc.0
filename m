From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.10-rc1-pa11 profile data
Date: Thu, 11 Nov 2004 18:23:56 +0000
Message-ID: <4193AE3C.9020509@tiscali.be>
References: <20041111075431.GB9768@colo.lackof.org>
	<20041111081154.GR15714@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041111081154.GR15714@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Randolph Chung wrote:
>>I've collect two profiles for -64SMP and will collect
>>some UP profiles tomorrow. profiles so far are measuring
>>a full kernel build. I expect I'll do the same for -64UP
>>kernels too.
> 
> 
> hmm.. interesting. top consumers are (with idle loop functions removed)
> 
>  40646 flush_kernel_icache_page                 406.4600
>   7364 fdsync                                   368.2000
>  10567 flush_user_dcache_range_asm              293.5278
>  10387 flush_user_icache_range_asm              288.5278
mmm (may be another stupid remarks but) I noticed that:
     748 flush_user_dcache_page                     7.4800
    648 flush_user_icache_page                     6.4800
   4255 purge_kernel_dcache_page                  42.5500
  10567 flush_user_dcache_range_asm              293.5278
  10387 flush_user_icache_range_asm              288.5278
  40646 flush_kernel_icache_page                 406.4600
     10 flush_kernel_icache_range_asm              0.0862

i.e. flush_kernel_[di]cache_page is few used versus flush_kernel_[di]cache_range_asm while flush_user_[di]cache_range_asm is more 
used then flush_user_[di]cache_page.

Isn't it strange?

[...]

mmm also:
  49576 machine_restart                          774.6250

??
(I don't understand because stat were cleaned "readprofile -r" before the build)

> 
> we really need to do better at cache flushing..... anybody have any
> ideas? :)
> 
> but looking at the other ones:
> - __clear_user_page_asm can be optimized for 64-bit by writing 8 bytes
>   at a time instead of 4
> - _spin_lock* needs investigation to see if we have some bad locks
>   someplace. lockmeter anybody?
> - *lclu* can be rewritten to do better than 1-byte at a time
> - copy_user_page_asm can be sped up slightly by using pa_memcpy, but not
>   much when i tried last time
> - *lslen* can also probably be written in a smarter way... 
> 
> i suspect some areas for further investigation are:
> - can we do tlb_flush_mm() in a smarter way for SMP?
> - can we improve kernel entry time for interrupts (and syscalls) by
>   being smarter about what we save on the stack? (i.e. only callee-save
>   registers and not all the registers?)
> 
> volunteers? :)
> 
I couldn't realy help more but I will take a look in more details from time to time :)

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Improving performance of munmap
Date: Thu, 7 Oct 2004 22:03:43 -0400
Message-ID: <20041008020343.GN24430@baldric.uwo.ca>
References: <20041007230232.GF14151@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041007230232.GF14151@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Oct 07, 2004 at 04:02:32PM -0700, Randolph Chung wrote:
> Hi all,
> 
> On a 2.6 SMP kernel, munmap()ing 16MB currently takes on the order of
> 0.8-0.9 seconds on a 440MHz machine. on a UP machine it takes about 5ms.
> 
> profiling shows that we are spending a lot of time flushing caches:
> 
> tausq@ios:~/parisc/linux-2.6$ sort -nr -k3 ~/test/mmap/after |head
>  48586 cpu_idle                                 759.1562
>  37906 machine_restart                          592.2812
>  10951 flush_user_icache_range_asm              304.1944
>  10946 flush_user_dcache_range_asm              304.0556
>    129 flush_kernel_icache_page                   1.2900
>     29 _spin_unlock_bh                            0.6042
>      9 fdsync                                     0.4500
>     10 _spin_unlock_irq                           0.4167
> 
> i believe this is related to the way we implement flush_tlb_mm(). on SMP
> we currently flush the entire tlb, instead of just invaliding the
> process context. this is needed to get the correct behavior if a
> multithreaded app is simultaneously running on >1 CPUs. James had
> suggested previously that we might be able to do something smarter, such
> as sending an ipi to the other CPU to switch the context. 
> 
> would anybody like to look into this problem, or suggest some ways to
> tackle this?

Is munmap() speed really a big issue? Does userland see the benefits of
a faster flush_tlb_mm()?

Perhaps if you call dlclose() *a lot* you might notice.

Or if you create and destroy threads really quickly.

Aside from that, who else in userspace is a big munmap caller?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

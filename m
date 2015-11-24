From: Helge Deller <deller@gmx.de>
Subject: Re: [GIT PULL] parisc huge page support for v4.4
Date: Tue, 24 Nov 2015 16:58:37 +0100
Message-ID: <5654892D.1030707@gmx.de>
References: <20151122115153.GA28471@p100.box>
 <alpine.LRH.2.02.1511241014280.9586@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1511241014280.9586@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 24.11.2015 16:51, Mikulas Patocka wrote:
> On Sun, 22 Nov 2015, Helge Deller wrote:
>> please pull the latest patches for the parisc architecture for kernel v4.4 from:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.4-2
>>
>> This patchset adds Huge Page and HUGETLBFS support for parisc.
>>
>> Thanks,
>> Helge
>>
>> ----------------------------------------------------------------
>> Helge Deller (9):
>>       parisc: Fix wrong comment regarding first pmd entry flags
>>       parisc: Drop definition of start_thread_som for HP-UX SOM binaries
>>       parisc: Drop unused MADV_xxxK_PAGES flags from asm/mman.h
>>       parisc: Add defines for Huge page support
>>       parisc: Initialize the fault vector earlier in the boot process.
>>       parisc: Increase initial kernel mapping to 32MB on 64bit kernel
>>       parisc: Use long branch to do_syscall_trace_exit
>>       parisc: Add Huge Page and HUGETLBFS support
>>       parisc: Map kernel text and data on huge pages
>>
>>  arch/parisc/Kconfig                 |   3 +
>>  arch/parisc/include/asm/hugetlb.h   |  85 +++++++++++++++++++
>>  arch/parisc/include/asm/page.h      |  13 ++-
>>  arch/parisc/include/asm/pgalloc.h   |   2 +-
>>  arch/parisc/include/asm/pgtable.h   |  26 +++++-
>>  arch/parisc/include/asm/processor.h |  27 ------
>>  arch/parisc/include/uapi/asm/mman.h |  10 ---
>>  arch/parisc/kernel/asm-offsets.c    |   8 ++
>>  arch/parisc/kernel/entry.S          |  56 ++++++++-----
>>  arch/parisc/kernel/head.S           |   4 +-
>>  arch/parisc/kernel/setup.c          |  14 +++-
>>  arch/parisc/kernel/syscall.S        |   4 +-
>>  arch/parisc/kernel/traps.c          |  35 ++++----
>>  arch/parisc/kernel/vmlinux.lds.S    |   9 +-
>>  arch/parisc/mm/Makefile             |   1 +
>>  arch/parisc/mm/hugetlbpage.c        | 161 ++++++++++++++++++++++++++++++++++++
>>  arch/parisc/mm/init.c               |  40 ++++-----
>>  17 files changed, 382 insertions(+), 116 deletions(-)
>>  create mode 100644 arch/parisc/include/asm/hugetlb.h
>>  create mode 100644 arch/parisc/mm/hugetlbpage.c
> 
> Hi
> 
> Since the kernel 4.4-rc2 I'm getting frequent boot failures on PA-RISC. 
> When I revert this patchset, the crashes are gone.

> [    3.296666] CPU(s): 4 out of 4 PA8900 (Shortfin) at 1000.000000 MHz online

Hi Mikulas,

Yes, I've seen this as well.
It affects only the PA8900 CPUs, while all PA8500-PA8700 machines seem to work fine.
I do have a temporary 3-line patch to avoid the crashes which I'll push to my tree shortly.
I'm still investigating why it only affects the PA8900 CPUs, but I assume
it's related to the cache aliasing of those CPUs.
I'll keep you updated.

Helge

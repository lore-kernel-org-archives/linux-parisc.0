From: David Howells <dhowells@redhat.com>
Subject: [parisc-linux] Re: [patch] remove MAX_ARG_PAGES
Date: Tue, 02 Jan 2007 18:18:48 +0000
Message-ID: <23996.1167761928__15132.5606079356$1416624246$gmane$org@redhat.com>
References: <20061229200357.GA5940@elte.hu>
	<65dd6fd50610101705t3db93a72sc0847cd120aa05d3@mail.gmail.com>
	<1160572460.2006.79.camel@taijtu>
	<65dd6fd50610111448q7ff210e1nb5f14917c311c8d4@mail.gmail.com>
	<65dd6fd50610241048h24af39d9ob49c3816dfe1ca64@mail.gmail.com>
Cc: Andrew Morton <akpm@osdl.org>,
 linux-arch@vger.kernel.org,
 Peter Zijlstra <a.p.zijlstra@chello.nl>,
 Andi Kleen <ak@muc.de>,
 linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org,
 Linus Torvalds <torvalds@osdl.org>,
 Ollie Wild <aaw@google.com>,
 parisc-linux@lists.parisc-linux.org,
 Arjan van de Ven <arjan@infradead.org>
To: Ingo Molnar <mingo@elte.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061229200357.GA5940@elte.hu> 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Ingo Molnar <mingo@elte.hu> wrote:

> FYI, i have forward ported your MAX_ARG_PAGES limit removal patch to 
> 2.6.20-rc2 and have included it in the -rt kernel. It's working great - 
> i can now finally do a "ls -t patches/*.patch" in my patch repository - 
> something i havent been able to do for years ;-)

I get a NULL kernel pointer reference with this patch with FRV in MMU mode.
It's whilst the kernel is attempting to execute init:

(gdb) bt
#0  0xc0063d54 in do_anonymous_page (mm=0xc05c1a04, vma=0xc05c884c, address=3221225457, page_table=0xdc00bffc, pmd=0xc05c6f00, write_access=0) at pgtable.h:525
#1  0xc006468c in __handle_mm_fault (mm=0xbffffff1, vma=0xc05c884c, address=3691036668, write_access=1) at memory.c:2404
#2  0xc0061c18 in get_user_pages (tsk=0xc034eba0, mm=0xc05c1a04, start=3221225457, len=1, write=1, force=0, pages=0xc0353b80, vmas=0x0) at memory.c:1064
#3  0xc0084c7c in copy_strings (argc=0, argv=0xc0388c3c, bprm=0xc0388b88) at exec.c:326
#4  0xc0084dac in copy_strings_kernel (argc=1, argv=0xc05c884c, bprm=0xbffffff1) at exec.c:365
#5  0xc0085f5c in do_execve (filename=0xc0387000 "/sbin/init", argv=0xc026e8c8, envp=0xc026e950, regs=0xc0353bf8) at exec.c:1158
#6  0xc000f55c in sys_execve (name=0x1 <Address 0x1 out of bounds>, argv=0xc026e8c8, envp=0xc026e950) at process.c:263
#7  0xc000e1e0 in __syscall_call () at arch/frv/kernel/entry.S:878
#8  0xc000e1e0 in __syscall_call () at arch/frv/kernel/entry.S:878

The problem appears to be that current->mm is NULL.  It's a bit difficult to
say for sure because gdb or gcc determined that the error is in pgtable.h, but
doesn't seem to have determined which one.

However, looking at the code, I think it must be this:

	static int do_anonymous_page(struct mm_struct *mm, ...)
	{
		...
		update_mmu_cache(vma, address, entry);
		...
	}

But that uses current->mm, which is NULL, via this function:

	[include/asm-frv/pgtable.h]

	/* * preload information about a newly instantiated PTE into the SCR0/SCR1 PGE
	cache */

	static inline void update_mmu_cache(struct vm_area_struct *vma,
					unsigned long address, pte_t pte)
	{
		unsigned long ampr;
		pgd_t *pge = pgd_offset(current->mm, address);
		pud_t *pue = pud_offset(pge, address);
		pmd_t *pme = pmd_offset(pue, address);

		ampr = pme->ste[0] & 0xffffff00;
		ampr |= xAMPRx_L | xAMPRx_SS_16Kb | xAMPRx_S | xAMPRx_C | xAMPRx_V;

		asm volatile("movgs %0,scr0\n"
			     "movgs %0,scr1\n"
			     "movgs %1,dampr4\n"
			     "movgs %1,dampr5\n"
			     :
			     : "r"(address), "r"(ampr)
			     );
	}

This really oughtn't to be called in this situation, I suspect.  I could just
skip the operation if current->mm is NULL, but I'm not sure that that's the
right thing to do.  Maybe I should be using current->active_mm instead.

Everything works fine without the patch.

David
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

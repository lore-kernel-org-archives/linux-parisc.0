From: nick <yocto6@gmail.com>
Subject: FIX MES in init.c
Date: Mon, 22 Sep 2014 15:24:25 -0400
Message-ID: <54207769.2020105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: deller@gmx.de, akpm@linux-foundation.org, himangi774@gmail.com,
	julia.lawall@lip6.fr, mgorman@suse.de,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: jejb@parisc-linux.org
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Greetings James and Other Maintainers of the Parisc Architecture,
I am wondering about two fix mes in init.c and how to fix them
for being const declared into actual variables. I will paste the
parts of the file for your convenience below.
Thanks,
Nick 
---------------------------------------------------------------------------------
static void __init gateway_init(void)
{
	unsigned long linux_gateway_page_addr;
	/* FIXME: This is 'const' in order to trick the compiler
	   into not treating it as DP-relative data. */
	extern void * const linux_gateway_page;

	linux_gateway_page_addr = LINUX_GATEWAY_ADDR & PAGE_MASK;

	/*
	 * Setup Linux Gateway page.
	 *
	 * The Linux gateway page will reside in kernel space (on virtual
	 * page 0), so it doesn't need to be aliased into user space.
	 */

	map_pages(linux_gateway_page_addr, __pa(&linux_gateway_page),
		  PAGE_SIZE, PAGE_GATEWAY, 1);
}

#ifdef CONFIG_HPUX
void
map_hpux_gateway_page(struct task_struct *tsk, struct mm_struct *mm)
{
	pgd_t *pg_dir;
	pmd_t *pmd;
	pte_t *pg_table;
	unsigned long start_pmd;
	unsigned long start_pte;
	unsigned long address;
	unsigned long hpux_gw_page_addr;
	/* FIXME: This is 'const' in order to trick the compiler
	   into not treating it as DP-relative data. */
	extern void * const hpux_gateway_page;

	hpux_gw_page_addr = HPUX_GATEWAY_ADDR & PAGE_MASK;

	/*
	 * Setup HP-UX Gateway page.
	 *
	 * The HP-UX gateway page resides in the user address space,
	 * so it needs to be aliased into each process.
	 */

	pg_dir = pgd_offset(mm,hpux_gw_page_addr);

#if PTRS_PER_PMD == 1
	start_pmd = 0;
#else
	start_pmd = ((hpux_gw_page_addr >> PMD_SHIFT) & (PTRS_PER_PMD - 1));
#endif
	start_pte = ((hpux_gw_page_addr >> PAGE_SHIFT) & (PTRS_PER_PTE - 1));
---------------------------------------------------------------------------------------

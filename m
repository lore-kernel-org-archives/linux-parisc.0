From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] "mark rodata section read only" patches for parisc
Date: Fri, 13 Jan 2006 21:27:21 +0100
Message-ID: <200601132127.22013.deller@gmx.de>
References: <20060113202106.E971149400A@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060113202106.E971149400A@palinux.hppa>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I've just committed a parisc version for the rodata section protection.
Nevertheless, since I'm not a real Linux Kernel memory expert, I could help on this part which is now in arch/parisc/mm/init.c:

	unsigned long addr = (unsigned long)&__start_rodata;

        for (; addr < (unsigned long)&__end_rodata; addr += PAGE_SIZE)
                change_page_attr(virt_to_page(addr), 1, PAGE_KERNEL_RO);

change_page_attr() is a i386 function to mark the page with special access rights, in this case "PAGE_KERNEL_RO".
Maybe someone here can tell me how this can be realized on parisc ?

Helge

On Friday 13 January 2006 21:21, Helge Deller wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	deller@cvs.parisc-linux.org	2006-01-13 13:21:06
> 
> Modified files:
> 	arch/parisc    : Kconfig.debug 
> 	arch/parisc/hpux: entry_hpux.S 
> 	arch/parisc/kernel: syscall.S 
> 	arch/parisc/mm : init.c 
> 	include/asm-parisc: cacheflush.h 
> 
> Log message:
> 	add the parisc version of the "mark rodata section read only" patches,
> 	some code for actually mark the pages RO still needs to be ADDED (see FIXME in arch/parisc/mm/init.c).
> 	
> 	copied from code from and signed off by Arjan van de Ven <arjan@infradead.org>, Ingo Molnar <mingo@elte.hu>,
> 	Andi Kleen <ak@muc.de>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>
> 	
> 	parisc-version is
> 	Signed-off-by: Helge Deller <deller@gmx.de>
> 
> Patches:
> http://cvs.parisc-linux.org/linux-2.6/arch/parisc/Kconfig.debug.diff?cvsroot=&r1=1.2&r2=1.3
> http://cvs.parisc-linux.org/linux-2.6/arch/parisc/hpux/entry_hpux.S.diff?cvsroot=&r1=1.3&r2=1.4
> http://cvs.parisc-linux.org/linux-2.6/arch/parisc/kernel/syscall.S.diff?cvsroot=&r1=1.21&r2=1.22
> http://cvs.parisc-linux.org/linux-2.6/arch/parisc/mm/init.c.diff?cvsroot=&r1=1.26&r2=1.27
> http://cvs.parisc-linux.org/linux-2.6/include/asm-parisc/cacheflush.h.diff?cvsroot=&r1=1.19&r2=1.20
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

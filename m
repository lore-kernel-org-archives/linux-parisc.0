Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PATCH: flush_icache_page() and flush_icache_range() 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Wed, 29 May 2002 00:40:24 BST." <20020528234023.GF3471@sleepie.demon.co.uk>
References: <20020528234023.GF3471@sleepie.demon.co.uk> 
Date: Wed, 29 May 2002 00:30:43 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020529063043.A9FD4482A@dsl2.external.hp.com>
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

Richard Hirst wrote:
> This is because it plants breakpoints,
> but those breakpoints sit in the data cache and don't get flushed
> through to be visible as code in time. 

Richard,
Someone put code in arch/parisc/mm/init.c as per Alan Cox's suggestion
to trap excessive __init's. But it didn't flush dcache or icache.
Can you glob/rework the following patch with yours?

(I'm very guilty of being tired and not checking for compile errors
or warnings...way past my bedtime again...the code does compile
and link though)

thanks,
grant

Index: arch/parisc/mm/init.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/mm/init.c,v
retrieving revision 1.48
diff -u -p -r1.48 init.c
--- arch/parisc/mm/init.c	2002/04/15 23:49:12	1.48
+++ arch/parisc/mm/init.c	2002/05/29 06:14:16
@@ -381,10 +381,23 @@ void free_initmem(void)
 	printk(KERN_INFO "Freeing unused kernel memory: ");
 
 #if 1
-	cli();	/* disable all interrupts */
-	memset(&__init_begin, 0xff, 
+	/* Attempt to catch anyone trying to execute code here
+	 * by filling the page with BRK insns.
+	 * 
+	 * If we disable interrupts for all CPUs, then IPI stops working.
+	 * Kinda breaks the global cache flushing.
+	 */
+	local_irq_disable();
+
+	memset(&__init_begin, 0x00, 
 		(unsigned long)&__init_end - (unsigned long)&__init_begin);
-	sti();	/* re-enable all interrupts */
+
+	flush_data_cache();
+	asm volatile("sync" : : );
+	flush_icache_range(&__init_begin, &__init_end);
+	asm volatile("sync" : : );
+
+	local_irq_enable();
 #endif
 	
 	addr = (unsigned long)(&__init_begin);

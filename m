Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 14 Mar 2003 09:23:42 -0700
To: Jochen Friedrich <jochen@scram.de>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030314162342.GA24555@dsl2.external.hp.com>
References: <20030309144225.O3865@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.44.0303141351000.23830-100000@gfrw1044.bocc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0303141351000.23830-100000@gfrw1044.bocc.de>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Fri, Mar 14, 2003 at 02:04:17PM +0100, Jochen Friedrich wrote:
> since the patch was included in CVS, several modules fail to load with
> unresolved external __flush_dcache_page.

yes...I just ran into the same problem when playing around with
the latest qlogic (qla2xxx v6.0.4) driver.
Appended is a more complete one which I'm not quite done with
yet either. Hopefully I can build all the flavors and commit this weekend.

grant

Index: arch/parisc/kernel/parisc_ksyms.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/parisc_ksyms.c,v
retrieving revision 1.44
diff -u -p -r1.44 parisc_ksyms.c
--- arch/parisc/kernel/parisc_ksyms.c   11 Jan 2003 20:10:46 -0000
1.44
+++ arch/parisc/kernel/parisc_ksyms.c   14 Mar 2003 16:16:47 -0000
@@ -127,7 +127,15 @@ EXPORT_SYMBOL(outsl);
 #include <asm/cache.h>
 EXPORT_SYMBOL(flush_kernel_dcache_range_asm);
 EXPORT_SYMBOL(flush_kernel_dcache_page);
-EXPORT_SYMBOL(flush_all_caches);
+
+/* asm/pgalloc.h doesn't include all it's dependencies */
+extern void __flush_dcache_page(struct page *page);
+EXPORT_SYMBOL(__flush_dcache_page);
+
+#ifndef CONFIG_SMP
+extern void flush_cache_all_local(void);
+EXPORT_SYMBOL(flush_cache_all_local);
+#endif
 
 #include <asm/unistd.h>
 extern long sys_open(const char *, int, int);

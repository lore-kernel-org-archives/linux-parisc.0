Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB768483E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Aug 2003 10:25:53 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h7NGPqI32277
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Aug 2003 12:25:52 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed; boundary="=-PE2Uwl0LkbJxW+65VgYL"
Date: 23 Aug 2003 11:25:52 -0500
Message-Id: <1061655953.1992.104.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Proposed changes to flush_dcache_page to fix our shared ro mapping
 problem
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

--=-PE2Uwl0LkbJxW+65VgYL
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The attached should do it

(plus the fix to preserve the VM_MAYSHARE flag on remap).

I've verified that this fixes the glibc tst-mmap-eofsync test.

James


--=-PE2Uwl0LkbJxW+65VgYL
Content-Disposition: inline; filename=tmp.diff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=tmp.diff; charset=ISO-8859-1

=3D=3D=3D=3D=3D arch/parisc/kernel/cache.c 1.4 vs edited =3D=3D=3D=3D=3D
--- 1.4/arch/parisc/kernel/cache.c	Sat Mar  8 14:01:30 2003
+++ edited/arch/parisc/kernel/cache.c	Sat Aug 23 11:22:22 2003
@@ -232,7 +232,8 @@
=20
 	if (!page->mapping)
 		return;
-
+	/* check shared list first if it's not empty...it's usually
+	 * the shortest */
 	list_for_each(l, &page->mapping->i_mmap_shared) {
 		struct vm_area_struct *mpnt;
 		unsigned long off;
@@ -243,6 +244,33 @@
 		 * If this VMA is not in our MM, we can ignore it.
 		 */
 		if (mpnt->vm_mm !=3D mm)
+			continue;
+
+		if (page->index < mpnt->vm_pgoff)
+			continue;
+
+		off =3D page->index - mpnt->vm_pgoff;
+		if (off >=3D (mpnt->vm_end - mpnt->vm_start) >> PAGE_SHIFT)
+			continue;
+
+		flush_cache_page(mpnt, mpnt->vm_start + (off << PAGE_SHIFT));
+
+		/* All user shared mappings should be equivalently mapped,
+		 * so once we've flushed one we should be ok
+		 */
+		return;
+	}
+
+	/* then check private mapping list for read only shared mappings
+	 * which are flagged by VM_MAYSHARE */
+	list_for_each(l, &page->mapping->i_mmap) {
+		struct vm_area_struct *mpnt;
+		unsigned long off;
+
+		mpnt =3D list_entry(l, struct vm_area_struct, shared);
+
+
+		if (mpnt->vm_mm !=3D mm || !(mpnt->vm_flags & VM_MAYSHARE))
 			continue;
=20
 		if (page->index < mpnt->vm_pgoff)

--=-PE2Uwl0LkbJxW+65VgYL--

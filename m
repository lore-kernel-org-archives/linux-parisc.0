Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53028485C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 08:40:41 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h7MEecI28096;
	Fri, 22 Aug 2003 10:40:38 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
Cc: davem@redhat.com, drepper@redhat.com
Content-Type: multipart/mixed; boundary="=-lmHKO1hPltD8R1GkCOtr"
Date: 22 Aug 2003 09:40:37 -0500
Message-Id: <1061563239.2090.25.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Problems with kernel mmap (failing tst-mmap-eofsync in glibc on
 parisc)
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

--=-lmHKO1hPltD8R1GkCOtr
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This test essentially opens a file (via open(2)), writes something,
opens it via a mmaped file object *read only* (via fopen(...,"rm)) reads
what was writtent, writes some more and reads it via the mmaped file
object.

This last read fails to get the data on parisc.  The problem is that our
CPU cache is virtually indexed, and the page the write is storing the
data to (in the buffer cache) and the page it is mmapped to have the
same physical, but different virtual addresses.  We need the write() to
trigger a cache update via flush_dcache_page to get the virtually
indexed cache in sync.

The reason this doesn't happen is because the mapping is not on the
mmap_shared list that flush_dcache_page() updates.

And the reason it's not on the correct list is because there's a check
in mm/mmap.c:do_mmap_pgoff() that drops the VM_SHARED flag on the
mapping if the file wasn't opened for writing (about line 541).

Semantically, it seems that whether the mmaping sees a write or not on a
different descriptor shouldn't depend on whether the underlying file was
opened read only or read write, so I think the glibc test is correct,
and we should keep the VM_SHARED flag even if the underlying file was
opened read only.

The patch is attached (and makes the test pass on parisc).

Comments?

James


--=-lmHKO1hPltD8R1GkCOtr
Content-Disposition: attachment; filename=tmp.diff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=tmp.diff; charset=ISO-8859-1

=3D=3D=3D=3D=3D mm/mmap.c 1.89 vs edited =3D=3D=3D=3D=3D
--- 1.89/mm/mmap.c	Thu Jul 10 21:46:52 2003
+++ edited/mm/mmap.c	Fri Aug 22 09:36:32 2003
@@ -539,7 +539,7 @@
=20
 			vm_flags |=3D VM_SHARED | VM_MAYSHARE;
 			if (!(file->f_mode & FMODE_WRITE))
-				vm_flags &=3D ~(VM_MAYWRITE | VM_SHARED);
+				vm_flags &=3D ~VM_MAYWRITE;
=20
 			/* fall through */
 		case MAP_PRIVATE:

--=-lmHKO1hPltD8R1GkCOtr--

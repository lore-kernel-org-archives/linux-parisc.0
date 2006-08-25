From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] update mman.h in latest glibc cvs
Date: Fri, 25 Aug 2006 00:50:34 -0400
Message-ID: <200608250050.34940.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_aGo7E0945UorO7p"
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_aGo7E0945UorO7p
Content-Type: multipart/signed; boundary="nextPart1482137.g61oAZcn8k";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1482137.g61oAZcn8k
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Carlos: for future hppa patches, would you prefer i send to libc-ports or t=
o=20
the parisc list ?

this patch is against latest mman.h in the ports cvs ... the one in the par=
isc=20
cvs is a little bit more outdated
=2Dmike

--nextPart1482137.g61oAZcn8k
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUARO6BmkFjO5/oN/WBAQJTxRAAiPIXi+GmFr1xxCHkDffvtMgpvq7Q7F1X
gt3Kel7L9dZkOQ7V/ZFepcWGtZB/h6ck1FuGbwGF4cHzRi305MJKIBBZLRzbhG2V
5rAAsdzQZpH8Om7OekmfJsqBIAwGqY28DNeZHOo/bTvINpmiH2OUJlYL3EUG71EA
HXjgzlB/zZqEjsPUd9r4gyf7PQym/rdSj95mrDNK7H/aAzt07sQ0d9Nfq6QB+UwR
ttVmCx7PJ8QakZG3heLKiP7lA9e1DnRchMhvkzy6U3Yyp3QrpxcxufVsJJmTqMN0
PfhID8TBhGXCqCSaRpOGcjnnM8MCse7zUJGDKeF8D5mCC9AXmg2alt3V+QSFy2ct
0Fdd+PLWPSJDyl2+DW2/JUoY2W2FL4vkLMUd+/K4F15/IhzMJE4UxF0U3HfapBsz
+gwvbpu6OU5tm6UdpXKocFDKmLv0xWqgRlTThr99LLq1Nq1plaKwoKf4q2iw8f0x
xDBi7uuFv9VmH0kZvaMsiusiHTCoSRK1HYSXpo3CZlzn4awAPCL48hdKN1ffnyG+
EnyiCSs3O67q3sNXCG80PQ7Vnx3sxC1CKb9ltiK2j2oYL3ld3th7LqGE0DD9hrtb
i1WWDY1LhZHwHLiDr5WQcTxa/GOWGeLg3u9KFifMBVKim19tuo2G2HUXY4kSXjlt
vpBmouFEZ9M=
=E8t1
-----END PGP SIGNATURE-----

--nextPart1482137.g61oAZcn8k--

--Boundary-00=_aGo7E0945UorO7p
Content-Type: text/x-diff; charset="us-ascii";
	name="hppa-mman-header-update.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
	filename="hppa-mman-header-update.patch"

Index: sysdeps/unix/sysv/linux/hppa/bits/mman.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /cvs/glibc/ports/sysdeps/unix/sysv/linux/hppa/bits/mman.h,v
retrieving revision 1.5
diff -u -p -r1.5 mman.h
=2D-- sysdeps/unix/sysv/linux/hppa/bits/mman.h	24 May 2006 15:31:25 -0000	1=
=2E5
+++ sysdeps/unix/sysv/linux/hppa/bits/mman.h	25 Aug 2006 04:46:25 -0000
@@ -34,40 +34,66 @@
=20
 #define MAP_SHARED	0x01		/* Share changes */
 #define MAP_PRIVATE	0x02		/* Changes are private */
=2D#define MAP_TYPE	0x03		/* Mask for type of mapping */
+#ifdef __USE_MISC
+# define MAP_TYPE	0x03		/* Mask for type of mapping */
+#endif
+
+/* Other flags.  */
 #define MAP_FIXED	0x04		/* Interpret addr exactly */
=2D#define MAP_ANONYMOUS	0x10		/* don't use a file */
+#ifdef __USE_MISC
+# define MAP_FILE	0
+# define MAP_ANON	MAP_ANONYMOUS
+# define MAP_ANONYMOUS	0x10		/* don't use a file */
+#endif
=20
=2D#define MAP_DENYWRITE	0x0800		/* ETXTBSY */
=2D#define MAP_EXECUTABLE	0x1000		/* mark it as an executable */
=2D#define MAP_LOCKED	0x2000		/* pages are locked */
=2D#define MAP_NORESERVE	0x4000		/* don't check for reservations */
=2D#define MAP_GROWSDOWN	0x8000		/* stack-like segment */
=2D#define MAP_POPULATE	0x10000		/* populate (prefault) pagetables */
=2D#define MAP_NONBLOCK	0x20000		/* do not block on IO */
+/* These are Linux-specific.  */
+#ifdef __USE_MISC
+# define MAP_DENYWRITE	0x0800		/* ETXTBSY */
+# define MAP_EXECUTABLE	0x1000		/* mark it as an executable */
+# define MAP_LOCKED	0x2000		/* pages are locked */
+# define MAP_NORESERVE	0x4000		/* don't check for reservations */
+# define MAP_GROWSDOWN	0x8000		/* stack-like segment */
+# define MAP_POPULATE	0x10000		/* populate (prefault) pagetables */
+# define MAP_NONBLOCK	0x20000		/* do not block on IO */
+#endif
=20
+/* Flags to `msync'.  */
 #define MS_SYNC		1		/* synchronous memory sync */
 #define MS_ASYNC	2		/* sync memory asynchronously */
 #define MS_INVALIDATE	4		/* invalidate the caches */
=20
=2D#define MCL_CURRENT	1		/* lock all current mappings */
=2D#define MCL_FUTURE	2		/* lock all future mappings */
+/* Flags for `mlockall'.  */
+#define MCL_CURRENT	1		/* Lock all currently mapped pages.  */
+#define MCL_FUTURE	2		/* Lock all additions to address
+					   space.  */
=20
=2D/* Advice to "madvise" */
+/* Flags for `mremap'.  */
+#ifdef __USE_GNU
+# define MREMAP_MAYMOVE 1
+# define MREMAP_FIXED	2
+#endif
+
+/* Advice to `madvise'.  */
 #ifdef __USE_BSD
=2D# define MADV_NORMAL	  0	/* no further special treatment */
=2D# define MADV_RANDOM	  1	/* expect random page references */
=2D# define MADV_SEQUENTIAL  2	/* expect sequential page references */
=2D# define MADV_WILLNEED	  3	/* will need these pages */
=2D# define MADV_DONTNEED	  4	/* dont need these pages */
=2D# define MADV_SPACEAVAIL  5	/* insure that resources are reserved */
=2D# define MADV_VPS_PURGE	  6	/* Purge pages from VM page cache */
=2D# define MADV_VPS_INHERIT 7	/* Inherit parents page size */
=2D# define MADV_REMOVE	  9	/* Remove these pages and resources.  */
+# define MADV_NORMAL	 0	/* No further special treatment.  */
+# define MADV_RANDOM	 1	/* Expect random page references.  */
+# define MADV_SEQUENTIAL 2	/* Expect sequential page references.  */
+# define MADV_WILLNEED	 3	/* Will need these pages.  */
+# define MADV_DONTNEED	 4	/* Don't need these pages.  */
+# define MADV_REMOVE	 9	/* Remove these pages and resources.  */
 # define MADV_DONTFORK	 10	/* Do not inherit across fork.  */
 # define MADV_DOFORK	 11	/* Do inherit across fork.  */
 #endif
=20
+/* The POSIX people had to invent similar names for the same things.  */
+#ifdef __USE_XOPEN2K
+# define POSIX_MADV_NORMAL	0 /* No further special treatment.  */
+# define POSIX_MADV_RANDOM	1 /* Expect random page references.  */
+# define POSIX_MADV_SEQUENTIAL	2 /* Expect sequential page references.  */
+# define POSIX_MADV_WILLNEED	3 /* Will need these pages.  */
+# define POSIX_MADV_DONTNEED	4 /* Don't need these pages.  */
+#endif
+
 /* The range 12-64 is reserved for page size specification. */
 #define MADV_4K_PAGES   12              /* Use 4K pages  */
 #define MADV_16K_PAGES  14              /* Use 16K pages */
@@ -77,16 +103,3 @@
 #define MADV_4M_PAGES   22              /* Use 4 Megabyte pages */
 #define MADV_16M_PAGES  24              /* Use 16 Megabyte pages */
 #define MADV_64M_PAGES  26              /* Use 64 Megabyte pages */
=2D
=2D/* compatibility flags */
=2D#define MAP_ANON	MAP_ANONYMOUS
=2D#define MAP_FILE	0
=2D#define MAP_VARIABLE	0
=2D
=2D/* Flags for `mremap'.  */
=2D#ifdef __USE_GNU
=2D# define MREMAP_MAYMOVE 1
=2D# define MREMAP_FIXED	2
=2D#endif
=2D
=2D

--Boundary-00=_aGo7E0945UorO7p
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_aGo7E0945UorO7p--

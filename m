From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [PATCH] top-level configure changes for HPPA
Date: Tue, 19 Nov 2002 01:36:20 -0500
Message-ID: <20021119063620.GK12451__7931.97338139198$1416621949$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0VNbQffo0Gc48lc+"
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: libc-alpha@sources.redhat.com
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--0VNbQffo0Gc48lc+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


libc-aplha,

When checking for DWARF2 unwind info the link order for 
hppa requires -lgcc_eh to be placed before -lgcc.

Change tested on i386 and nothing broke.

c.

---

2002-11-16  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* configure.in: Change "-lgcc -lgcc_eh" to "-lgcc_eh -lgcc" to
	accomodate required hppa linking order.
	* configure: Regenerate.


--0VNbQffo0Gc48lc+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=12-glibc23-hppa-configure

--- glibc-2.3.1/configure	2002-11-16 22:55:16.000000000 +0000
+++ glibc-2.3.1/configure	2002-11-16 22:58:08.000000000 +0000
@@ -5221,14 +5221,14 @@
 fi
 if { ac_try='${CC-cc} $CFLAGS -DCHECK__register_frame_info
                             -nostdlib -nostartfiles
-                            -o conftest conftest.c -lgcc -lgcc_eh >&5'
+                            -o conftest conftest.c -lgcc_eh -lgcc >&5'
   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
   (eval $ac_try) 2>&5
   ac_status=$?
   echo "$as_me:$LINENO: \$? = $ac_status" >&5
   (exit $ac_status); }; }; then
   if ${CC-cc} $CFLAGS -DCHECK__register_frame_info -nostdlib -nostartfiles \
-     -o conftest conftest.c -lgcc -lgcc_eh -v 2>&1 >/dev/null \
+     -o conftest conftest.c -lgcc_eh -lgcc -v 2>&1 >/dev/null \
      | grep -q -- --eh-frame-hdr; then
     libc_cv_gcc_dwarf2_unwind_info=no_registry_needed
   else
--- glibc-2.3.1/configure.in	2002-11-16 22:55:16.000000000 +0000
+++ glibc-2.3.1/configure.in	2002-11-16 22:58:28.000000000 +0000
@@ -1565,9 +1565,9 @@
 fi
 if AC_TRY_COMMAND([${CC-cc} $CFLAGS -DCHECK__register_frame_info
                             -nostdlib -nostartfiles
-                            -o conftest conftest.c -lgcc -lgcc_eh >&AS_MESSAGE_LOG_FD]); then
+                            -o conftest conftest.c -lgcc_eh -lgcc >&AS_MESSAGE_LOG_FD]); then
   if ${CC-cc} $CFLAGS -DCHECK__register_frame_info -nostdlib -nostartfiles \
-     -o conftest conftest.c -lgcc -lgcc_eh -v 2>&1 >/dev/null \
+     -o conftest conftest.c -lgcc_eh -lgcc -v 2>&1 >/dev/null \
      | grep -q -- --eh-frame-hdr; then
     libc_cv_gcc_dwarf2_unwind_info=no_registry_needed
   else

--0VNbQffo0Gc48lc+--

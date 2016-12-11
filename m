From: John David Anglin <dave.anglin@bell.net>
Subject: [committed] parisc:  -mcaller-copies option
Date: Sun, 11 Dec 2016 14:30:58 -0500
Message-ID: <99E90516-2165-4BC3-9E46-6900C6BA8F79@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-42-666284771
Cc: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
To: "gcc-patches@gcc.gnu.org Patches" <gcc-patches@gcc.gnu.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-42-666284771
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The attached change implements a new -mcaller-copies option on hppa.  =
The default 32-bit runtime
specifies that the callee copies arguments passed by hidden reference.  =
This is optimal but it causes
problems with openmp.  See PR middle-end/68733:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D68733

It's not clear openmp can be fixed to work with callee copies targets.

This option provides a work around.  The general consensus is that =
caller copies is better tested
and it seems probable that we will switch to caller copies on Debian =
when we switch to gcc-7.

Tested on hppa-unknown-linux-gnu, hppa2.0w-hp-hpux11.11 and =
hppa64-hp-hpux11.11 with no observed
regression.  When enabled, it fixes the failures noted in PR 68733.

Committed to trunk.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-42-666284771
Content-Disposition: attachment;
	filename=callee-copies.d.txt
Content-Type: text/plain;
	name="callee-copies.d.txt"
Content-Transfer-Encoding: quoted-printable

2012-12-11  John David Anglin  <danglin@gcc.gnu.org>

	* config/pa/pa.c (pa_callee_copies): New function.
	* config/pa/pa.opt (mcaller-copies): New option.
	* doc/invoke.texi (mcaller-copies): Document option.

Index: config/pa/pa.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- config/pa/pa.c	(revision 243232)
+++ config/pa/pa.c	(working copy)
@@ -195,6 +195,8 @@
 static bool pa_legitimate_constant_p (machine_mode, rtx);
 static unsigned int pa_section_type_flags (tree, const char *, int);
 static bool pa_legitimate_address_p (machine_mode, rtx, bool);
+static bool pa_callee_copies (cumulative_args_t, machine_mode,
+			      const_tree, bool);
=20
 /* The following extra sections are only used for SOM.  */
 static GTY(()) section *som_readonly_data_section;
@@ -343,7 +345,7 @@
 #undef TARGET_PASS_BY_REFERENCE
 #define TARGET_PASS_BY_REFERENCE pa_pass_by_reference
 #undef TARGET_CALLEE_COPIES
-#define TARGET_CALLEE_COPIES =
hook_bool_CUMULATIVE_ARGS_mode_tree_bool_true
+#define TARGET_CALLEE_COPIES pa_callee_copies
 #undef TARGET_ARG_PARTIAL_BYTES
 #define TARGET_ARG_PARTIAL_BYTES pa_arg_partial_bytes
 #undef TARGET_FUNCTION_ARG
@@ -10720,4 +10722,19 @@
   return NULL_RTX;
 }
=20
+/* Implement TARGET_CALLEE_COPIES.  The callee is responsible for =
copying
+   arguments passed by hidden reference in the 32-bit HP runtime.  =
Users
+   can override this behavior for better compatibility with openmp at =
the
+   risk of library incompatibilities.  Arguments are always passed by =
value
+   in the 64-bit HP runtime.  */
+
+static bool
+pa_callee_copies (cumulative_args_t cum ATTRIBUTE_UNUSED,
+		  machine_mode mode ATTRIBUTE_UNUSED,
+		  const_tree type ATTRIBUTE_UNUSED,
+		  bool named ATTRIBUTE_UNUSED)
+{
+  return !TARGET_CALLER_COPIES;
+}
+
 #include "gt-pa.h"
Index: config/pa/pa.opt
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- config/pa/pa.opt	(revision 243232)
+++ config/pa/pa.opt	(working copy)
@@ -41,6 +41,10 @@
 Target Ignore
 Does nothing.  Preserved for backward compatibility.
=20
+mcaller-copies
+Target Report Mask(CALLER_COPIES)
+Caller copies function arguments passed by hidden reference.
+
 mdisable-fpregs
 Target Report Mask(DISABLE_FPREGS)
 Disable FP regs.
Index: doc/invoke.texi
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- doc/invoke.texi	(revision 243232)
+++ doc/invoke.texi	(working copy)
@@ -761,7 +761,7 @@
=20
 @emph{HPPA Options}
 @gccoptlist{-march=3D@var{architecture-type} @gol
--mdisable-fpregs  -mdisable-indexing @gol
+-mcaller-copies  -mdisable-fpregs  -mdisable-indexing @gol
 -mfast-indirect-calls  -mgas  -mgnu-ld   -mhp-ld @gol
 -mfixed-range=3D@var{register-range} @gol
 -mjump-in-delay -mlinker-opt -mlong-calls @gol
@@ -17363,6 +17363,14 @@
 @opindex mpa-risc-2-0
 Synonyms for @option{-march=3D1.0}, @option{-march=3D1.1}, and =
@option{-march=3D2.0} respectively.
=20
+@item -mcaller-copies
+@opindex mcaller-copies
+The caller copies function arguments passed by hidden reference.  This
+option should be used with care as it is not compatible with the =
default
+32-bit runtime.  However, only aggregates larger than eight bytes are
+passed by hidden reference and the option provides better compatibility
+with openmp.
+
 @item -mjump-in-delay
 @opindex mjump-in-delay
 This option is ignored and provided for compatibility purposes only.

--Apple-Mail-42-666284771--

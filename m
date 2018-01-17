From: John David Anglin <dave.anglin@bell.net>
Subject: [committed] hppa: Switch hppa-linux to caller copies ABI
Date: Tue, 16 Jan 2018 21:00:47 -0500
Message-ID: <5A5EAE4F.6090200@bell.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020703040208050507050902"
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: gcc-patches@gcc.gnu.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------020703040208050507050902
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The callee copies ABI used for 32-bit hppa causes no end of optimization 
issues and problems with
OpenMP.  The hppa target is only in Debian unstable and gentoo.  In both 
cases, packages are
rebuilt often.  So, Helge and I decided that it was better to break the 
ABI and accept whatever
problems that result from the switch.

Committed to trunk.

Dave

-- 
John David Anglin  dave.anglin@bell.net


--------------020703040208050507050902
Content-Type: text/plain; charset=windows-1252;
 name="config.gcc.d"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="config.gcc.d"

2018-01-16  John David Anglin  <danglin@gcc.gnu.org>

	* config.gcc (hppa*-*-linux*): Change callee copies ABI to caller
	copies.

Index: config.gcc
===================================================================
--- config.gcc	(revision 256716)
+++ config.gcc	(working copy)
@@ -1339,7 +1339,7 @@
 	gas=yes gnu_ld=yes
 	;;
 hppa*-*-linux*)
-	target_cpu_default="MASK_PA_11|MASK_NO_SPACE_REGS"
+	target_cpu_default="MASK_PA_11|MASK_NO_SPACE_REGS|MASK_CALLER_COPIES"
 	tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h pa/pa-linux.h \
 		 pa/pa32-regs.h pa/pa32-linux.h"
 	tmake_file="${tmake_file} pa/t-linux"

--------------020703040208050507050902--

From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [PATCH] fix masking error in fesetround() on hppa
Date: Mon, 2 Dec 2002 21:43:58 -0500
Message-ID: <20021203024358.GA5487__37250.5117477433$1416621986$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="aM3YZ0Iwxop3KEKx"
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

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


libc-alpha,

Thanks to HP's testdrive users, we found and fixed a small masking bug
in fesetround(). Should use ~FE_DOWNWARD since this is the rounding mask
set to all ones, and will clear the mask before or'ing the round value.

It was suggested that a test case could be made of this, where glibc
tries to set and get various combinations of FE_DOWNWARD, FE_UPWARD,
FE_TONEAREST, and FE_UPWARD. I could provide such a testcase if it was
deemed usefull. 

c.

---

2002-12-02  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* sysdeps/hppa/fpu/fesetround.c: 
	(fesetround): Use ~FE_DOWNWARD so both bits of RM are cleared.

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=03-glibc23-hppa-fesetround

--- glibc-2.3.1/sysdeps/hppa/fpu/fesetround.c	2002-12-02 16:36:36.000000000 -0500
+++ glibc-2.3.1/sysdeps/hppa/fpu/fesetround.c	2002-12-02 16:36:59.000000000 -0500
@@ -31,7 +31,7 @@
 
   /* Get the current status word. */
   __asm__ ("fstd %%fr0,0(%1)" : "=m" (*sw) : "r" (sw));
-  sw[0] &= ~FE_UPWARD;
+  sw[0] &= ~FE_DOWNWARD;
   sw[0] |= round;
   __asm__ ("fldd 0(%0),%%fr0" : : "r" (sw));
 

--aM3YZ0Iwxop3KEKx--

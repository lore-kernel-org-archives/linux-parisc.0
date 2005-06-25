From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Sat, 25 Jun 2005 02:46:23 -0400 (EDT)
Message-ID: <200506250646.j5P6kN2H029175@hiauly1.hia.nrc.ca>
References: <42B91C1400000F85@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42B91C1400000F85@mail-1-bnl.tiscali.it> from "Joel Soete" at Jun
	24, 2005 07:05:14 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> mmm do I well understand that to force gcc to on;y use fr4-f5 and fr22-fr26
> (as do __muldi3), I had to use option:
> cflags-y        += -mfixed-range=fr6-fr21,fr27-fr28

Close, I used the change below.  This seems to build and check ok.
I don't know if it would be possible to cut back another register or not.
If I was going to try, I would add fr26 to the fixed list.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: config/pa/pa.c
===================================================================
RCS file: /cvs/gcc/gcc/gcc/config/pa/pa.c,v
retrieving revision 1.294
diff -u -3 -p -r1.294 pa.c
--- config/pa/pa.c	23 Apr 2005 21:28:33 -0000	1.294
+++ config/pa/pa.c	24 Jun 2005 02:37:47 -0000
@@ -306,7 +306,7 @@ fix_range (const char *const_str)
      REG2 are either register names or register numbers.  The effect
      of this option is to mark the registers in the range from REG1 to
      REG2 as ``fixed'' so they won't be used by the compiler.  This is
-     used, e.g., to ensure that kernel mode code doesn't use f32-f127.  */
+     used, e.g., to ensure that kernel mode code doesn't use fr4-fr31.  */
 
   i = strlen (const_str);
   str = (char *) alloca (i + 1);
Index: config/pa/t-linux
===================================================================
RCS file: /cvs/gcc/gcc/gcc/config/pa/t-linux,v
retrieving revision 1.8
diff -u -3 -p -r1.8 t-linux
--- config/pa/t-linux	5 Dec 2002 01:57:27 -0000	1.8
+++ config/pa/t-linux	24 Jun 2005 02:37:47 -0000
@@ -6,7 +6,8 @@ LIB1ASMFUNCS = _divI _divU _remI _remU _
 LIB1ASMSRC = pa/milli64.S
 
 # Compile libgcc2.a as PIC.
-TARGET_LIBGCC2_CFLAGS = -fPIC -DELF=1 -DLINUX=1
+TARGET_LIBGCC2_CFLAGS = -fPIC -DELF=1 -DLINUX=1 \
+  -mfixed-range="fr6-fr21,fr27-fr31"
 
 LIB2FUNCS_EXTRA=fptr.c
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

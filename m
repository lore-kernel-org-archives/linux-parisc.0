From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux]      Heads up, 2.6.7-pa0 FTBS with 64-bit toolchain
Date: Sat, 19 Jun 2004 21:14:28 -0400 (EDT)
Message-ID: <200406200114.i5K1ESYp007238@hiauly1.hia.nrc.ca>
References: <200406200029.i5K0T1re007012@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200406200029.i5K0T1re007012@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Jun 19, 2004 08:29:01 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Kyle McMartin wrote:
> > > On Fri, Jun 18, 2004 at 07:17:14PM -0600, Grant Grundler wrote:
> > > 
> > >>Should I be testing 64-bit kernels built with this toolchain
> > >>or stick with my trusty gcc 3.0.4-hppa64 handmade debs?
> > >>
> > > 
> > > There's a bug in hppa64 gcc sometime after 3.0.4 (it shows up in the
> > > gcc-3.3-hppa64 and gcc-3.4-hppa64 debs) that causes builds to fail in
> > > (at least) loop.c.
> > > 
> > > http://gcc.gnu.org/bugzilla/show_bug.cgi?id=14782 is the bug Randolph
> > > filed.
> 
> I believe that I understand the cause of this bug and have started
> testing a fix.

Enclosed is the patch that I am testing.  It seems to generated reasonable
code for the testcase that Carlos submitted today.  As far as I can tell,
the bug has been present in the FSF sources since the first support for
the 64-bit port (3.0 branch).  Thus, I expect the bug is present in debian
3.0.4, just not triggered.  The bug is triggered by the loop optimizer.

I would be interested in hearing if this solves the kernel build problem.
The patch is for 3.5.  It might need a bit of hacking to apply it to
earlier branches.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

2004-06-19  John David Anglin  <dave.anglin@nrc-cnrc.gc.ca>

	* pa.h (GO_IF_LEGITIMATE_ADDRESS): Require constant offsets to be
	correctly aligned for DImode loads and stores.

Index: config/pa/pa.h
===================================================================
RCS file: /cvs/gcc/gcc/gcc/config/pa/pa.h,v
retrieving revision 1.218
diff -u -3 -p -r1.218 pa.h
--- config/pa/pa.h	13 May 2004 06:40:03 -0000	1.218
+++ config/pa/pa.h	20 Jun 2004 00:32:04 -0000
@@ -1467,13 +1467,18 @@ extern int may_call_alloca;
       if (base								\
 	  && GET_CODE (index) == CONST_INT				\
 	  && ((INT_14_BITS (index)					\
-	       && (TARGET_SOFT_FLOAT					\
-		   || (TARGET_PA_20					\
-		       && ((MODE == SFmode				\
-			    && (INTVAL (index) % 4) == 0)		\
-			   || (MODE == DFmode				\
+	       && ((TARGET_64BIT && (MODE) == DImode			\
+		    && (INTVAL (index) % 8) == 0)			\
+		   || ((MODE) == SFmode					\
+		       && (TARGET_SOFT_FLOAT				\
+			   || (TARGET_PA_20				\
+			       && (INTVAL (index) % 4) == 0)))		\
+		   || ((MODE) == DFmode					\
+		       && (TARGET_SOFT_FLOAT				\
+			   || (TARGET_PA_20				\
 			       && (INTVAL (index) % 8) == 0)))		\
-		   || ((MODE) != SFmode && (MODE) != DFmode)))		\
+		   || ((!TARGET_64BIT || (MODE) != DImode)		\
+		       && (MODE) != SFmode && (MODE) != DFmode)))	\
 	       || INT_5_BITS (index)))					\
 	goto ADDR;							\
       if (!TARGET_DISABLE_INDEXING					\
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

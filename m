From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] stack-protect in conflict with CROSS_COMPILE
Date: Mon, 14 Aug 2006 06:07:29 -0600
Message-ID: <20060814120729.GB4340__30859.7600590021$1416624596$gmane$org@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Sam Ravnborg <sam@ravnborg.org>
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


Hi Sam,

We've stumbled on a problem with -fno-stack-protector and CROSS_COMPILE:

CFLAGS          := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                   -fno-strict-aliasing -fno-common
# Force gcc to behave correct even for buggy distributions
CFLAGS          += $(call cc-option, -fno-stack-protector)

round about line 310 of Makefile will cause CC to be called before we
get a chance to set CROSS_COMPILE in arch/parisc/Makefile.  For people
who are compiling 64-bit parisc kernels, this means the wrong gcc gets
called, and sometimes the compiler versions are out of sync.

We will have similar problems with:

CFLAGS          += -fno-omit-frame-pointer $(call cc-option,-fno-optimize-sibling-calls,)

Should we include the arch Makefile earlier in the proceedings?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

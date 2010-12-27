From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: PA-RISC 2.0 add/sub carry/borrow bug
Date: Mon, 27 Dec 2010 12:20:27 -0500
Message-ID: <20101227172026.GA25187@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Yesterday, after updating binutils to head, I hit an assembler error
assembling code from checksum.h:

 "      add,dc          %%r20, %0, %0\n"

It turns out that that gas was previously mis-assembling

	add		%r1,%r2,%r3

when generating PA 2.0 code.  It seems the overflow (d bit) was
incorrectly being set, indicating that a 64-bit signed overflow
was needed.  In fact, 32-bit signed overflow is the default unless
there is a "dc" completor or a 64-bit condition.

A patch was applied to fix the above.  However, it broke the handling
of "add,dc".  It also didn't fix sub.

It seems that the gas bug was hiding some code generation issues in
gcc.  The code in the linux kernel where I noticed this is also broken.
The linux change is untested.

Until gcc is fixed, binutils head can't be used ;(

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/include/asm/checksum.h b/arch/parisc/include/asm/checksum.h
index c84b2fc..3efcc33 100644
--- a/arch/parisc/include/asm/checksum.h
+++ b/arch/parisc/include/asm/checksum.h
@@ -140,7 +140,7 @@ static __inline__ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 "	ldd,ma		8(%1), %%r19\n"	/* get 1st saddr word */
 "	ldd,ma		8(%2), %%r20\n"	/* get 1st daddr word */
 "	add		%8, %3, %3\n"/* add 16-bit proto + len */
-"	add		%%r19, %0, %0\n"
+"	add,*		%%r19, %0, %0\n"
 "	ldd,ma		8(%1), %%r21\n"	/* 2cd saddr */
 "	ldd,ma		8(%2), %%r22\n"	/* 2cd daddr */
 "	add,dc		%%r20, %0, %0\n"

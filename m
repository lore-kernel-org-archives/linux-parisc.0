From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex wait failure
Date: Mon, 28 Dec 2009 13:59:17 -0500
Message-ID: <20091228185916.GA13912@hiauly1.hia.nrc.ca>
References: <20091223221856.3E76F4E77@hiauly1.hia.nrc.ca> <119aab440912231822m4b2a9c30ja5e17404210e7e50@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912231822m4b2a9c30ja5e17404210e7e50@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 23 Dec 2009, Carlos O'Donell wrote:

> We are just like every other architecture... with the exception that
> we currently have more bugs :-)

I have been looking at the lws implementation.  I've attached a patch
with a couple of tweaks:

1) I changed the unconditional branch at the entry point to a gate.
Didn't think it was a good idea to execute code at user priveledge.
This seems to have improved things (got through a complete testsuite
run on gsyprf11 without a deadlock).  However, I hit a slightly
different lockup on c3750.

2) Change return space register to sr7.  sr3 is not set correctly
if the entry number is invalid.

Have nasty suspicion that sr3 is getting hit...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="syscall.S.d.1"

--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -47,18 +47,17 @@ ENTRY(linux_gateway_page)
 	KILL_INSN
 	.endr
 
-	/* ADDRESS 0xb0 to 0xb4, lws uses 1 insns for entry */
+	/* ADDRESS 0xb0 to 0xb8, lws uses two insns for entry */
 	/* Light-weight-syscall entry must always be located at 0xb0 */
 	/* WARNING: Keep this number updated with table size changes */
 #define __NR_lws_entries (2)
 
 lws_entry:
-	/* Unconditional branch to lws_start, located on the 
-	   same gateway page */
-	b,n	lws_start
+	gate	lws_start, %r0		/* increase privilege */
+	depi	3, 31, 2, %r31		/* Ensure we return into user mode. */
 
-	/* Fill from 0xb4 to 0xe0 */
-	.rept 11
+	/* Fill from 0xb8 to 0xe0 */
+	.rept 10
 	KILL_INSN
 	.endr
 
@@ -423,9 +422,6 @@ tracesys_sigexit:
 
 	*********************************************************/
 lws_start:
-	/* Gate and ensure we return to userspace */
-	gate	.+8, %r0
-	depi	3, 31, 2, %r31	/* Ensure we return to userspace */
 
 #ifdef CONFIG_64BIT
 	/* FIXME: If we are a 64-bit kernel just
@@ -473,7 +469,7 @@ lws_exit:
 	/* now reset the lowest bit of sp if it was set */
 	xor	%r30,%r1,%r30
 #endif
-	be,n	0(%sr3, %r31)
+	be,n	0(%sr7, %r31)
 
 
 	

--VbJkn9YxBvnuCH5J--

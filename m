Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85B48482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  5 May 2001 09:05:48 -0600 (MDT)
Sender: delahaym@esiee.fr
Message-ID: <3AF41867.FEA3F5B6@esiee.fr>
Date: Sat, 05 May 2001 17:12:39 +0200
From: Matthieu Delahaye <delahaym@esiee.fr>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] glibc 2.2.3 make check status
References: <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk>
Content-Type: multipart/mixed;
 boundary="------------C66A00DC2A8F1DBB37F2490E"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------C66A00DC2A8F1DBB37F2490E
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi willy

Matthew Wilcox wrote:
> 
> I'm not sure people actually ran make check against glibc 2.2.1, so I don't
> know how this compares.  Maybe 2.2.3 just has more tests than 2.2.1 did...
> 
> I'd love some help on this.  Really.  check the merge_GLIBC_CVS_20010424
> branch out of CVS, configure it, make, then make check, and you'll start
> hitting failures.  I've indicated the ones I've investigated.

>  * posix/testchmod fails.  This is due to a kernel bug in strncpy_from_user.
>    Bug #118

The patch given above is supposed to correct this bug. It deals with the
fact that r24 counter is not "up to date" when the loop is stoped due to
a 0 byte's copy. 

I didn't find your merge_GLIBC_CVS_20010424 file. If you could point me
where
it is, I could perhaps try to help you as you request. More over, as you
might infer
I wasn't able to check the patch with the make check of the merge. The
only thing I know
is that my kernel still work with this patch , which is not a proof.

Regards,
Matthieu
-- 
Matthieu Delahaye
ESIEE Team
http://mkhppa1.esiee.fr/
--------------C66A00DC2A8F1DBB37F2490E
Content-Type: text/plain; charset=us-ascii;
 name="strncopy_from_user.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="strncopy_from_user.diff"

diff -Nru linux.old/arch/parisc/lib/lusercopy.S linux.new/arch/parisc/lib/lusercopy.S
--- linux.old/arch/parisc/lib/lusercopy.S	Sat May  5 16:43:40 2001
+++ linux.new/arch/parisc/lib/lusercopy.S	Sat May  5 16:44:00 2001
@@ -144,7 +144,7 @@
 	 *
 	 * Returns -EFAULT if exception before terminator,
 	 *         N if the entire buffer filled,
-	 *         otherwise strlen + 1 (i.e. includes zero byte)
+	 *         otherwise strlen (i.e. excludes zero byte)
 	 */
 
 	.export lstrncpy_from_user,code
@@ -153,7 +153,7 @@
 	.callinfo NO_CALLS
 	.entry
 	comib,=     0,%r24,$lsfu_done
-	copy        %r26,%r23
+	copy        %r24,%r23
 	get_sr
 1:      ldbs,ma     1(%sr1,%r25),%r1
 $lsfu_loop:
@@ -162,7 +162,7 @@
 	addib,<>,n  -1,%r24,$lsfu_loop
 2:      ldbs,ma     1(%sr1,%r25),%r1
 $lsfu_done:
-	sub         %r26,%r23,%r28
+	sub         %r23,%r24,%r28
 $lsfu_exit:
 	bv          %r0(%r2)
 	nop

--------------C66A00DC2A8F1DBB37F2490E--

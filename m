Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA21301
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 12:00:32 -0700
Message-Id: <200012181902.OAA12785@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc build failing and weird gcc configure error, post gcc merge
To: taggart@carmen.fc.hp.com (Matt Taggart)
Date: Mon, 18 Dec 2000 14:02:08 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20001218190057.AC11337CA1@carmen.fc.hp.com> from "Matt Taggart" at Dec 18, 2000 12:00:57 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> getnameinfo.c: In function `nrl_domainname':
> getnameinfo.c:164: Internal compiler error in eliminate_regs, at reload1.c:2521

Been there.  Try this patch to gcc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2000-11-14  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* reload1.c (eliminate_regs): Don't abort on MEM USEs.

--- reload1.c.orig	Wed Sep 27 14:27:23 2000
+++ reload1.c	Tue Nov 14 16:01:56 2000
@@ -2499,6 +2499,10 @@
 	return x;
 
     case USE:
+      /* Handle insn_list USE that a call to a pure functions may generate. */
+      new = eliminate_regs (XEXP (x, 0), 0, insn);
+      if (GET_CODE (new) == MEM)
+	return XEXP (new, 0);
     case CLOBBER:
     case ASM_OPERANDS:
     case SET:

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E83A849C6
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 02:54:21 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15mtPY-0004bk-00; Fri, 28 Sep 2001 09:54:20 +0100
Date: Fri, 28 Sep 2001 09:54:20 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jurij Smakov <jurij@lokmail.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Message-ID: <20010928095420.A16748@parcelfarce.linux.theplanet.co.uk>
References: <200109271442.KAA14125@mail.lokmail.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109271442.KAA14125@mail.lokmail.net>; from jurij@lokmail.net on Thu, Sep 27, 2001 at 10:42:25AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 27, 2001 at 10:42:25AM -0400, Jurij Smakov wrote:
> I hope I've got it right. It only emulates MFCTL and only when the
> source control register is 27. It turns out, that pt_regs does not
> have a member for cr26 and adding one does not look like an easy
> task. 

I think the right way to do this would be...

> @@ -363,6 +364,17 @@
>                 si.si_code = ILL_PRVOPC;
>                 goto give_sigill;
>         case 11:
> +               if(!(regs->iir & 0xfc000000) && (((regs->iir & 0x1fe0)>>5) == 0x45)) {
> +                 /* This is MFCTL instruction */
> +                 fromcr = (regs->iir & 0x03e00000)>>21;
> +                 togr = (regs->iir & 0x1f);
> +                 /* Emulate the instruction if the read is from cr27 */

		if (fromcr == 26 || fromcr == 27) {
			regs->gr[togr] = mfctl(fromcr);
			return;
		}

> +               }
> +               /* Something else is wrong */
>                 die_if_kernel("Privileged register - shouldn't happen!", regs, code);
>                 si.si_code = ILL_PRVREG;
>         give_sigill:

Can you give this a try?

-- 
Revolutions do not require corporate support.

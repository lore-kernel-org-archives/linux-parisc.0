Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98F5A482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  5 May 2001 15:16:15 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14w9PG-0001Aj-00; Sat, 05 May 2001 22:16:02 +0100
Date: Sat, 5 May 2001 22:16:02 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Matthieu Delahaye <delahaym@esiee.fr>
Cc: Matthew Wilcox <matthew@wil.cx>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] glibc 2.2.3 make check status
Message-ID: <20010505221602.R32445@parcelfarce.linux.theplanet.co.uk>
References: <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk> <3AF41867.FEA3F5B6@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AF41867.FEA3F5B6@esiee.fr>; from delahaym@esiee.fr on Sat, May 05, 2001 at 05:12:39PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 05, 2001 at 05:12:39PM +0200, Matthieu Delahaye wrote:
> The patch given above is supposed to correct this bug. It deals with the
> fact that r24 counter is not "up to date" when the loop is stoped due to
> a 0 byte's copy. 

It does indeed, I shall check this in now.  Thank you for your help!
Would you like to close this bug?

> I didn't find your merge_GLIBC_CVS_20010424 file. If you could point me
> where
> it is, I could perhaps try to help you as you request. More over, as you
> might infer
> I wasn't able to check the patch with the make check of the merge. The
> only thing I know
> is that my kernel still work with this patch , which is not a proof.

cvs co -r merge_GLIBC_CVS_20010424 glibc

gets you the glibc I'm working on.  i could provide a patch against
upstream glibc 2.2.3 if there's interest?

-- 
Revolutions do not require corporate support.

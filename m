Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87DD3482A
	for <parisc-linux@parisc-linux.org>; Wed,  1 Aug 2001 11:55:19 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15S0DF-0007uU-00; Wed, 01 Aug 2001 18:55:17 +0100
Date: Wed, 1 Aug 2001 18:55:17 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4.7 merge
Message-ID: <20010801185459.D4199@parcelfarce.linux.theplanet.co.uk>
References: <20010729211608.B5493@parcelfarce.linux.theplanet.co.uk> <20010801182113.C4199@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010801182113.C4199@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Aug 01, 2001 at 06:21:13PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 01, 2001 at 06:21:13PM +0100, Matthew Wilcox wrote:
> On Sun, Jul 29, 2001 at 09:16:08PM +0100, Matthew Wilcox wrote:
> > so I don't anticipate any major problems.
> 
> There were several minor unanticipated problems with the 2.4.7 merge, but
> I think we're good now; it boots fine on a 712 I have here.

I spoke too soon; on tulip-based systems it dies with an Unaligned
data reference in tulip_up.  Unfortunately I have to leave my keyboard
for the moment; but I hope someone magaes to find this problem before
I return.

-- 
Revolutions do not require corporate support.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA12537
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 10:33:23 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 17:37:17 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Lq7w-0003IA-00; Thu, 25 Jan 2001 17:24:04 +0000
Date: Thu, 25 Jan 2001 17:24:04 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.0 merge mangle our tree?
Message-ID: <20010125172404.E25242@parcelfarce.linux.theplanet.co.uk>
References: <200101250346.TAA21555@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101250346.TAA21555@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Jan 24, 2001 at 07:46:40PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 24, 2001 at 07:46:40PM -0800, Grant Grundler wrote:
> Hi Matthew,
> 
> I did 'cvs co -D "1/24/2001 09:00 MST" linux' in order to pick
> up the bits before the 2.4.0 "First take" commit.

ok, the answer seems to be `don't do that then'.  i get a buildable tree
by doing `cvs co linux; cd linux; cvs up -rLINUS_240_PREMERGE'.  I also
get a buildable tree by doing `cvs up -r LINUS_240_FIXUP'.  One is before
the merge and one is after.

sorry for stuffing up the merge :-(  ironic that i was trying to avoid
inconveniencing people...

> Tried "cvs update -rLINUS_240_PREMERGE" and that seemed to do what
> I think I wanted. But backs out a few recent changes. *sigh*.

err... which changes are those?  The sys32_select change richard made
just before i started breaking the tree looks like it's there. I guess
the change to sim700 that richard made won't be there, but as long as we
get this mess sorted out soon, it isn't going to be a big deal to find it.

-- 
Revolutions do not require corporate support.

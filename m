Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA07193
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Dec 2000 12:44:03 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 23 Dec 2000 19:47:07 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149udC-0000TS-00; Sat, 23 Dec 2000 19:47:02 +0000
Date: Sat, 23 Dec 2000 19:47:02 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alex deVries <adevries@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Some questions about the 715/50
Message-ID: <20001223194702.A824@parcelfarce.linux.theplanet.co.uk>
References: <3A44E560.BE825C97@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A44E560.BE825C97@linuxcare.com>; from adevries@linuxcare.com on Sat, Dec 23, 2000 at 12:48:16PM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 23, 2000 at 12:48:16PM -0500, Alex deVries wrote:
> Scorpio's a 715/old, and has two IO chips in it: WAX and Lasi. Scorpio
> Jr. (715/33) and Scorpio Sr. (715/75) are identical.

uh, no, it has Wax and Asp.  Lasi was a later chip.  It's very similar to
Lasi though.

> My questions:
> 
> a. The docs say that WAX's HIL on a GSC (not GSC+) is at 0xf0201000, but
> the HIL reported above is clearly in the ASP range.  Is there actually a
> HIL controller on ASP? More importantly, how are the interrupts routed?

The HIL controller is definitely on Asp.  The interrupt `just worked'
when i first stole phil blundell's hil driver he'd written for the hp300.

-- 
Revolutions do not require corporate support.

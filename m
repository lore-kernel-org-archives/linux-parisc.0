Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA22091
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Dec 2000 04:22:31 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 22 Dec 2000 11:25:33 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 80172B005; Fri, 22 Dec 2000 11:19:12 +0000 (GMT)
Date: Fri, 22 Dec 2000 11:19:12 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com, tytso@mit.edu
Subject: Re: [parisc-linux] Console
Message-ID: <20001222111912.Z2554@linuxcare.com>
References: <20001221211830.C21472@parcelfarce.linux.theplanet.co.uk> <20001221212855.E21472@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001221212855.E21472@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Thu, Dec 21, 2000 at 09:28:55PM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 21, 2000 at 09:28:55PM +0000, Matthew Wilcox wrote:
> 
> Couple of things I forgot to mention...
> 
> you may now want to specify `console=ttyS0' in the palo makefile... though
> thinking about it now, you may not need to.  I've only tried it with, not
> without.

Yes, you do need `console=ttyS0' now.  Otherwise you get "cannot open
initial console" and then silence until the login prompt.

dmesg works nicely though :)

Richard

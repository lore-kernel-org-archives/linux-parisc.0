Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA20642
	for <parisc-linux@puffin.external.hp.com>; Sat, 30 Dec 2000 17:04:17 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 31 Dec 2000 00:07:29 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14CW24-0000l7-00; Sun, 31 Dec 2000 00:07:28 +0000
Date: Sun, 31 Dec 2000 00:07:28 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Console
Message-ID: <20001231000728.G21315@parcelfarce.linux.theplanet.co.uk>
References: <20001221211830.C21472@parcelfarce.linux.theplanet.co.uk> <20001221212855.E21472@parcelfarce.linux.theplanet.co.uk> <20001223133747.B13472@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001223133747.B13472@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sat, Dec 23, 2000 at 01:37:47PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 23, 2000 at 01:37:47PM +0000, Matthew Wilcox wrote:
> On Thu, Dec 21, 2000 at 09:28:55PM +0000, Matthew Wilcox wrote:
> > I haven't tested STI console with these changes.  I don't have a
> > monitor/kbd for my 712.  Someone should test this, and remove the calls
> > to pdc_console_die (and remove pdc_console_die altogether).
> 
> here's a patch which does this.  please let me know how this works out
> for you.

If no-one tests this and tells me whether it works, i shall commit it
anyway and you can deal with the breakage yourselves.

-- 
Revolutions do not require corporate support.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA14346
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Dec 2000 14:25:58 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 21 Dec 2000 21:28:59 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149DGh-0006IW-00; Thu, 21 Dec 2000 21:28:55 +0000
Date: Thu, 21 Dec 2000 21:28:55 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com, tytso@mit.edu
Subject: Re: [parisc-linux] Console
Message-ID: <20001221212855.E21472@parcelfarce.linux.theplanet.co.uk>
References: <20001221211830.C21472@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001221211830.C21472@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Thu, Dec 21, 2000 at 09:18:30PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>


Couple of things I forgot to mention...

you may now want to specify `console=ttyS0' in the palo makefile... though
thinking about it now, you may not need to.  I've only tried it with, not
without.

I haven't tested STI console with these changes.  I don't have a
monitor/kbd for my 712.  Someone should test this, and remove the calls
to pdc_console_die (and remove pdc_console_die altogether).

-- 
Revolutions do not require corporate support.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA24212
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Dec 2000 06:35:26 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 22 Dec 2000 13:38:22 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149SOo-0004gn-00; Fri, 22 Dec 2000 13:38:18 +0000
Date: Fri, 22 Dec 2000 13:38:18 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@thepuffingroup.com,
        tytso@mit.edu
Subject: Re: [parisc-linux] Console
Message-ID: <20001222133818.A17975@parcelfarce.linux.theplanet.co.uk>
References: <20001221211830.C21472@parcelfarce.linux.theplanet.co.uk> <20001221212855.E21472@parcelfarce.linux.theplanet.co.uk> <20001222111912.Z2554@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001222111912.Z2554@linuxcare.com>; from rhirst@linuxcare.com on Fri, Dec 22, 2000 at 11:19:12AM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Dec 22, 2000 at 11:19:12AM +0000, Richard Hirst wrote:
> Yes, you do need `console=ttyS0' now.  Otherwise you get "cannot open
> initial console" and then silence until the login prompt.
> 
> dmesg works nicely though :)

Yay :-)  I just committed a change to PALO which ought to make this work.
I must confess though, I'm not clear where it gets the CONFIG_ variables
from.  are they in the environment?

-- 
Revolutions do not require corporate support.

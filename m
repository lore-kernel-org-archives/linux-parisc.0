Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA25352
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 12:39:33 -0600
To: Alex deVries <adevries@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] A quick update 
Reply-To: law@cygnus.com
In-reply-to: Your message of Fri, 18 Jun 1999 10:04:37 EDT.
             <376A51F5.D38ECFFC@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 18 Jun 1999 12:34:23 -0600
Message-ID: <1639.929730863@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <376A51F5.D38ECFFC@thepuffingroup.com>you write:
  > Should I be using objcopy to cut these sections out of my SOM executable
  > and into the LIF image?
No, I doubt objcopy knows about LIF (I've certainly never bothered to 
describe LIF to objcopy/bfd).

Utah's releases had code to do this kind of thing.  Or you might be able to use
the lif tools on hpux (ls /usr/bin/lif*).


jeff

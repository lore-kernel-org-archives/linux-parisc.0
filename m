Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA14277
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Apr 2000 12:35:20 -0600
Message-ID: <20000412123517.A14264@puffin.external.hp.com>
Date: Wed, 12 Apr 2000 12:35:17 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Mike Brancato <funnyguy@digitalsmackdown.net>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting from lan error...
References: <Pine.LNX.4.10.10004120254090.13750-100000@morph.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.10004120254090.13750-100000@morph.localdomain>; from Mike Brancato on Wed, Apr 12, 2000 at 03:11:27AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Apr 12, 2000 at 03:11:27AM -0400, Mike Brancato wrote:
> bootp won't work with our 735/125.  Search/Autoselect doesn't see
> lan.x.x.x as a bootable device.

are you sure that machine is using bootp rather than rbootd ?

> transciever on the back.  Even if the cables were bad, wouldn't the
> firmware see the lan.x.x.x as a bootable path?

715/old firmware at least doesn't show lan as bootable path unless it
detects an rbootd server.

	Philipp Rumpf

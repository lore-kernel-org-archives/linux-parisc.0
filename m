From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] kernel crash with IPv6
Date: Sun, 3 Dec 2006 13:15:40 -0500
Message-ID: <20061203181540.GA6043__10139.623998157$1416624226$gmane$org@athena.road.mcmartin.ca>
References: <200612021515.47161.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: list parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@athena.road.mcmartin.ca>
In-Reply-To: <200612021515.47161.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Dec 02, 2006 at 03:15:47PM +0100, Helge Deller wrote:
> Just got a kernel crash with our git tree code.
> Not sure if this is generic problem or related to parisc.
> I didn't investigated any further. 
> Just reporting her in case someone has an idea.
> IPV6 and serial console were enabled.
> Turning IPV6 off fixed it for me.
> 

I think,

http://bugzilla.kernel.org/show_bug.cgi?id=7621

Cheers,
	Kyle

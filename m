Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA04721
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Jan 2000 13:29:54 -0700
Date: Thu, 6 Jan 2000 15:31:59 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <199912091758.KAA29442@debian.fc.hp.com>
Message-ID: <Pine.BSO.4.20.0001061526570.31301-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] where to get som_relocate?
List-ID: <linux-parisc.vger.kernel.org>


Where's som_relocate to be found? It's time I gave this 
another yank.

--
Brian S. Julin

On Thu, 9 Dec 1999, Paul Bame wrote:

> = Finally got the build working, but no luck booting
> = (this is a 715/64) with either that or the images
> = on the web site.  IPL encounters an error of some sort,
> = but provides no specifics.  I've only tried booting over 
> = LAN so far.
> 
> If you're using the HPUX boot loader, be sure to run som_relocate
> (which will need re-building to run on hpux 9.x) on vmlinux before
> trying to boot it.
> 
> 	-Paul Bame
> 

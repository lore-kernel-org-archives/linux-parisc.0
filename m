Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA08506
	for <parisc-linux@puffin.external.hp.com>; Sun, 7 Nov 1999 18:00:05 -0700
Date: Sun, 7 Nov 1999 21:10:34 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: Martin Schulze <joey@infodrom.north.de>
cc: Andi <der_fisch@fischlustig.de>, parisc-linux@thepuffingroup.com
Subject: Re: cant use  rbootd
In-Reply-To: <19991107134158.Z9767@finlandia.infodrom.north.de>
Message-ID: <Pine.LNX.4.10.9911072107360.1761-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 7 Nov 1999, Martin Schulze wrote:
> > 
> > I am using an rbootd running on Debian 2.1 , but my HP 712/60 cant find it, I
> > put the correct ethernet adress in the /etc/rbootd.conf
> 
> I guess you'll need the Puffins patch applied.  The patch is available
> in the upcoming unstable aka 2.2 of Debian - I hope... In any case you'll
> find a non-official package at http://master.debian.org/~joey/NMU/ .  On
> 2.1 box you'll need to recompile it.

To make things clearer, I know for a fact that the rpm that's on
puffin.external.hp.com will work if you create the directory that's not in
the package (yes, I've been meaning to fix that package for about 6 months
now).  The Debian package should have the same patches applied.  

Also, I'd really appreciate it if you could mail that Debian binary
package to me so I can put it on puffin.external.hp.com.

- Alex "puffin" deVries.

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA16733
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 20:10:05 -0600
Date: Thu, 21 Oct 1999 19:10:54 -0700 (PDT)
From: Jason Eckhardt <jle@cygnus.com>
To: Paul Bame <bame@debian.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] boot loader
In-Reply-To: <199910220055.SAA20611@debian.fc.hp.com>
Message-ID: <Pine.SUN.3.91.991021183516.1551A-100000@poseidon.cygnus.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>




On Thu, 21 Oct 1999, Paul Bame wrote:

> 
> Here's a sketch of a new (really, mostly stolen from other places
> like the existing boot_code code) boot loader for parisc.  It's
> aimed at solving some of our current problems (like linking ramdisks
> into the kernel) and being good enough to live on for a while,
> and be easily replaced if it starts to smell bad.
> 
 ...
> 
> BTW the current contender for the name, instead of hilo, is palo
> for PArisc LOader.  It is also a reminder of of Palo Alto
> which is where HP began.
> 
> Comments?

  My only comments are "keep it small and simple" and don't spend a lot of time
  on it. This was my "philosophy" when I first wrote the bootloader -- after
  all, it is just a bootloader. The whole idea was to spend a day or two
  writing it, so we could get to the _interesting_ stuff -- the kernel. In
  fact, the only reason I wrote a bootloader (instead of lifting the one from,
  say, mklinux) was to have a compact and simple one. 

  However, I'm all for cleaning it up a bit. The original code was actually
  quite nice and well-commented, especially considering the haste in which it
  was written. It has since degraded a shade after some hacking by others
  (as well as gaining functionality -- ELF loading, for example -- by the way,
  does that actually work?). 
  As far as naming goes, PALO, HILO, doesn't really matter to me although PALO
  is as cute as any. I like my original, verbose and iconoclastic name
  "PARISC/Linux Bootstrap v0.1" :).

  If you're really fired up, help out on the kernel. I'm confident Alex and
  Chris can find something that needs to be written! (I'm looking for time
  myself -- between more than full-time work at Cygnus, grad school at Rice,
  and 3 kids, I'm having trouble helping out much these days).

  Have fun, jason.

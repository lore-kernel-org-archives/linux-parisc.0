Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA14898
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Oct 1999 22:39:23 -0600
Received: from vodka.thepuffingroup.com (IDENT:adevries@vodka.thepuffingroup.com [192.168.1.1])
	by vodka.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id AAA31216
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Oct 1999 00:46:35 -0400
Date: Wed, 27 Oct 1999 00:46:35 -0400 (EDT)
From: Alex deVries <adevries@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <19991027002755.D26012@thepuffingroup.com>
Message-ID: <Pine.LNX.4.10.9910270038090.31184-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Wuhoo! A shell!
List-ID: <linux-parisc.vger.kernel.org>


First off, many thanks to everyone who worked hard to get us these base
parts completed, especially Philipp, Helge and Grant.

Next, many thanks to Thomas, Chris and especially Phil for not just
getting seperate trees working, but one in CVS that's easily reproducable
and which we can move forward with.

Obviously there's a lot of stuff to be cleared up, but these problems
don't see too difficult. 

- lasi.c needs to have some of the interrupt management cleared up so that
we have a reasonable serial console speed.  From what Phil says it sounds
pretty easy.  I'm not exaggerating when I say it takes 15 minutes to get
to a shell on my 712/80.

- serial console code (as mentioned by Phil)

- overal console management needs to be handled properly.  This includes
finishing up the STI interface, the keyboard controller, and making it so
that the system chooses a console based on the firmware console path
settings.  This seems pretty reasonable.

- it sounds like we might be at a point now where getting networking isn't
so unreasonable.  We have the base of the tulip and i82596 controllers
going.

In any case, we can now safely say that 'Yes, PA-RISC Linux now boots to a
shell'.  Congrats, everyone.

- Alex

Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA02078
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 12:36:03 -0700
Message-Id: <200101021939.OAA07752@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] where to put 64 bit libmilli?
To: bame@fc.hp.com (Paul Bame)
Date: Tue, 2 Jan 2001 14:39:03 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <E14DX46-0005uT-00@noam.fc.hp.com> from "Paul Bame" at Jan 2, 2001 12:25:46 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I have source code for HP's 64-bit millicode and am working on making
> it compilable with our tool chain.  But the bigger question is where
> do I put it?
> 
> Right now millicode is part of libgcc.a in top-of-branch gcc, but I
> seem to recall some linker magic, and when/if that happens I don't
> know where to put the millicode stuff.

Last time I looked the 64 bit port was still using the same milli
library as the 32 bit port.  Thus to integrate a 64 bit library,
some work would have to be done to the machine description.  There
are hooks to build asm code (see for example lib1funcs.asm and
lib2funcs.asm in config/pa).

Has HP contributed this code to the public domain?  Probably, Jeff
Law would be the one to contact to get integrated into the gcc mainline.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

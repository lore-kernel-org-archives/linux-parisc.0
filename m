Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA24145
	for <parisc-linux@puffin.external.hp.com>; Sat, 14 Oct 2000 14:25:05 -0600
Message-Id: <200010142026.QAA01645@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Troubles following the 'recipe'
To: raj@cerias.purdue.edu (Brian Poole)
Date: Sat, 14 Oct 2000 16:26:06 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.SOL.4.10.10010132356161.22986-100000@basm.cerias.purdue.edu> from "Brian Poole" at Oct 14, 2000 00:50:16 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> So what is the problem? Well, a while (hard to say exactly, one is a
> dual 500, the other is a dual 100, big difference in times ;) into the
> building of gcc both of my machines error out, complaining that they can't
> find some header files. Specifically it errors out while compiling
> iogetline.c, complaining that it can't find errno.h (from
> ../../../gcc/libio/libioP.h:30:19), _G_config.h 
> (../../../gcc/libio/libio.h:30:23) and string.h 
> (../../../gcc/libio/iogetline.c:27:20). The errors are the same for each
> machine. I downloaded all of the files today, October 13th.

Run the failing compilation with the gcc `-v' option to see the include search
directories.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

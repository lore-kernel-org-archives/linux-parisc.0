Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA10202
	for <parisc-linux@puffin.external.hp.com>; Sun, 13 Jun 1999 11:03:01 -0600
Message-Id: <199906131702.NAA28988@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] It's finally sunk in: bye bye elf32
To: adevries@thepuffingroup.com (Alex deVries)
Date: Sun, 13 Jun 1999 13:02:58 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <3762F4BE.C09B5CA9@thepuffingroup.com> from "Alex deVries" at Jun 12, 99 08:01:02 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> So, I'm going to spend some time making the kernel build on HPUX.  I
> know there's quite a few changes to make.  But I'll keep the elf
> specific work, it'll help later on.

The discussion about the merits/limitations of SOM and ELF over the
last couple of days has been extremely useful.  As Alex says, there is
a lot of work to be done on the kernel before it is usable.  However,
in the long run, the port must be a complete self contained system.
That is, it must support a linker capable of generating executables
and the kernel.

The concensis is that writing a SOM linker is a major project.  Another
option might be to approach HP and see if they would consider putting
the source code for their SOM linker into the public domain, or possibly
supplying a static binary version of the linker that could be distributed.
I would suggest that Alex discuss the matter with his contact at HP.

If this does not work out, then we must fall back to ELF32 and devote
enough effort to get elf32-hppa working at an acceptable level.  Jeff
Law is the world expert on the hp version of these tools.  However, Jeff
is very busy with gcc.  Any volunteers?  Obviously, this needs to be
coordinated with the maintainers of binutils and Cygnus.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

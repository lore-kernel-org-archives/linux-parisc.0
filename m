Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA11932
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 00:34:50 -0600
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: adevries@thepuffingroup.com (Alex deVries),
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] It's finally sunk in: bye bye elf32 
Reply-To: law@cygnus.com
In-reply-to: Your message of Sun, 13 Jun 1999 13:02:58 EDT.
             <199906131702.NAA28988@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 14 Jun 1999 00:29:34 -0600
Message-ID: <26267.929341774@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <199906131702.NAA28988@hiauly1.hia.nrc.ca>you write:
  > The concensis is that writing a SOM linker is a major project.  Another
  > option might be to approach HP and see if they would consider putting
  > the source code for their SOM linker into the public domain, or possibly
  > supplying a static binary version of the linker that could be distributed.
  > I would suggest that Alex discuss the matter with his contact at HP.
It's an option.  Probably not a bad one.  Though the HP linker's idea of
portability is marginal at best, so getting it running on another system is
no trivial effort.  But if HP is willing to do it and give y'all binaries,
then go for it.


  > If this does not work out, then we must fall back to ELF32 and devote
  > enough effort to get elf32-hppa working at an acceptable level.  Jeff
  > Law is the world expert on the hp version of these tools.  However, Jeff
  > is very busy with gcc.  Any volunteers?  Obviously, this needs to be
  > coordinated with the maintainers of binutils and Cygnus.
I would strongly recommend against any serious work at trying to make the
existing elf32-hppa.c work -- start over from scratch with the spec at your
side.  There is almost no salvageable code in elf32-hppa.c.

If someone has an interest in working on a rewrite I would strongly encourage
them to contact me so that we can work closely together and avoid useless
duplication of work since I'm working on elf64-hppa.c right now (which should
be able to share a bunch of code with elf32-hppa.c)

jeff

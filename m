Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA06035
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Jun 1999 10:57:52 -0600
Message-Id: <199906121657.MAA02162@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] booting problems
To: adevries@thepuffingroup.com (Alex deVries)
Date: Sat, 12 Jun 1999 12:57:40 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: law@cygnus.com, parisc-linux@thepuffingroup.com
In-Reply-To: <37624146.A7B5F0FE@thepuffingroup.com> from "Alex deVries" at Jun 12, 99 07:15:18 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Jeffrey A Law wrote:
> > 
> 
> <snip>
> 
> Okay, I can make that change, unless someone beats me to it.
> 
> > 
> > Though I'm a little confused.  I thought y'all were dropping the existing ELF
> > stuff -- I would strongly recommend it.  We're not even planning to keep the
> > existing elf32-hppa stuff building in gas/binutils as we work on the rewrite.
> > You're working with a totally dead and unsupported toolchain at this point.
> 
> Let me clear this up.
> 
> Yes, we are absolutely dropping any use of the current broken
> instantiation of elf32-hppa.

As I see it, it is a question of priorities.  The existing elf32-hppa
tools are the only ones which currently allow cross development
due to the lack of gnu linker supporting SOM.  If a SOM linker were
available, cross development could be done using the more developed
and tested SOM tools.  However, according to the comments in binutils/bfd,
the bfd architecture is incapable of performing all types of SOM
relocations.  A SOM linker also needs to be stream based.  Thus,
it appears difficult (impossible?) to build a SOM linker using the
bfd architecture.  On the other hand, the elf32-hppa tools have serious
deficiencies and are about to be completely rewritten.  Might it not be
better to develop a SOM linker rather than rewrite the elf stuff?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

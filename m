Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA17155
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Dec 1999 10:56:52 -0700
Message-Id: <199912121754.MAA01874@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] a pretty big change
To: lamont@security.hp.com (LaMont Jones)
Date: Sun, 12 Dec 1999 12:54:56 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bame@debian.fc.hp.com, parisc-linux@thepuffingroup.com,
        lamont@security.hp.com
In-Reply-To: <19991209010821.87E9318708@security.hp.com> from "LaMont Jones" at Dec 8, 99 06:08:20 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> > That happens pretty frequently to me but I've not tracked down why
> > it happens.  Did you try holding the TOC button in for several seconds?
> > On some workstations I've been told that generates a hard reset.
> 
> TOC results in (providing that the checksum passes) transfer of control
> to a routine pointed at from page 0.  If something is trashing that, and
> the checksum'ed length is set to 0, then you'll branch off into the ozone.
> 
> If the checksum fails, then you get the PDC default of rebooting.
> 
> Don't know if that's your problem, but it's probably worth checking into
> whether something is trashing physical address 8 (TOC vector - 0xc is the
> length of the checksum.)

I believe that I have located the cause of the problem.  The real mode
code in the kernel startup used the stack pointer passed from the system
loader.  The initial stack pointer passed by the hpux loader is 0.
This caused some items in PAGE0 to be trashed, although it is not clear
that the TOC vector itself was being trashed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA23620
	for <parisc-linux@puffin.external.hp.com>; Thu, 29 Apr 1999 21:55:17 -0600
Date: Thu, 6 May 1999 01:38:50 -0400 (EDT)
From: Alex deVries <adevries@redhat.com>
To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ld problem workaround
In-Reply-To: <19990506053931.13099@insula.local>
Message-ID: <Pine.LNX.3.96.990506013644.25834B-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Thu, 6 May 1999, Philipp Rumpf wrote:
> 
> Where are the bootloader sources atm ?
> 

Jason's sources are at:

ftp://puffin.external.hp.com/pub/parisc/src/boot_rel_0.2.tar.gz

I'm not quite sure how complete they are.  The pain is that because of our
lack of ELF32 in binutils these really need to be linked on an HPUX box.

The Puffin Group is working with HP to have a box called
puffinpa.external.hp.com to act first as an HPUX build machine to solve
the problem of not everyone having access to HPUX yet.

- Alex

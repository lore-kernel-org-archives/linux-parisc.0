Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA05998
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 14:14:21 -0600
Message-Id: <200010112011.QAA27206@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] __hp9000s700 predefined
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Wed, 11 Oct 2000 16:11:56 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@cup.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <no.id> from "John David Anglin" at Oct 11, 2000 03:44:13 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > John, is there something specific you are concerned about which
> > can't be handled by the above predefined symbols?
> 
> I was just being cautious about __hp9000s[7-8]00.  I looked at some of
> the uses in the hpux 10.X headers, and for usage in gcc and binutils.  I
> don't see any obvious reason why these two symbols need to be defined
> for linux.
> 
> I believe that the compiler only should predefine symbols that are necessary
> for the control of code generation.  Neither CONFIG_XXX or runtime checks
> will help you for this since gcc only has a limited capability to change
> its code generation at runtime.  There appears to be some model dependence
> in the floating point implementations from one pa machine to another.  If
> this can't all be hidden in the kernel, some further specification of the
> hardware might be needed for floating point.  For example, __i686__ is
> defined on the Pentium Pro and is used in bits/mathinline.h.

There is a nice table listing model numbers, architecture and processor
type in /opt/langtools/lib/sched.models under hpux 11.  It still appears
possible to compile and link a PA1.0 app under hpux 11.  I am guessing
but it looks like there are 5 different PA1.1 float implementations (a-e).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

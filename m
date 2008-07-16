From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] Document LWS ABI.
Date: Tue, 15 Jul 2008 20:15:13 -0400 (EDT)
Message-ID: <20080716001514.74D5F431A@hiauly1.hia.nrc.ca>
References: <119aab440807151251m7d00ca82gde10474cb35e8430@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kyle@mcmartin.ca, dave.anglin@nrc.ca,
	linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440807151251m7d00ca82gde10474cb35e8430@mail.gmail.com> from "Carlos O'Donell" at Jul 15, 2008 03:51:07 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >> The LWS interface *already* has a 64-bit runtime entry point, see
> >> arch/parisc/kernel/syscall.S:
> >> [....]
> >
> > Sure. I thought the discussion was about adding a 64-bit runtime entry point
> > which operates on a 64-bit pointer. But this can be done discussed when
> > 64-bit userspace is coming...
> 
> The entry point is already there. It's LWS #1. Apparnetly I created it
> with a 64-bit userspace in mind.

You didn't respond to the issue.

> Please apply the patch and send it upstream?

This ABI change is unjustified and I won't approve the Helge's GCC patch
with this change.  You will also have to change the glibc code to match.

Kyle indicated that he didn't want any major changes to the LWS interface,
so reserving several new registers is unnecessary.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

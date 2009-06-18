From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA and Squeeze
Date: Wed, 17 Jun 2009 21:35:09 -0400 (EDT)
Message-ID: <20090618013510.0484B4FE2@hiauly1.hia.nrc.ca>
References: <4A39823C.8070104@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, luk@debian.org,
	debian-hppa@lists.debian.org, debian-release@lists.debian.org,
	admin@debian-ports.org, linux-parisc@vger.kernel.org
To: doko@debian.org (Matthias Klose)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A39823C.8070104@debian.org> from "Matthias Klose" at Jun 18, 2009 01:54:36 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Grant Grundler schrieb:
> > On Fri, Jun 12, 2009 at 08:49:26AM +0200, Luk Claes wrote:
> >> Grant Grundler wrote:
> >>> +linux-parisc (hppa kernel, compiler and !debian tech forum)
> >>>
> >>> Neil,
> >>> thanks for the summary. I know this is an unpleasant business in general.
> >>>
> >>> On Tue, Jun 02, 2009 at 03:07:35PM +0100, Neil McGovern wrote:
> >>>> Hi,
> >>>>
> >>>> As mentioned previously[0], the release team haven't been happy with the
> >>>> state of the HPPA port in Debian. After the release team meeting[1], it
> >>>> has been decided that unfortunatly HPPA will not be supported for
> >>>> Squeeze. This was after careful consideration, and wasn't an easy
> >>>> decision.
> >>>>
> >>>> This means that ftpmasters will be asked to remove HPPA from testing and
> >>>> unstable from the 30th June. It is suggested that HPPA porters may wish
> >>>> to consider using debian-ports.org if they wish to continue with the
> >>>> port.
> >>>>
> >>>> Regards,
> >>>> Neil McGovern
> >>>>
> >>>> [0] http://lists.debian.org/debian-release/2009/04/msg00299.html
> >>> Carlos O'Donnell asked some questions in response to [0] and I never
> >>> saw any response.  Can an attendee of the above meeting please reply
> >>> this email from Carlos?
> >>>
> >>>     http://lists.debian.org/debian-release/2009/04/msg00303.html
> >> Note that it's wrong to assume we will come with the answers.
> > 
> > I was expecting a summary of specific issues from an organization
> > that claims to operate transperently.  The hand waving is easy. But
> > doesn't resolve problems and doesn't meet my expectation of an "open"
> > organization that I've donated money, time, and materials to.
> 
> +1. dropping hppa as a release architecture was not communicated by the release
> team at all.  I did spend some time to get gcj / default-jdk working on hppa,
> and some money (buying a new disk for a hppa machine) to help this port.  The
> time and the money could have spent better, if d-r would have better
> communicated about their intent.

I totally understand your frustration.  I have spent thousands of hours
supporting hppa.  At my current rate, this would be...

I believe that intent to drop an architecture should be communicated well
in advance of the fact.  Not doing so will alienate the developer and
user communities.

> hppa is not in a good shape, but there are other architectures which are not
> better (sparc, mips*) from a toolchain point of view. what about these?

Sparc still exists as a mainframe architecture.  If you can afford a
high end server, it's probably not that slow.  64 processors, 256 cores,
and 512 threads at 2.52 GHz can't be all that bad ;)

As you know, it takes a lot of effort to keep a tool chain up to date.
If a manufacturer doesn't provide the support that is needed to keep
the tool chain going, then the open source support for it will die.
It can't be done without access to a variety of hardware, and documentation
that may be proprietary.

Mips and arm are primarily embedded architectures.  Unless one of
these manages to achieve market success as a low-end programmable device
running linux, the user community is going to be limited to the developers
working on products using these devices.  The workstation and server
market using mips is dead.

I was able to build up the tools I need for a Linux arm board in a few
days.  Thus, I don't really see the need for Debian to try to maintain
full blown builds and releases for these architectures.  Certainly,
there's a lot applications for linux in board products, but it's very
product specific.

I can understand the desire to trim architectures.  However, it's clear
the current decision was based on some misinformation, and an unclear
rational.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

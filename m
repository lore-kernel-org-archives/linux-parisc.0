Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.calyx.net (mail.calyx.com [216.82.160.19])
	by dsl2.external.hp.com (Postfix) with SMTP id F0137482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Oct 2001 15:32:13 -0600 (MDT)
Date: Mon, 22 Oct 2001 17:32:12 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] upgrade
In-Reply-To: <20011022143943.A15967@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.BSO.4.33.0110221729570.26163-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 22 Oct 2001, Matthew Wilcox wrote:
> Should work well.  You should upgrade your kernel before you upgrade
> glibc, but aprt from that I can't think of any other problems.  Beware
> that the current CVS kernel is probably broken for just about everyone
> except rbrad :-)

Hmm... my kernel config/source is a little off kilter being that I've
ripped out HIL to develop the new driver for it.  Is there a
CVS tag or date I could use to check out a working version?

--
Brian

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e004.dhcp212-198-142.noos.fr [212.198.142.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6684C4829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Nov 2002 14:31:47 -0700 (MST)
Date: Sun, 3 Nov 2002 22:31:32 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Cc: willy@debian.org
Subject: Re: [parisc-linux] Placement of hil drivers
Message-Id: <20021103223132.7d57ffff.varenet@esiee.fr>
In-Reply-To: <20021102155723.I20749@parcelfarce.linux.theplanet.co.uk>
References: <20021102155723.I20749@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, 2 Nov 2002 15:57:23 +0000
"Matthew Wilcox" <willy@debian.org> wrote:

> 
> So it seems to me that all of drivers/hil (in the 2.5 tree) depends
> on stuff in drivers/input.  Is there any reason it shouldn't be in
> drivers/input/hil rather than drivers/hil?  Or is there an even better
> place to put it?
> 
> I notice that we don't even have the option to select the HIL configure
> options in 2.5 at the moment, which means nobody's testing on 715/Scorpio
That's not true, I've worked hard enough on 2.5 config system, and especially on HIL, to deny such statement ;^)

These options are already in the Input Drivers section of 2.5 config
Check for Serial i/o support, then you'll get the HP HIL driver core support.

There are various dependencies on whether or not you enable the Mouse interface and other stuff, but all options are present.

AFAICR, I already have said when we merged 2.4 config files into 2.5 that HIL driver files and config may need review.

It looks like time has come for such review.

I would like to hear from Helge Deller too.


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

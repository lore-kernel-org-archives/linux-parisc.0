Return-Path: <joey@infodrom.org>
Received: from luonnotar.infodrom.org (luonnotar.infodrom.org [195.124.48.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id 579AD484B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Mar 2004 02:57:59 -0700 (MST)
Date: Thu, 18 Mar 2004 10:55:06 +0100
From: Martin Schulze <joey@infodrom.org>
To: Helge Deller <deller@gmx.de>
Message-ID: <20040318095506.GW9104@finlandia.infodrom.north.de>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403142219.00823.deller@gmx.de>
	<20040315171420.GW9104@finlandia.infodrom.north.de>
	<200403152046.13832.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <200403152046.13832.deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Helge Deller wrote:
> On Monday 15 March 2004 18:14, Martin Schulze wrote:
> > > Furthermore you might try to increase the value of mdelay(6); in line 168
> > > in file linux-2.6/drivers/input/serio/gscps2.c...
> > > Maybe it's a timing issue ?
> > 
> > Apparently, it was.  I now have keyboard and mouse support.
> > I set the delay to 12.
> 
> Did you tried any other values between 6 and 12 ?
> If a lower value works for you, I would like to put this one in the source....

mdelay(8) contains the lowest value with which the mouse starts to work.

In order to have proper/normal responses you'd have to increase the
responsiveness with gpm, though, but with X the mouse curser runs fast
as usual.

Regards,

	Joey

-- 
The MS-DOS filesystem is nice for removable media.  -- H. Peter Anvin

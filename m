Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.calyx.net (unknown [216.82.160.19])
	by dsl2.external.hp.com (Postfix) with SMTP id 67CC84A19
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Mar 2001 22:21:09 -0700 (MST)
Date: Mon, 5 Mar 2001 00:20:41 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: <parisc-linux@lists.parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>, <maswan@acc.umu.se>
In-Reply-To: <00121503462102.00304@P100>
Message-ID: <Pine.BSO.4.33.0103050014290.32438-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] TODO-list entry of "HIL keyboard driver needs updating"
List-ID: <linux-parisc.vger.kernel.org>

Hmmm... Brian might refer to me, but I do not know who Alex is.
The only other person who showed interest in the driver was
Helge Deller.  We do NOT have access to the HIL specs, and
the driver I would like to write will need more detail than that
gleaned from the BSD/linux/mklinux source code.  But, if the
below refers to another two people who DO have access to the
docs, then it would be nice if they would tell me what needs
to be done to get me access to them.

--
Brian S. Julin

On Fri, 15 Dec 2000, Helge Deller wrote:

> Hi Brian,
>
> I plan to remove the current HIL-keyboard-support from the kernel and would
> like to use your new linux-input-style driver instead.
> I've just checked and linux-input is now in our tree, so this would be a
> good time to add your code.
>
> The remaining question is currently, how much time you have had so far for
> this driver and if/when this code could be added to CVS ? If you need a
> helping hand please don't hesitate to ask me,
>
> Greetings,
>
> 	Helge Deller
>
> On Wednesday 01 November 2000 08:48, you wrote:
> > Probably best not to worry about cleaning keyboard drivers up too much.
> > The current USB code will be followed by linux-input style drivers at
> > some point.  In fact I started a HIL linux-input style driver, which
> > would abstract the PS2 port/HIL ports and allow a standard keyboard module
> > to be hooked into the abstracted serio port.  I will work on it more when
> > time permits.
> >
> > --
> > Brian S. Julin
>

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA04445
	for <parisc-linux@puffin.external.hp.com>; Thu, 20 Jul 2000 08:35:10 -0600
From: Helge.Deller@ruhr-uni-bochum.de
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL support on 715/old ?
Date: Thu, 20 Jul 2000 16:27:06 +0200
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <00072016270600.11517@P100>
List-ID: <linux-parisc.vger.kernel.org>

Hi Brian,

Am Wed, 19 Jul 2000 schrieb Brian S. Julin:
> I haven't had the time yet to look at the code, which
> I really honestly truthfully do hope to work on :-),

That would be great.
Since I'm moving to a new town, I won't have time in the next 2-3 weeks.

> but someone at some point fixed it for the 715/64,
> which meant changing HIL_BASE.

Yes, that was me. In the current code HILBASE refers to the variable hil_base
from drivers/gsc/hil.c. The address of the HIL-controller is
automatically set there by the detection routines.

> Someone else mentioned
> that there's no PCIish bus/device tree yet, so maybe they j
> ust re#defined it rather than probing.

No. The base-address is taken from the parisc-hw-tree. But maybe the choosen
interrupt-line is wrong for 715/old.
The HIL-bus itself has no PCIish tree (I mean: a list of the attached 
devices) yet.

> The 715/64 used to
> hang there and it was because the HIL_BASE was wrong.

Hmmm. ?
My 715/64 used to work with HIL-keyboard (keys come through, but the
translataion was wrong), but I haven't tested it in the last few weeks.

Helge Deller.

Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D33B4843
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 16 Feb 2004 19:30:33 -0700 (MST)
Message-Id: <200402170230.i1H2UVff020209@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] HP1825 and PCI Vis-EG at 1600x1200
To: grundler@parisc-linux.org (Grant Grundler)
Date: Mon, 16 Feb 2004 21:30:31 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040204051928.GA16054@colo.lackof.org> from "Grant Grundler" at
	Feb 3, 2004 10:19:28 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> I just recently got an HP 1825 Flat panel display.
> The documentation says the panel supports 1600x1200 resolution
> via analog (not DVI) input at 75Khz Hsync, 60Hz refresh (Vsync).

I tried 1600x1200 @ 75Hz on a NEC LCD.  However, I found that the
redraw time with the VIS-EG was too long for my taste.  I settled
for 1280x1024 @ 75 Hz.

> Anyone already know if PCI Vis-EG card can output that?
> If so how? Maybe some sort of custom "mode line" in PDC?
> I'm looking for concrete steps, not speculation.

The C3k manual describes the commands needed to the Vis-EG 
to its predefined modes.

> I'll hunt a bit more on the internet since I'm pretty sure
> I've seen some of the HP parisc workstations allow for
> a "custom" video output but don't know if Vis-EG allows
> that or where the steps to do it are described.

If I recall, there is a line in the list of settings for the
Vis-EG for user defined settings.  However, I couldn'd figure
out how to set them.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

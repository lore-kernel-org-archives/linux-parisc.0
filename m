Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98A03482A
	for <parisc-linux@parisc-linux.org>; Wed, 20 Mar 2002 15:01:29 -0700 (MST)
Date: Wed, 20 Mar 2002 22:01:11 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: John <hplinux@eagle.grdl.noaa.gov>,
	<parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Re: PA-RISC 0.9.3+C200+Visualize-EG+2.4.18-pa05
 = working X!
In-Reply-To: <20020315044546.C7D58483E@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0203202015180.5453-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 14 Mar 2002, Grant Grundler wrote:

> John wrote:
> > I wanted to share the good news that Grant's recent patch to "entry.S"
> ...
> > Thanks Grant!
>
> That's great news!
>
> But Thomas Bogendoerf should get most of the credit for figuring
> out the problem and fix. I just implemented what he said.
>
> BTW, I've modified the patch a bit (removed an un-needed depdi)
> and it's still not committed yet. I'd like to let Thomas
> commit it himself since he really did the hard part.

I also downloaded and patched a 2.4.18-pa5 kernel with it,
(just a simple conflict with the kernel version number in
 the Makefile appeared, easy to solve).

It works on my C240 with a FX2 card. Well, it now recognizes
the gfx card at startup and it seems to initialize it, but since
I currently don't have a proper monitor, I can't tell you whether
gfx is working or not :-/
(BTW, I use the serial console on the C240, connected to a FreeBSD
 notebook)
At least the C240 is still running, so the patch doesn't do a harm ;)

Actually I HAVE a monitor (a 15" LCD) but it's max resolultion is about
1024x786/70Hz. Since the FX/2 just supports 72 and 75Hz in
the video selection menu at bootup, the monitor just tells me
"signal is out of sync range".

I have mentioned this before (18 Dec 2001) in the mailing-list,
and I was asking how and if you can change the FX-graphics to
a custom resolution (mode 6). Grant replied

> Yes. I don't know exactly how though. I'd look in the User's Guide
> (might be available on docs.hp.com).

unfortunately I haven't found any information except this:

(http://docs.hp.com/cgi-bin/fsearch/framedisplay?top=/hpux/onlinedocs/B2355-90142/B2355-90142_top.html&con=/hpux/onlinedocs/B2355-90142/00/00/42-con.html&toc=/hpux/onlinedocs/B2355-90142/00/00/42-toc.html&searchterms=refresh&queryid=20020320-135018)


-------+++++++++========= snip =========++++++++-------

Changing the Monitor Type
=========================

A configuration tool is available to change the monitor type on HP
VISUALIZE-FX devices. Monitor resolution, refresh rate and stereo mode
settings may be configured using the setmon tool. To change the monitor
type, the setmon command can be executed directly or done through the
SAM system administration tool.

The setmon executable is located at /opt/graphics/common/bin/setmon.
Under SAM this component is located under the top-level "Display"
folder, next to the "X Server Configuration" icon.

-------+++++++++========= snip =========++++++++-------


It seems this utility exists only for the Visualize-FX cards.
Moreover I don't know whether this affects only X (on HP/UX).

Does anybody have information about this utility ?
(I don't have HP/UX, so I can try it ...)
Perhaps it is possible to port/run it. Or does anybody has information
how to change the custom resolution on FX-Cards (without this utility) ?

Thanks in advance, max!

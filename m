Return-Path: <cbeerse@lycos.nl>
Received: from lmfilto01.st1.spray.net (lmfilto01.st1.spray.net
	[212.78.202.65])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32CA74842
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Apr 2004 09:39:06 -0600 (MDT)
Message-ID: <407FFE07.50000@lycos.nl>
Date: Fri, 16 Apr 2004 17:38:47 +0200
From: =?ISO-8859-1?Q?Corn=E9_Beerse?= <cbeerse@lycos.nl>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] B1000/C3000
References: <200404140944.LAA01567@xenon.pc.Uni-Koeln.DE>	<200404142102.41913.deller@gmx.de>
	<407FBCB1.1030601@lycos.nl> <20040416144733.GI24370@baldric.uwo.ca>
In-Reply-To: <20040416144733.GI24370@baldric.uwo.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Helge Deller <deller@gmx.de>, Ulrich Deiters <ukd@xenon.pc.Uni-Koeln.DE>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Carlos O'Donell wrote:

> On Fri, Apr 16, 2004 at 01:00:01PM +0200, Corn? Beerse wrote:
> 
>>Be noted that the Xvnc fron DebianWoody crashes on my HP-D370...
> 
> 
> Does the viewer from sid crash you box?

Since my D370 has no graphical display, the viewer will not work, i use the 
viewer on my desktop.

> Any idea why it crashes?

Not jet, not time to investigate, so many other things to do...

The idea to use Xvnc for the X11-server for display :0 just came since I did 
just that on a RedHatLinux server (hp DL380 ;) There it runs without a problem.

I think (well that will be my first step) is that the RedHatLinuxIntel box runs 
in runlevel 5, the graphical runlevel. The D370 is in its text-console runelvel. 
I think I need to force it in its graphical runlevel and convince the Xserver is 
properly configured, even without the hardware. For that I have to dive into 
Debian and its X11 configuration which (I have already seen) differs from 
RedHat, SuSE and HP-UX.

For what its worth, Xvnc can (for a start) just replace the other X11-server 
binary. Once that works (`vncviewer palinux:0` gives a login box), the call to 
Xvnc can be extended with some configuration like colordepth, resolution and 
security, see `Xvnc --help` for a list of options and the `vncserver` script for 
some other details.


CBee

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from wolf.alaskatech (207-5-237-24-cable.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF9BE4829
	for <parisc-linux@parisc-linux.org>; Tue, 12 Nov 2002 13:53:30 -0700 (MST)
Received: from wolf.alaskatech (palinux@wolf.alaskatech [24.237.5.207])
	by wolf.alaskatech (8.12.3/8.12.3/Debian -4) with ESMTP id gACKrdR5024046;
	Tue, 12 Nov 2002 11:53:39 -0900
Date: Tue, 12 Nov 2002 11:53:38 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Chuck Slivkoff <caslivkoff@telocity.com>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] C180 oddness
In-Reply-To: <1033629468.626.67.camel@jerry>
Message-ID: <Pine.LNX.4.44.0211121141270.16543-100000@wolf.alaskatech>
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

In case this helps anyone else...

> > On Wed, 2002-10-02 at 13:47, Tom wrote:
> > the "tab after powerup" to switch console settings, but nothing. According
> > to my C180 manual, having the monitor and keyboard on there should set the
> > monitor as console, while removing them should send console to ttyS0.
>
> On 3 Oct 2002, Chuck Slivkoff wrote:
> If the console path in the PDC is explicitly set to one of the serial
> ports, it will not automagically change back to graphics by connecting a
> keyboard. The opposite is true, though: no/bad PS/2 keyboard, no/bad
> graphics, or invalid PDC value (ie, graphics card moved/removed) & the
> console will be directed to the first serial port.
>
> Do the PS/2 keyboard LED's flash and Num_Lock LED light during POST?

Yes, they did...

> Here's another suggestion: try removing all I/O cards, detaching all
> disks, disconnecting the network, and removing all but 1 pair of SIMMs.

Did this, didn't seem to make any difference.

Tracked down a new, known-good db9-db9 null-modem cable, scarfed the g/f
laptop (WinME), connected former to latter with cable and used
HyperTerminal. (Everything still disconnected/removed as suggested above.)
Console came up, with typical dire warnings about hardware changes.
Checked - fast boot disabled already, console path set to
serial_1.9600.n.1, so is correct. Displaying hardware showed VizEG video,
etc. Power off, plug in drives, power on, back to console. SEArch hung
while looking for drives... Discover the "scsi card" end of the FW cable
was bad - moved the next connector in line onto the card, SEA comes up
fine with FWSCSI.5 and SESCSI.5 (correct devices). Plug everything else
back in, all is redetected fine, and system is now merrily trying to
compile 2.4.19-pa24...

So, apparently the cable end being loose/bad was seriously screwing with
it's poor little RISC-brain.

> When you get the console back, you might want to enable "chassis codes"
> (to trace the POST codes) and disable "fast boot" (to get a better test
> of RAM). I believe The service manual has a table which should be able
> to give some indication of when the firmware chooses a console device.
>
> http://h20000.www2.hp.com/bizsupport/TechSupport/DocumentIndex.jsp?contentType=SupportManual&docIndexName=hardware+manuals&locale=en_US&prodTypeId=43563&prodSeriesId=44435&prodSeriesName=hp+Visualize+c180+workstation
>
> BTW, one of the nice things about the Allegro/Forte/Duet (4-digit
> B/C/Jxxxx, less J2240) systems is the LCD display which indicates where
> the console has be directed.

I think if I can find one of these cheap I'll grab it :-)  (The C180 was
$35 plus $50 shipping - too good to pass up! Gotta love eBay...)

BTW, I tried using apt to dist-upgrade from stable, but nothing's changed
in quite a while - at least a month. Are updates being pushed into
testing, or is it better to leave sources.list pointing to stable?

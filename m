Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c003.snv.cp.net (h013.c003.snv.cp.net [209.228.32.227])
	by dsl2.external.hp.com (Postfix) with SMTP id 390B24829
	for <parisc-linux@parisc-linux.org>; Thu,  3 Oct 2002 01:17:54 -0600 (MDT)
Subject: Re: [parisc-linux] C180 oddness
From: Chuck Slivkoff <caslivkoff@telocity.com>
To: Tom <palinux@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
In-Reply-To: <Pine.LNX.4.44.0210020925510.6688-100000@wolf.alaskatech>
References: <Pine.LNX.4.44.0210020925510.6688-100000@wolf.alaskatech>
Content-Type: text/plain
Date: 03 Oct 2002 03:17:47 -0400
Message-Id: <1033629468.626.67.camel@jerry>
Mime-Version: 1.0
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

Hi Tom,

On Wed, 2002-10-02 at 13:47, Tom wrote:
>
> the "tab after powerup" to switch console settings, but nothing. According
> to my C180 manual, having the monitor and keyboard on there should set the
> monitor as console, while removing them should send console to ttyS0.

If the console path in the PDC is explicitly set to one of the serial
ports, it will not automagically change back to graphics by connecting a
keyboard. The opposite is true, though: no/bad PS/2 keyboard, no/bad
graphics, or invalid PDC value (ie, graphics card moved/removed) & the
console will be directed to the first serial port.

Do the PS/2 keyboard LED's flash and Num_Lock LED light during POST?

Here's another suggestion: try removing all I/O cards, detaching all
disks, disconnecting the network, and removing all but 1 pair of SIMMs.

When you get the console back, you might want to enable "chassis codes" 
(to trace the POST codes) and disable "fast boot" (to get a better test
of RAM). I believe The service manual has a table which should be able
to give some indication of when the firmware chooses a console device.

http://h20000.www2.hp.com/bizsupport/TechSupport/DocumentIndex.jsp?contentType=SupportManual&docIndexName=hardware+manuals&locale=en_US&prodTypeId=43563&prodSeriesId=44435&prodSeriesName=hp+Visualize+c180+workstation

BTW, one of the nice things about the Allegro/Forte/Duet (4-digit
B/C/Jxxxx, less J2240) systems is the LCD display which indicates where
the console has be directed.

Good Luck.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA12470
	for <parisc-linux@puffin.external.hp.com>; Sun, 2 Apr 2000 03:12:06 -0600
Received: from udlkern.fc.hp.com (jsm@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id UAA26313
	for <parisc-linux@thepuffingroup.com>; Sat, 1 Apr 2000 20:35:18 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.1) id UAA09060 for parisc-linux@thepuffingroup.com; Sat, 1 Apr 2000 20:35:17 -0700 (MST)
Date: Sat, 1 Apr 2000 20:35:17 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200004020335.UAA09060@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 735/125 boot problem?
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


> this is booting hpux., it should show up on the graphics card.
>
> mike
>
> On Sat, 1 Apr 2000, Grant Grundler wrote:
>
> >
> > Mike Brancato wrote:
> > > we have another 735 here, and like, if i leave th HD connected, it shows
> > > HPUX trying to start, but just sits at the screen with the yellow displays
> > > at teh bottom.
> >
> > Mike,
> > Have you tried connecting to the serial port? (9600, 8, N, 1)
> >
> > The console might be directed to the serial port and nothing
> > will show up on the monitor until X11 is started. I think the
> > yellow boxes at the bottom are an artifact from the graphics
> > firmware support for function keys.

Mike,

Grant is correct. Your console is set to the serial port. The only
error in his response is that the yellow boxes are not put there by
the firmware. They are put there by the ite driver (internal terminal
emulator), which means that you succeeded in loading hp-ux and
it ran enough for the ite driver to draw the yellow boxes. If you
saw nothing on your display before this that indicates that your
console is set to the serial port rather than the graphics card.

John Marvin
jsm@fc.hp.com

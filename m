Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA16622
	for <parisc-linux@puffin.external.hp.com>; Sun, 2 Apr 2000 12:30:11 -0600
Date: Sun, 2 Apr 2000 06:49:40 -0400 (EDT)
From: Mike Brancato <funnyguy@digitalsmackdown.net>
To: John Marvin <jsm@udlkern.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 735/125 boot problem?
In-Reply-To: <200004020335.UAA09060@udlkern.fc.hp.com>
Message-ID: <Pine.LNX.4.10.10004020647050.978-100000@morph.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


is there a way to reset the firmware to display on the graphics card?  i
guess if all else fails i can hook a palm to it....

mike

On Sat, 1 Apr 2000, John Marvin wrote:

> Mike,
> 
> Grant is correct. Your console is set to the serial port. The only
> error in his response is that the yellow boxes are not put there by
> the firmware. They are put there by the ite driver (internal terminal
> emulator), which means that you succeeded in loading hp-ux and
> it ran enough for the ite driver to draw the yellow boxes. If you
> saw nothing on your display before this that indicates that your
> console is set to the serial port rather than the graphics card.
> 
> John Marvin
> jsm@fc.hp.com
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 

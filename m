Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from 12-225-100-78.client.attbi.com (12-225-100-78.client.attbi.com [12.225.100.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B5DA482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Feb 2002 10:50:05 -0700 (MST)
Date: Sat, 9 Feb 2002 09:53:36 -0800
From: collver@linuxfreemail.com
To: lug@peak.org
Cc: Allen Brown <abrown@peak.org>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20020209095335.A4426@glen.takilma.net>
References: <200201150347.g0F3lh129546@tpol.peak.org> <20020204104006.A6794@glen.takilma.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020204104006.A6794@glen.takilma.net>; from collver@linuxfreemail.com on Mon, Feb 04, 2002 at 10:40:07AM -0800
Subject: [parisc-linux] Re: serial breakout box
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

On Mon, Feb 04, 2002 at 10:40:07AM -0800, collver@linuxfreemail.com wrote:
> >>This is an Apollo 400 which has been upgraded to a 715T/50 (Trailways-50). 
> > 
> > Pin 7 is GND.  Pins 2 and 3 are the input and outputs, not necessarily
> > in that order.  Measure from 7 to 2.  Measure from 7 to 3.  One
> > of them will be close to 0V.  The other will be much higher.  I think
> > -10V or something like that.  The pin with the higher voltage is
> > the output.
> > 
> > Do the same thing on the other system also using the 25 pin connector.
> > Then make sure you are not connecting the output to the output.
> 
> It turns out the Apollo 400 has a funky serial pinout.
> I obtained a breakout box and when I find the time, I will experiment with
> this strange serial port.

The Apollo 400 and the mouse are both "DCE".  I can measure -11.44V on the
Apollo's pin 2 and on the PC's pin 3.  I have verified that the mouse will
speak to my PC using only txd, rxd, and rts.  I can also log into the
Apollo from the PC using only txd, rxd, and rts.

It is obvious the I need to connect the mouse's pins 2 and 3, to the
Apollo's pins 3 and 2.  The rest is unsure.  I have tried many combinations
of wiring, and I just haven't been able to get the mouse to work.

To connect two DCE devices, some suggest a "tail circuit cable".  It seems
overkill to me since the mouse only uses a few pins.  I have noticed that
the Apollo doesn't ever show voltage on the "carrier detect" pin.  I have
also noticed that the Apollo voltage is -11.44 volts, and the PC voltage is
-12.15 volts.

Can anyone give me tips for getting this mouse to work?

Thanks,

Ben

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from 12-225-100-78.client.attbi.com (12-225-100-78.client.attbi.com [12.225.100.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1080F482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 11:37:10 -0700 (MST)
Date: Mon, 4 Feb 2002 10:40:07 -0800
From: collver@linuxfreemail.com
To: Allen Brown <abrown@peak.org>
Cc: lug@peak.org, parisc-linux@lists.parisc-linux.org,
	vernicus@attbi.com
Message-ID: <20020204104006.A6794@glen.takilma.net>
References: <200201150347.g0F3lh129546@tpol.peak.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200201150347.g0F3lh129546@tpol.peak.org>; from abrown@peak.org on Mon, Jan 14, 2002 at 07:47:43PM -0800
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

>>This is an Apollo 400 which has been upgraded to a 715T/50 (Trailways-50). 
>>
> The breakout box is probably most convenient.  I've never had access
> to one.  But the first thing you need to determine is if you need
> to crossover or not.  You can do that with just a voltmeter.
> 
> Pin 7 is GND.  Pins 2 and 3 are the input and outputs, not necessarily
> in that order.  Measure from 7 to 2.  Measure from 7 to 3.  One
> of them will be close to 0V.  The other will be much higher.  I think
> -10V or something like that.  The pin with the higher voltage is
> the output.
> 
> Do the same thing on the other system also using the 25 pin connector.
> Then make sure you are not connecting the output to the output.

It turns out the Apollo 400 has a funky serial pinout.  The connector on
the back of the box allows you to connect with a normal cable.  However,
a funky "3-way splitter cable" will allow you to use 3 serial ports from
the single connector.

The port works fine with a straight-through cable, with the Apollo 400
being the DCE and a PC being the DTE.  However something about the strange
pinout interferes with using a serial mouse, even when attaching the mouse
through a crossover cable.

I obtained a breakout box and when I find the time, I will experiment with
this strange serial port.

Ben.

ps.  here is the pinout I found online

-----------------------------------------------------------------------------
H.14 - How do I build the cable to get at the hidden serial ports on a
Series 400 machine?

   Build the funky three-way splitter cable. Otherwise, a normal DB25 serial
   cable will work fine if you only want one serial port.
   Note that a splitter is not needed for the 425e, on which the three serial
   ports are already broken out on the back panel.

   This table gives the pinout for the serial connector on the rear panel.
   Source:
   HP Apollo 9000 Series 400 Domain/OS Owner's Guide (1990)
   HP Order No. A1630-90005

   +------------------------------------------------------+
   | Pin No. | Signal          | Pin No. | Signal         |
   |---------+-----------------+---------+----------------|
   |    1    | Ground          |   14    | SIO2_RTS       |
   |---------+-----------------+---------+----------------|
   |    2    | SIO1_TXD        |   15    | SIO2_CTS       |
   |---------+-----------------+---------+----------------|
   |    3    | SIO1_RXD        |   16    | SIO2_DCD       |
   |---------+-----------------+---------+----------------|
   |    4    | SIO1_RTS        |   17    | Spare          |
   |---------+-----------------+---------+----------------|
   |    5    | SIO1_CTS        |   18    | SIO2_DTR       |
   |---------+-----------------+---------+----------------|
   |    6    | SIO1_DSR        |   19    | SIO3_DTR       |
   |---------+-----------------+---------+----------------|
   |    7    | Inline resistor |   20    | SIO1_DTR       |
   |---------+-----------------+---------+----------------|
   |         | SIO1_DCD        |         |                |
   |    8    | (not supported  |   21    | SIO3_TXD       |
   |         | in Domain/OS)   |         |                |
   |---------+-----------------+---------+----------------|
   |         |                 |         | SIO1_RI        |
   |    9    | SIO3_RXD        |   22    | (not supported |
   |         |                 |         | in Domain/OS)  |
   |---------+-----------------+---------+----------------|
   |   10    | SIO3_CTS        |   23    | SIO3_RTS       |
   |---------+-----------------+---------+----------------|
   |   11    | Spare           |   24    | Spare          |
   |---------+-----------------+---------+----------------|
   |   12    | SIO2_TXD        |   25    | SIO3_DCD       |
   |---------+-----------------+---------+----------------|
   |   13    | SIO2_RXD        |         |                |
   +------------------------------------------------------+

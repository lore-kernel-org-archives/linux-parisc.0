Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id E04454843
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Aug 2003 15:32:56 -0600 (MDT)
Message-ID: <3F453A84.5040305@gmx.at>
Date: Thu, 21 Aug 2003 23:32:52 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Apollo 9000 power problem
References: <200308182034.QAA13970@hiauly3.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hello,

of course it is a "hack", but it is a constructive one, not
a bad thing like disconnecting the suppervision or so ...

I have replaced some of the capacitors, but it was not so simple
to detect the one, which has lost a bit of it's fluid ...

The problem is relly the layer of this chemicals of the capacitor and
the dust mixture, which generates the lack current. (I really have
problems to explain this all in English here ....)

I was not my thing to take the power supply out and hold it under
the water to clean, so I tried it with clothes, etc, but - as I
mentioned already in the last mail - some weeks later the problem
occured again. New dust on this checimal stuff .... (or new chemical
stuff ??? ...)

This SIMM-like suppervison thing checks six itmes on the power
supply (the other 6 comperators are use to generate the RESET
signal in case of "power good").

One measures the current. If the input of the comperator increases
2.35V (comming from meassure transformer meassuring the current
of some secondary linesm e.g. 5V, 12V...), then the protection
stops the power supply (the stop is done per thyristor, so one
short "stop" signal hold the power supply down until POFF/PON,
then the cycle starts again).

In idle operation (my test setup was a 10 Ohm + LED to see,
if the power is stable while repairing it), the voltage of
the current transformers is near 0V. All current transformers
have an own diode to one line. So if the output voltage of
the current transformes is lower the e.g. 0.6V (voltage of
the diode), behind the diodes the line has high impedance.
So the very low lack current of the near -12V line can drop
this line easy. If the voltage drops below 0V, the comperator
does not work correctly and asserts the "stop" (although
e.g. -0.5V is below 2.35, which should be OK !).

If there is an over current, there is a voltage on the output
side of the current transformer, and a representative voltage
is on the other side of the diode. This will pull up the the
line up to some voltage (higher than 2.35 leads to the stop ..).

So the 220KOhm resisitor only pulls the high impedance sense
line up against the "dust" resistor. But both "resistors" have
a high value against the output of the over current transformers,
if a big current is comming up.

So this "hack" is acceptable for me.
It was not acceptable for me, to  short-cut or isolate the
over-current protection (I did this for one day for tests, but
I could not live with this feeling, not having this important
protection.

And see the alternative. A new powersupply of this type costs
about 1000 EURO, an "fresh repaied" about 300EURO, an old one
- perhaps having the same problem soon - costs about 150EURO ...

So I am happy to have a correct working power supply with a
full functioning protection and a "well defined" hack !

Ok, I cannot take any warranty for others ..., but I thought,
I know what I am doing.

Further questions are welcome.

Christoph P.





John David Anglin wrote:
> Christoph,
> 
> I saw your recent note on power supply problems.  It looks like
> my 735(730) has suffered a similar failure in the recent blackout.
> The symptoms appear similar to what you described a a couple of
> years ago.  On power up, leds flash for 100-200 ms and then all
> go out.
> 
> Did you replace the failed capacitor?  Adding a resistor between
> the +Vaux line and the current sense line to compensate for leakage
> between the -12V line and the current sense line seems like a
> bit of a hack.
> 
> Do you have docs for the supply?
> 
> Dave
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 



-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

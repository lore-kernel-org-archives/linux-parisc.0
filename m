Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep11-int.chello.at (viefep11-int.chello.at [213.46.255.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48F4D482E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Aug 2003 15:58:41 -0600 (MDT)
Message-ID: <3F32CB8C.9060407@gmx.at>
Date: Thu, 07 Aug 2003 23:58:36 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>,
	pappy@nikita.ath.cx
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Re: Apollo 9000 power problem
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

Hello HP Hackers !

I have a work around for the POWER SUPPLY Problem.

Using schematics and analysing this very very hard thing,
I found out, that the problem we all have was created
by an exploded capacitor.

The thing running out of the capacitor mixed with the dust
in the machine generates an resistor on the PCB board.

On the low voltage end of the power supply (near front),
ther is a small SIM-like module which does the supervision of
all volatage lines (plus over current protection) and which
generates the reset impuls.

Now to the problem. The line coming from the current measure
transformer is the neighbour line of the -12V line. Because
of the electrical resistor because of the dust, etc, the
negative voltage comes to the current supervision line, and
therefore one supervision comperator does a wrong failure
reaction !

Workaround:

- step 1 -
Try to clean the space on the PCB around this supervison module.
(I soldered it out for cleaning, a resoldered it in)..

- step 2 -
This helps. But after weeks the problem returned again ....
I soldered in a resistor between the +Vaux (about 12..16V)
and this current measure line to compensate this negativ
voltage of the -12V line.
This is no relevant impact to the over-current protection,
as the resistor has a high value against the measurement
output.

This worked for me.
If you need help on this, please contact me ...

Christoph




-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C277483E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 14:42:27 -0600 (MDT)
Message-ID: <3D22101D.74982658@gmx.at>
Date: Tue, 02 Jul 2002 22:42:05 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Problem find devices on the E55 I/O interfaces
References: <3D1A377A.E0CFABBD@gmx.at> <1025579851.956.469.camel@beavis>
Content-Type: text/plain; charset=us-ascii
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

Hello Ryan !

Really nice to here from you !

Did you do some hacks on the MUX (of your type of machine) ?

In one of my mails I sent a log with my instrumented debug output,
so you may be able to read out something concerning the question
of bus type.

Here is one question: Although I a have hardware knowledge, I am
not fix HP terminology here.
Can you give me some hints here with the kewords "main bus", 
"lower bus", etc...

Is the "main bus" the CPU bus which has connected the on board 
devices and has a bridge to the the backpanel, or without bridge 
to the backpanel ?
Or is the "main bus" the bus behind the bridge running on the back-
panel ?
Is the lower bus a bus on the interface card behind the bridge to 
the backpanel bus, or ... ?
Is the bus converter itself a bridge ?
Is it transperent bridge or has it to be initialized and is special
drivers needed, etc...

A ASCII block diagram would be helpful, only very simple like

   +-+                    +-+
   | |----- main bus -----| |----- backpanel bus ------------------
   +-+                    +-+    |                 |           |
  CPU (core)           Bridge    I/F 1            I/F 2       I/F 3
				+-+
				| |
				+-+  Bus Converter
				 |
				 +-------------------------- I/O bus
					|          |	
					MUX 	 SCSI

This is not true for the E55, it is only an EXAMPLE !!!

Together we will solve it, or ?

Christoph




Ryan Bradetich wrote:
> 
> Hello Christoph,
> 
> Sorry for the late reply, had a great time at OLs.
> 
> On Wed, 2002-06-26 at 15:51, Christoph Plattner wrote:
> > Hello PARISC hackers !
> >
> > I have problems in the device probing on the E55, and I need some
> > hints here. I am at the very starting point of the SCSI driver
> > development, and other (Rayn) will also need this for MUX (serial),
> > etc....
> >
> > The E55 is a machine of the type "SYSTEM MAP TYPE".
> > I instrumented the code to read out the values and elements at the
> > inventory probing. I will append the log of my "debug helps", they
> > are quite self explaining.
> >
> > The `walk_central_bus()' calls seems to do correct work. It finds the
> > basic elements on my E55:
> >
> >       On the "56" the bus converter
> >       On "62" and "63" components on the system (main) board
> >       - "62" is the CPU, "63" the Memory
> >
> >       The search was started at the "60".
> >
> > My problem now. The `walk_lower_bus()' under the device "56" cannot
> > find any further devices. Seen on PDC or HP-UX, under "56/52" the
> > SCSI controller is present, further the parallel interface and the
> > serial MUX also should be found.
> 
> This make sense.....
> 
> What type of bus is at 56?  The walk_native_bus (as the comments
> and function name indicates) only walks native busses.  It does
> look like this function should be called and work for this bus
> since it is a bus converter instead of a bus adapter.
> 
> let me know what type of your central bus (I'm assuming GSC), and
> the what is the type of your lower bus and I'll see what I can
> find for you.
> 
> > Do we use the wrong search address here, taken from io_io_low of
> > the `struct bc_module'. Do we access it in a wrong way ?
> > Is THIS structure documented in any of the PARISC documents, other-
> > wise, where does this structure come from ?
> 
> This structure is a specialized version of the io_module structure.
> I have not found any external documentation describing it, I have
> mainly figure out it out from scattered internal documentation and
> HP-UX source.
> 
> Not many hints, but I'll work with you to get this figured out.
> 
> Thanks,
> 
> - Ryan
> 
> > I hope you have some hints here ...
> >
> > Best regards
> > Christoph P.
> >
> > --
> > -------------------------------------------------------
> > private:      christoph.plattner@gmx.at
> > company:      christoph.plattner@alcatel.at
> >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

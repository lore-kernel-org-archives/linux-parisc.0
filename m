Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2825C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Jul 2002 21:17:36 -0600 (MDT)
Subject: Re: [parisc-linux] Problem find devices on the E55 I/O interfaces
From: Ryan Bradetich <rbradetich@uswest.net>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3D1A377A.E0CFABBD@gmx.at>
References: <3D1A377A.E0CFABBD@gmx.at>
Content-Type: text/plain
Date: 01 Jul 2002 21:17:31 -0600
Message-Id: <1025579851.956.469.camel@beavis>
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

Hello Christoph,

Sorry for the late reply, had a great time at OLs.


On Wed, 2002-06-26 at 15:51, Christoph Plattner wrote:
> Hello PARISC hackers !
> 
> I have problems in the device probing on the E55, and I need some
> hints here. I am at the very starting point of the SCSI driver
> development, and other (Rayn) will also need this for MUX (serial),
> etc....
> 
> The E55 is a machine of the type "SYSTEM MAP TYPE".
> I instrumented the code to read out the values and elements at the
> inventory probing. I will append the log of my "debug helps", they
> are quite self explaining.
> 
> The `walk_central_bus()' calls seems to do correct work. It finds the 
> basic elements on my E55:
> 
> 	On the "56" the bus converter
> 	On "62" and "63" components on the system (main) board
> 	- "62" is the CPU, "63" the Memory
> 
> 	The search was started at the "60".
> 
> My problem now. The `walk_lower_bus()' under the device "56" cannot
> find any further devices. Seen on PDC or HP-UX, under "56/52" the
> SCSI controller is present, further the parallel interface and the 
> serial MUX also should be found.

This make sense.....

What type of bus is at 56?  The walk_native_bus (as the comments
and function name indicates) only walks native busses.  It does
look like this function should be called and work for this bus
since it is a bus converter instead of a bus adapter.

let me know what type of your central bus (I'm assuming GSC), and
the what is the type of your lower bus and I'll see what I can
find for you.

> Do we use the wrong search address here, taken from io_io_low of
> the `struct bc_module'. Do we access it in a wrong way ?
> Is THIS structure documented in any of the PARISC documents, other-
> wise, where does this structure come from ?

This structure is a specialized version of the io_module structure.
I have not found any external documentation describing it, I have
mainly figure out it out from scattered internal documentation and
HP-UX source.

Not many hints, but I'll work with you to get this figured out.

Thanks,

- Ryan


> I hope you have some hints here ...
> 
> Best regards
> Christoph P.
> 
> -- 
> -------------------------------------------------------
> private:	christoph.plattner@gmx.at
> company:	christoph.plattner@alcatel.at
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

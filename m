Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id F38C5482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Jun 2002 15:51:57 -0600 (MDT)
Received: from gmx.at ([62.178.92.247]) by viefep15-int.chello.at
          (InterMail vM.5.01.03.06 201-253-122-118-106-20010523) with ESMTP
          id <20020626215155.OJVW1259.viefep15-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Wed, 26 Jun 2002 23:51:55 +0200
Message-ID: <3D1A377A.E0CFABBD@gmx.at>
Date: Wed, 26 Jun 2002 23:51:54 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problem find devices on the E55 I/O interfaces
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

Hello PARISC hackers !

I have problems in the device probing on the E55, and I need some
hints here. I am at the very starting point of the SCSI driver
development, and other (Rayn) will also need this for MUX (serial),
etc....

The E55 is a machine of the type "SYSTEM MAP TYPE".
I instrumented the code to read out the values and elements at the
inventory probing. I will append the log of my "debug helps", they
are quite self explaining.

The `walk_central_bus()' calls seems to do correct work. It finds the 
basic elements on my E55:

	On the "56" the bus converter
	On "62" and "63" components on the system (main) board
	- "62" is the CPU, "63" the Memory

	The search was started at the "60".

My problem now. The `walk_lower_bus()' under the device "56" cannot
find any further devices. Seen on PDC or HP-UX, under "56/52" the
SCSI controller is present, further the parallel interface and the 
serial MUX also should be found.

Do we use the wrong search address here, taken from io_io_low of
the `struct bc_module'. Do we access it in a wrong way ?
Is THIS structure documented in any of the PARISC documents, other-
wise, where does this structure come from ?

I hope you have some hints here ...

Best regards
Christoph P.

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

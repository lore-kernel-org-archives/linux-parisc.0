Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from due.stud.ntnu.no (due.stud.ntnu.no [129.241.56.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59F8B4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Sep 2002 14:46:03 -0600 (MDT)
Date: Mon, 30 Sep 2002 22:45:59 +0200
From: Stian Soiland <stain@itea.ntnu.no>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 9000/802/K250 won't boot with images - serial/stack problem?
Message-ID: <20020930204559.GB9133@itea.ntnu.no>
References: <20020930200805.GA9133@itea.ntnu.no> <1033417191.31126.4.camel@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1033417191.31126.4.camel@beavis>
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

On 2002-09-30 22:19:51, Ryan Bradetich wrote:

> > The serial console is connected to 'CONSOLE (X/4/0/0)*',=20
> This is good, see .. we even find the device :)
> > 6. Sahp Baat Kiuh AP/MUX (5) at 0xf1900000 [10/4/0], versions 0x44,
> 0x0, 0xd
> > Command line for kernel: 'ramdisk_size=3D8192 root=3D/dev/ram console=
=3DttyS0
> Oops... this is bad.  The K class systems do not have a 16550 compatible
> serial port.  The console should be ttyB0.
> For mor info on the console, see Matthew's excellent description of what
> systems use the Serial Mux driver.
> http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/01783=
7.html

Aha! :=3D)

But with:

Command line for kernel: 'ramdisk_size=3D8192 root=3D/dev/ram console=3Dtty=
B0
TERM=3Dvt102 palo_kernel=3D0/vmlinux'

(..)

Branching to kernel entry point 0x00100098.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org


And that IS the last thing I see :/

with console=3DttyS0 at least more output came. How do I 'switch console'?=
=20


Do I need to connect something to this MDP-port instead?
(how? It is some inverted rs232 15-pin)

This happens with both vmlinux32 og 64.


--=20
Stian S=F8iland               There are only 10 types of people in the worl=
d:
ITEA systemdrift            Those who understand binary, and those who don'=
t.
http://www.stud.ntnu.no/   =20
                           =20

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C9D64829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Sep 2002 15:06:32 -0600 (MDT)
Subject: Re: [parisc-linux] 9000/802/K250 won't boot with images -
	serial/stack problem?
From: Ryan Bradetich <rbradetich@uswest.net>
To: Stian Soiland <stain@itea.ntnu.no>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020930204559.GB9133@itea.ntnu.no>
References: <20020930200805.GA9133@itea.ntnu.no>
	<1033417191.31126.4.camel@beavis>  <20020930204559.GB9133@itea.ntnu.no>
Content-Type: text/plain; charset=ISO-8859-1
Date: 30 Sep 2002 15:06:29 -0600
Message-Id: <1033419990.30622.11.camel@beavis>
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

Ah,

I am sorry.  I see the problem now :)

The problem is that /dev/ttyB0 does not have a registered major/minor
number.  We use a local on for the parisc-linux kernel.  Since we
/dev/ttyB0 is non-standard, the regular boot floppy from debian will
not boot this box.  I would suggest getting on from the ESIEE
team provides at:

	http://pateam.esiee.fr/cd-images/testing/

Specifically the images you are looking for have the -PDC in the name.=20
These kernels have the PDC Software Console enabled (which will work for
your system).

Thanks,

- Ryan

P.S. What would it take to get the default debian configs to compile in
the the Serial Mux, and to provide the /dev/ttyB0 from the parisc-linux
port by default in debian?  A patch to the debian def_configs and the
MAKEDEV package?


On Mon, 2002-09-30 at 14:45, Stian Soiland wrote:
> On 2002-09-30 22:19:51, Ryan Bradetich wrote:
>=20
> > > The serial console is connected to 'CONSOLE (X/4/0/0)*',=20
> > This is good, see .. we even find the device :)
> > > 6. Sahp Baat Kiuh AP/MUX (5) at 0xf1900000 [10/4/0], versions 0x44,
> > 0x0, 0xd
> > > Command line for kernel: 'ramdisk_size=3D8192 root=3D/dev/ram console=
=3DttyS0
> > Oops... this is bad.  The K class systems do not have a 16550 compatibl=
e
> > serial port.  The console should be ttyB0.
> > For mor info on the console, see Matthew's excellent description of wha=
t
> > systems use the Serial Mux driver.
> > http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017=
837.html
>=20
> Aha! :=3D)
>=20
> But with:
>=20
> Command line for kernel: 'ramdisk_size=3D8192 root=3D/dev/ram console=3Dt=
tyB0
> TERM=3Dvt102 palo_kernel=3D0/vmlinux'
>=20
> (..)
>=20
> Branching to kernel entry point 0x00100098.  If this is the last
> message you see, you may need to switch your console.  This is
> a common symptom -- search the FAQ and mailing list at parisc-linux.org
>=20
>=20
> And that IS the last thing I see :/
>=20
> with console=3DttyS0 at least more output came. How do I 'switch console'=
?=20
>=20
>=20
> Do I need to connect something to this MDP-port instead?
> (how? It is some inverted rs232 15-pin)
>=20
> This happens with both vmlinux32 og 64.
>=20
>=20
> --=20
> Stian S=F8iland               There are only 10 types of people in the wo=
rld:
> ITEA systemdrift            Those who understand binary, and those who do=
n't.
> http://www.stud.ntnu.no/   =20
>                            =20
>=20

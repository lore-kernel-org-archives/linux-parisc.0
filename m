Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA3B04829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Sep 2002 16:39:52 -0600 (MDT)
Message-ID: <3D98D2B9.659E5A0B@gmx.at>
Date: Tue, 01 Oct 2002 00:39:53 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Stian Soiland <stain@itea.ntnu.no>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 9000/802/K250 won't boot with images - serial/stack
 problem?
References: <20020930200805.GA9133@itea.ntnu.no> <1033417191.31126.4.camel@beavis> <20020930204559.GB9133@itea.ntnu.no>
Content-Type: text/plain; charset=iso-8859-1
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

As far as I see the problem: YES, you must use the
serial porton the MDP (port 0 !). Or use the PDC console
instead of MUX driver, then you are on the safe side,
concerning the console connecting method. The PDC
conolse driver takes that interface, which is configured
in the PDC monitor as console, independent of device
type, chips, ports, etc...

For a 15-pin layout, I cannot give you info. I only can
help on the MUX with the 25DB-SUB used on E55 and similar.

Christoph


Stian Soiland wrote:
> 
> On 2002-09-30 22:19:51, Ryan Bradetich wrote:
> 
> > > The serial console is connected to 'CONSOLE (X/4/0/0)*',
> > This is good, see .. we even find the device :)
> > > 6. Sahp Baat Kiuh AP/MUX (5) at 0xf1900000 [10/4/0], versions 0x44,
> > 0x0, 0xd
> > > Command line for kernel: 'ramdisk_size=8192 root=/dev/ram console=ttyS0
> > Oops... this is bad.  The K class systems do not have a 16550 compatible
> > serial port.  The console should be ttyB0.
> > For mor info on the console, see Matthew's excellent description of what
> > systems use the Serial Mux driver.
> > http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017837.html
> 
> Aha! :=)
> 
> But with:
> 
> Command line for kernel: 'ramdisk_size=8192 root=/dev/ram console=ttyB0
> TERM=vt102 palo_kernel=0/vmlinux'
> 
> (..)
> 
> Branching to kernel entry point 0x00100098.  If this is the last
> message you see, you may need to switch your console.  This is
> a common symptom -- search the FAQ and mailing list at parisc-linux.org
> 
> And that IS the last thing I see :/
> 
> with console=ttyS0 at least more output came. How do I 'switch console'?
> 
> Do I need to connect something to this MDP-port instead?
> (how? It is some inverted rs232 15-pin)
> 
> This happens with both vmlinux32 og 64.
> 
> --
> Stian Søiland               There are only 10 types of people in the world:
> ITEA systemdrift            Those who understand binary, and those who don't.
> http://www.stud.ntnu.no/
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] hwpath for superio serial console
Date: Sun, 16 Jan 2005 01:09:42 -0700
Message-ID: <20050116080942.GB20183@colo.lackof.org>
References: <20050116054728.GS30982@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050116054728.GS30982@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jan 16, 2005 at 05:47:28AM +0000, Matthew Wilcox wrote:
> # cat console/*
> [10/0/14/1/1]
> 643 
> 
> To my mind, this is a broken hwpath.

It is.
We can even detect those - the PCI dev/func needs to be
encoded as "func<<5 | dev" (ie 10/0/46/1) if it wanted
to follow the expected convention.

> 10/0/14/1/1 (PCI device 1.1)

It should be "10/0/14/1.1".

> We're actually supposed to decode this as:
> 
> 10/0 (PA)
> 10/0/14/1 (PCI device 0e.1)

So far so good.

> 10/0/14/1/1 (subfunction 1?)

no - see above.

> This isn't consistent breakage, only for serial console hwpath on
> a sprockets machine.

Right - someone botched how to display suckyio serial ports.
Maybe this was an attempt to make it consistent with other
serial ports not using "layers" to identify the port.

> To my mind, SERIAL_1 should have been reported by a hwpath of 10/0/14/1
> and then two layers -- the first being 1 or 2 for SERIAL_1 vs SERIAL_2,
> and the second encoding 9600.8.none (which seems to be 643 for some
> reason).

Yes.

> How should we be handling this?

Probably just ignore it. It's just a "handle" and people will have
to manually handle it as a quirk.

Try "in io" and see what it says for SERIAL_1 and SERIAL_2
on the astro based workstation.
My j6k show's it as 10/0/14/1/1.
So I think it's ok if Linux is consistent with what firmware displays.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

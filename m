Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 22 Jun 2003 23:04:50 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030623050450.GA449@dsl2.external.hp.com>
References: <03f301c3309e$f0c78740$d908f3d8@uvsolutions> <20030613043356.GA7265@dsl2.external.hp.com> <3EEC9AC2.5070106@tiscali.be> <20030615161948.GA12995@dsl2.external.hp.com> <3EF46AA9.7040703@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3EF46AA9.7040703@tiscali.be>
Subject: [parisc-linux] Re: ATY RAGE XL progress or Dino gscpci bridge pb?[was: Re: HP C180 video card]
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

On Sat, Jun 21, 2003 at 02:24:41PM +0000, Joel Soete wrote:
...
> c) if I try to use Equinox serial mux (8P) (an oem HP product) module 
> (with our without your patch Grant) the system crashes also?

I haven't tested the Serial 8p PCI card under parisc yet.
To date, that card has always lived in a x86 host. I just
haven't had time to play with it under parisc - I've needed it
working to get other things done.


> The system is a B180 model using Dino GSCPCI bridge and in the two cases 
> (even if messages are a bit different) the TOC shows always a pb on this 
> bus (the analyse of toc after the crash of insmod eqnx point out a pb in 
> timer_? routine).

The symptom is very likely only similar and not identical.
I'd find it very odd if both cards crashed for the same reason.

AFAICT, eqnx driver doesn't call pci_enable_device().  The bug I'd be
looking for is a PCI "resource" (BAR) to be accessed before it was enabled.
Try adding a pci_enable_device() to eqnx_init() or eqx_pci_buspresent().
[ *gag* I'm surprised this code even works on x86. ]

PARISC "hard fails" when reading from disabled or non-existant PCI
address space while x86 "soft fails".  ie x86 gets garbage back on
a "bad" read while PARISC will crash.

The crash in the timer routine is interesting and would make it
interesting for me to move the equinox card to an a500.
Randolph, Paul (Bame), and I occcasionally try to track down the
timer problems that plague SMP under 64-bit parisc kernels.


> And in fact I figure out that I never have to use this 
> bridge for another card?

GSCtoPCI connects the PCI slot to the rest of the system.
Try "lspci" and see what you have connected.

> Is somebody else used it successfuly or could it be broken?

Dino worked fine before.
I ran B180 as my desktop for over a year (my desktop is now a C3000).

grant

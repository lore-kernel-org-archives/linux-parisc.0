Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 16 Feb 2003 01:24:04 -0700
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] J3592A hp product
Message-ID: <20030216082404.GB18888@dsl2.external.hp.com>
References: <3E48441000001767@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E48441000001767@ocpmta7.freegates.net>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Fri, Feb 14, 2003 at 05:48:35PM +0100, Joel Soete wrote:
> Hi all,
> 
> I have a PCI SerialMux (8ports) which I put back in my b180.

I'll assume you are talking about the HO board here.

> a cat /proc/pci learn me that it seems to be an 'Equinox System' card:
> root@fw01:~# cat /proc/pci
> PCI devices found:
>   Bus  0, device   1, function  0:
>     Serial controller: PCI device 113f:90f0 (Equinox Systems, Inc.) (rev
> 4).
>       IRQ 96.
>       Non-prefetchable 32 bit memory at 0xf0ff0000 [0xf0ffffff].
> 
> Is it possibly true?

yes. This board is the SST-8P with a different device ID.
Mail that I've exchanged with Equinox about this explained they
are contractually prohibited from supporting this board with
non-HPUX drivers.

Anyway, a few lines changes (I don't have the patch handy)
based on this note should be sufficient:
| p.s.,  I can tell you that the standard SST-8P ID is 0x9090 in case
| that helps you debug your baud rate problem.

Add a few case statements where you find "case 0x9090".
I know this hack works with 4.04 eqnx driver becuase I'm using
the same HP card in an x86 machine linux as a console server.
Sorry - I don't have a patch handy or know exactly where I keep
the source for that at the moment.

> On Equinox site it seems that drivers is included into Linux kernel.
> I have only found reference to this driver into drivers/pci/devices.h.

uhm...no. Maybe 2.5 kernels or something. I've put the original
tarballs I found on:
	ftp://gsyprf10.external.hp.com/pub/equinox

> Is somebody could advise me on howto insert this driver into kernel?

I use modprobe.  :^P
IIRC, the tarball has a readme on how to build/install.

grant

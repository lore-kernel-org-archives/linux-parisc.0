From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: [PATCH-RFC 07/10] parisc: switch to GENERIC_PCI_IOMAP
Date: Mon, 5 Dec 2011 10:23:17 -0800
Message-ID: <CANEJEGuHpT-SWEbRVN0WXbOSBcbP8HDhFjKjxUfShyV84pqazw@mail.gmail.com>
References: <cover.1322163031.git.mst@redhat.com>
	<9dab609cdf0c22a35f58b0f821a10230a487480d.1322163031.git.mst@redhat.com>
	<20111204104817.GI15464@redhat.com>
	<1323008554.3003.4.camel@dabdike.int.hansenpartnership.com>
	<20111204143000.GB21238@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20111204143000.GB21238@redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Dec 4, 2011 at 6:30 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
...
> AFAIK, on PCI a resource is either IO or MEM, but never both.
> What am I missing?

Yes, a particular PCI BAR (Base Address Register) is either IO or MEM
(not both) address space resource.

James is observing many older devices have the same set of registers
mapped in both address spaces using two BARs. As you already know,
MMIO is "lighter weight" (CPU cost to generate transactions on PCI
bus). I think this is orthogonal to the issue you are addressing.

Regarding handling of IO Port space cookies:
> -     if (flags & IORESOURCE_IO)
> -             return ioport_map(start, len);

I don't know who all the consumers of pci_iomap() are. If user space
can somehow call this, it should fail for IO port space "mappings"
since unlike x86, parisc has no INB/OUTB instructions. Generating IO
Port space requires frobbing PCI Bus controller registers that I don't
think we want to expose to user space.

I'm going to assume this is NOT a problem since any code that
generates anything that tries to look like an INB/OUTB just won't
compile on parisc.  I think removing the parisc specific definition
and using the generic one instead looks fine to me.  But I'm not
confident enough to offer a formal ACKed-by line. Sorry. :(

cheers,
grant

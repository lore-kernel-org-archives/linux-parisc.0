From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 16:26:16 -0500
Message-ID: <200408311626.16860.mszick@wolfbutter.com>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831192112.GH20353@colo.lackof.org>
	<20040831192811.GB642@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040831192811.GB642@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue August 31 2004 14:28, Matthew Wilcox wrote:
> On Tue, Aug 31, 2004 at 01:21:12PM -0600, Grant Grundler wrote:
> 
> In any case, ISA devices don't have subdevices.
> 
Perhaps not in the sense you are speaking of (not
in the terms that PCI does)...

But, for instance, DigiBoard has 4, 8, (16?) subdevices
which are distingushed in the driver in cooperation with
the on-board processor.

Probably would fall into your irq tree just like an hp
buss device that doesn't let you diddle the interrupt
sources/assignment the other side of the device/
controller.

My point;
Perhaps you'll need to allow for a next
level tree at each EISA/ISA interrupt to support multi-port
serial boards and other 'intelligent' controllers.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

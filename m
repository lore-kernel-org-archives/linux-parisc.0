Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83E95486B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 15:56:05 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17PVct-0006yz-00; Tue, 02 Jul 2002 22:56:00 +0100
Date: Tue, 2 Jul 2002 22:55:59 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Christoph Plattner <christoph.plattner@gmx.at>,
	Ryan Bradetich <rbradetich@uswest.net>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Problem find devices on the E55 I/O interfaces
Message-ID: <20020702225559.G27706@parcelfarce.linux.theplanet.co.uk>
References: <3D1A377A.E0CFABBD@gmx.at> <1025579851.956.469.camel@beavis> <3D22101D.74982658@gmx.at> <christoph.plattner@gmx.at> <20020702212501.84BD14861@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020702212501.84BD14861@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Tue, Jul 02, 2002 at 03:25:01PM -0600
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

On Tue, Jul 02, 2002 at 03:25:01PM -0600, Grant Grundler wrote:
> Christoph Plattner wrote:
> > Here is one question: Although I a have hardware knowledge, I am
> > not fix HP terminology here.
> > Can you give me some hints here with the kewords "main bus", 
> > "lower bus", etc...
> 
> "central bus" = bus which connects all CPUs with all Memory.
> On N-class this would be the Merced Bus.
> On C3000 it's the runway bus.
> On 712 is the GSC bus.

E class is probably different somehow.  It has a PCX-L chip in it, so the
only external bus from that chip is the GSC bus.  Look at the ioscan output
from the hwdb:

:pa:F:F:F:-1:-1:4294967295:bc:root:::0:root:root:CLAIMED:BUS_NEXUS::0
pa:pa:F:F:F:-1:-1:4294967295:bc:bus_converter:56:80 48 0 71 0 0 12 0 0 0 0 0 0 0 0 0 :1:root.bc:bc:CLAIMED:BUS_NEXUS:Bus Converter:1
pa:sio:F:F:F:-1:-1:4294967295:ext_bus:scsi3:56/40:0 64 128 132 0 0 59 128 6 0 0 0 43 6 0 2 :0:root.bc.scsi3:scsi3:CLAIMED:INTERFACE:HP 28696A - Wide SCSI ID=7:0
pa:sio:F:F:F:-1:-1:4294967295:ext_bus:scsi1:56/52:4 64 128 132 0 0 57 128 4 0 0 0 21 136 0 3 :1:root.bc.scsi1:scsi1:CLAIMED:INTERFACE:HP 28655A - SE SCSI ID=7:1pa:sio:F:T:F:-1:76:131072:ext_bus:cent0:56/53:0 64 0 5 0 0 58 128 0 0 0 0 0 0 0 0 :2:root.bc.lpr2:lpr2:CLAIMED:INTERFACE:HP 28655A - Parallel Interface:2
pa:sio:F:T:F:-1:193:0:tty:mux2:56/56:4 64 128 133 16 0 13 0 3 0 0 0 80 252 0 2 :0:root.bc.mux2:mux2:CLAIMED:INTERFACE:MUX:0
pa:core:F:F:F:-1:-1:4294967295:ba:core_adapter:60:1 17 128 11 0 0 129 0 0 0 0 0 0 0 0 0 :0:root.bus_adapter:bus_adapter:CLAIMED:BUS_NEXUS:Core I/O Adapter:0
core:wsio:F:T:F:-1:52:0:lan:lan2:60/6:1 17 128 138 0 0 138 0 2 0 0 0 219 151 0 2 :0:root.bus_adapter.lan2:lan2:CLAIMED:INTERFACE:Built-in LAN:0
pa:pa:F:F:F:-1:-1:4294967295:processor:processor:62:72 49 0 0 0 0 4 129 0 0 0 0 0 0 0 0 :0:root.processor:processor:CLAIMED:PROCESSOR:Processor:0
pa:pa:F:F:F:-1:-1:4294967295:memory:memory:63:2 80 31 1 0 0 9 0 0 0 0 0 0 0 0 0 :0:root.memory:memory:CLAIMED:MEMORY:Memory:0

(I trimmed out the SCSI devices.)

The device at iopath 60 is clearly Lasi.  The device at iopath 56 is
_reported as_ Java BC GSC+ Port which is obviously wrong.  Ditto the E45
(claims to have a Uturn-IOA BC GSC+ Port), E35 (U2-IOA BC GSC+ Port)
and E25 (GeckoBOA BC GSC+ Port).  Anyone on this list know what device
was _actually_ used in the E class machines?  And do they have docs
for it?  ;-)

I expect that the bus below 56/ is actually an HP-PB bus because of the
devies it claims to have on it.

-- 
Revolutions do not require corporate support.

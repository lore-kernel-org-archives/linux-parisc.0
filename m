From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 20:28:11 +0100
Message-ID: <20040831192811.GB642@parcelfarce.linux.theplanet.co.uk>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831171421.GC20353@colo.lackof.org>
	<20040831174357.GQ16196@parcelfarce.linux.theplanet.co.uk>
	<20040831180635.GF20353@colo.lackof.org>
	<20040831185750.GS16196@parcelfarce.linux.theplanet.co.uk>
	<20040831192112.GH20353@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040831192112.GH20353@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 31, 2004 at 01:21:12PM -0600, Grant Grundler wrote:
> On Tue, Aug 31, 2004 at 07:57:50PM +0100, Matthew Wilcox wrote:
> > > Looks like that's what ia64 is doing and I don't see a problem with it.
> > 
> > ia64 doesn't have Lasi.
> 
> No, but ia64 supports ISA. :^)
> (They have their own evils to deal with)

Er.  Says who?

$ grep ISA arch/ia64/Kconfig 
          your box. Other bus systems are ISA, EISA, MicroChannel (MCA) or
config DISABLE_VHPT
$ grep ISA drivers/parisc/Kconfig 
menu "Bus options (PCI, PCMCIA, EISA, GSC, ISA)"
          715/100.  Wax includes an EISA adapter, a serial port (not always
config EISA
        bool "EISA support"
          Say Y here if you have an EISA bus in your machine.  This code
          supports both the Mongoose & Wax EISA adapters.  It is sadly
config ISA
        bool "ISA support"
        depends on EISA
          If you want to plug an ISA card into your EISA bus, say Y here.

So PA-RISC supports ISA and ia64 doesn't :-P

In any case, ISA devices don't have subdevices.

> Seriously, what problem does LASI bring that can't be handled with
> a global array?

The subdevices that can't have their own processor interrupt.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 30 Sep 2003 13:03:29 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Matthew Wilcox <willy@debian.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rene Brothuhn <rene.br@web.de>, Roman Zippel <zippel@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org,
	Linux/PPC on APUS development <linux-apus-devel@lists.sourceforge.net>
Subject: Re: [parisc-linux] Re: NCR53c720
Message-ID: <20030930190329.GC7391@dsl2.external.hp.com>
References: <Pine.GSO.4.21.0309301019390.7902-100000@vervain.sonytel.be> <1064929633.2183.7.camel@mulgrave> <20030930135914.GW24824@parcelfarce.linux.theplanet.co.uk> <1064935949.1930.6.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1064935949.1930.6.camel@mulgrave>
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

On Tue, Sep 30, 2003 at 10:32:23AM -0500, James Bottomley wrote:
> What I did for PA was to create a parisc bus type, and attach all the
> inventoried hardware to it.  This blurs the bus distinction in generic
> device because we have several inventoried buses: Runway, GSC, LASI etc.
> that are all lumped under the parisc bus.

All those busses conform to the HP IO ADC and thus could be
considered the same type of bus. Except for LASI, the above makes
sense to me.

LASI isn't a bus. This would be a candidate for "platform device"
since it's bridge-like device with integrate sub-devices.
EISA bridge chips might be a similar case.

> I was just wondering if it wouldn't make more sense now for us to be
> using platform devices too...

I don't understand "platform devices" vs "PCI devices" unless we
are talking about "custom", arch specific bridge chips.
A GSC device is a GSC device regardless of which board it's soldered to.
That's not the case for PCI?

grant

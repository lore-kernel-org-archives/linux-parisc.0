Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D934B484B
	for <parisc-linux@parisc-linux.org>; Tue, 30 Sep 2003 07:59:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A4L23-0001rO-0k; Tue, 30 Sep 2003 14:59:15 +0100
Date: Tue, 30 Sep 2003 14:59:14 +0100
From: Matthew Wilcox <willy@debian.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Matthew Wilcox <willy@debian.org>, Rene Brothuhn <rene.br@web.de>,
	Roman Zippel <zippel@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org,
	Linux/PPC on APUS development <linux-apus-devel@lists.sourceforge.net>
Subject: Re: [parisc-linux] Re: NCR53c720
Message-ID: <20030930135914.GW24824@parcelfarce.linux.theplanet.co.uk>
References: <Pine.GSO.4.21.0309301019390.7902-100000@vervain.sonytel.be> <1064929633.2183.7.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1064929633.2183.7.camel@mulgrave>
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

On Tue, Sep 30, 2003 at 08:47:11AM -0500, James Bottomley wrote:
> On Tue, 2003-09-30 at 03:21, Geert Uytterhoeven wrote:
> > BTW, A4000T SCSI is builtin, not Zorro, so we need a platform device for that.
> 
> That depends on how you want it to work.  On parisc, the Lasi (SCSI and
> other) devices are technically "platform" in that they're all ASIC'd
> together and soldered on to the main board.  However, it was easier to
> create a parisc_bus type and lump them all under it than to use a
> platform device....however, we did this in the very early days of the
> generic device, a platform device might be more appropriate now.

It makes a lot of sense to treat all the devices that firmware tells us
about as parisc_devices since we treat them all the same way.  If we
were stepping over ourselves saying "well, yes, this is a pluggable
device and therefore we have to access it like that, but this one's
on the motherboard and therefore we treat it like that", I'd agree.
But all these devices are in the same namespace, firmware tells us
about all of them in the same way, so I think we should continue with
the parisc_device.

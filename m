Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06C8F4840
	for <parisc-linux@parisc-linux.org>; Tue, 30 Sep 2003 09:33:13 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8UFWRq16752;
	Tue, 30 Sep 2003 11:32:27 -0400
Subject: Re: [parisc-linux] Re: NCR53c720
From: James Bottomley <James.Bottomley@steeleye.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rene Brothuhn <rene.br@web.de>, Roman Zippel <zippel@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org,
	Linux/PPC on APUS development <linux-apus-devel@lists.sourceforge.net>
In-Reply-To: <20030930135914.GW24824@parcelfarce.linux.theplanet.co.uk>
References: <Pine.GSO.4.21.0309301019390.7902-100000@vervain.sonytel.be>
	<1064929633.2183.7.camel@mulgrave>
	<20030930135914.GW24824@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 30 Sep 2003 10:32:23 -0500
Message-Id: <1064935949.1930.6.camel@mulgrave>
Mime-Version: 1.0
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

On Tue, 2003-09-30 at 08:59, Matthew Wilcox wrote:
> It makes a lot of sense to treat all the devices that firmware tells us
> about as parisc_devices since we treat them all the same way.  If we
> were stepping over ourselves saying "well, yes, this is a pluggable
> device and therefore we have to access it like that, but this one's
> on the motherboard and therefore we treat it like that", I'd agree.
> But all these devices are in the same namespace, firmware tells us
> about all of them in the same way, so I think we should continue with
> the parisc_device.

Yes, I was just musing about the way we did it.  In theory, the
difference between a "platform" device and a generic device is that a
generic device has a bus, and a platform one doesn't.  The
platform_device also has a resource pointer and a few other bits and
pieces the generic device doesn't.

What I did for PA was to create a parisc bus type, and attach all the
inventoried hardware to it.  This blurs the bus distinction in generic
device because we have several inventoried buses: Runway, GSC, LASI etc.
that are all lumped under the parisc bus.

I was just wondering if it wouldn't make more sense now for us to be
using platform devices too...

James


> >From a historical perspective, we've had parisc_devices in
> one form or another since the very start of the project.
> They were called hp_devices until about August 2001.  See
> http://ftp.parisc-linux.org/patches/parisc_device-2.diff for the
> conversion.
> 
> I don't know much about Amiga/Zorro.  Maybe it'd make sense for Amiga
> platform devices to be faked as zorro_devices, but I doubt it.  In
> any case, the 4000T SCSI is a 53c710, not a 720.
> 
> -- 
> "It's not Hollywood.  War is real, war is primarily not about defeat or
> victory, it is about death.  I've seen thousands and thousands of dead bodies.
> Do you think I want to have an academic debate on this subject?" -- Robert Fisk

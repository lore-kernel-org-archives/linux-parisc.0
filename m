Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Sat, 09 Nov 2002 17:50:10 GMT." <20021109175010.V12011@parcelfarce.linux.theplanet.co.uk>
References: <200211090128.RAA31693@adam.yggdrasil.com> <adam@yggdrasil.com> <20021109015611.571B44829@dsl2.external.hp.com> <20021109034612.S12011@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20021109170206.DA635482A@dsl2.external.hp.com>  <20021109175010.V12011@parcelfarce.linux.theplanet.co.uk> 
Date: Sat, 09 Nov 2002 12:03:17 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021109190317.61DEA4829@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> F-I class kept PCX-T processors to the bitter end.  You're thinking of
> E class, I think, which are all PCX-L.

Ah ok - I probably am. It's been a few years since I've worked with
Nova class machines.

> Really, we're just waiting for
> a V class to turn up in resource recovery to start work ;-)

Won't be too much longer ;^)

> Looking at the T600 in the hwdb..
>         Miura LAN/Console (J2146A) -- completely unlike anything else
> 	Countach LAN/Console -- same as Diablo & KittyHawk CSY LAN/Console,
> 				doubt we care.
> 	Skunk SCSI -- its the SPIFI chip, probably supportable.
> 	Wizard SCSI -- also in E/K class, probably supportable too.
> 	Skunk Centronics -- also in E/K class, probably supportable.
> 	Emerald Console -- unique
> 	Java IOA -- unique

Java is a U2/UTurn compatible chip that only provides an IOMMU.
It's *NOT* IO Coherent.

Jolt is missing. It's the "Summit" to "Runway" busconverter.
Doesn't need any OS code execept when doing bus walks.

> there's actually less unsupportable hardware in there than i thought,
> but i'm still not really interested in it.

ditto - me either. I've suffered enough for that machine.

grant

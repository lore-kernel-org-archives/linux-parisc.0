Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BC65482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 10:50:14 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18AZkI-00026b-00; Sat, 09 Nov 2002 17:50:10 +0000
Date: Sat, 9 Nov 2002 17:50:10 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Message-ID: <20021109175010.V12011@parcelfarce.linux.theplanet.co.uk>
References: <200211090128.RAA31693@adam.yggdrasil.com> <adam@yggdrasil.com> <20021109015611.571B44829@dsl2.external.hp.com> <20021109034612.S12011@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20021109170206.DA635482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021109170206.DA635482A@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sat, Nov 09, 2002 at 10:02:06AM -0700
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

On Sat, Nov 09, 2002 at 10:02:06AM -0700, Grant Grundler wrote:
> Right. I'm convinced support for V-class (PCI, IO Coherent) will happen
> before T-class (propritary busses, !IO-coherent). Later FGHI-class also
> use PCX-L CPU and thus should be ok. rbrad, christoph and a few others
> are working on support for those machines but I know SCSI on those
> machines is SPIFI-based (HP SCSI controller). In short, looks like
> your observations about 53c720 might be one of the few problematic
> drivers.

F-I class kept PCX-T processors to the bitter end.  You're thinking of
E class, I think, which are all PCX-L.  Really, we're just waiting for
a V class to turn up in resource recovery to start work ;-)

Looking at the T600 in the hwdb..
        Miura LAN/Console (J2146A) -- completely unlike anything else
	Countach LAN/Console -- same as Diablo & KittyHawk CSY LAN/Console,
				doubt we care.
	Skunk SCSI -- its the SPIFI chip, probably supportable.
	Wizard SCSI -- also in E/K class, probably supportable too.
	Skunk Centronics -- also in E/K class, probably supportable.
	Emerald Console -- unique
	Java IOA -- unique

there's actually less unsupportable hardware in there than i thought,
but i'm still not really interested in it.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 037EC482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 23:29:04 -0700 (MST)
Date: Wed, 13 Nov 2002 07:28:59 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: no one <neverbefound@subdimension.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Newbie found an hp 712-80 :)
Message-ID: <20021113062859.GD25768@charite.de>
References: <20021112221141.2d2792f0.neverbefound@subdimension.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021112221141.2d2792f0.neverbefound@subdimension.com>
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

On Tue, Nov 12, 2002 at 10:11:41PM +0000, no one wrote:

> Yesterday I realised that the cute little box sitting by the bin for
> 3 weeks was actually a computer - a hp 712-80 to be precise; and I am

Yes, that happened here as well. The HP-UX on the box was toast.

> It came with no floppy, no harddrive, and no memory - I've bought a
> el-cheapo 2nd hand generic 2Gb SCSI drive; and now need to squeeze
> linux onto it :)

You still need memory :)

> As soon as I find myself some simms, I'll be able to get past the
> pretty hardware-failure screen (look! it even draws where the
> failing/missing part is on the motherboard!) and have the following
> installation method planned out.

I like that.

> 1) Setup dhcpd on my slackware box to serve the 'lifimage' for the latest net-boot iso
> 2) Lan-Boot the 712 with a crossover-cable into the main computer, via dhpcd
> (don't want to confuse true lan dhpcd requests...)
> 3) This lifimage will load a kernel and a initrd with the standard debian install tools.
> 4) I could now 'ifconfig eth0 down', plug the hp into the actual lan, bring the net connection back up (dhcp or static lan config...)
> 5) Do a install from my closest debian mirror.

Yup.

> I'm sure there must be a fatal flaw in there somewhere... after
> reading through all those fearful references to NFS-roots et al., it
> seems so simple now that I've written it down :)
> 
> Also, I read somewhere that you can flash the latest firmware to the
> machine by serving it the firmware as a net-boot image - is this
> correct?

Yes. Simply make the HP boot the firmware upgrade via tftp.

> Would it be safer by some other method? - for instance (no
> idea of actual possibility), copy the firmware to /boot & get AILO
> (sic?) to boot it...

On HP it's PALO.
-- 
Ralf Hildebrandt (Im Auftrag des Referat V a)   Ralf.Hildebrandt@charite.de
Charite Campus Mitte                            Tel.  +49 (0)30-450 570-155
Referat V a - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
The length of the signature is inversely proportional 
to the user's ability to use google.

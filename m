Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Peter Mottram <peter@petescaff.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] partitioned md to enable root on raid 
In-Reply-To: Message from Peter Mottram <peter@petescaff.com>
   of "Tue, 22 Jan 2002 00:13:51 +0100." <Pine.LNX.4.42.0201220007440.13910-100000@r6.petescaff.com>
References: <Pine.LNX.4.42.0201220007440.13910-100000@r6.petescaff.com> 
Date: Mon, 21 Jan 2002 19:20:33 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020122022033.C1685482A@dsl2.external.hp.com>
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

Peter Mottram wrote:
> You can construct MD devices out of whole disks or partitions but you
> cannot partition an MD device without Neil Brown's patches.

Ok. I don't think we really need or want this right now.

I would prefer patches that makes it harder for linus to accept our bits
get introduced right now. parisc-linux maintainers "own" arch/parisc
but have to fight for changes in other parts of the kernel like anyone
else. Even though, this patch sounds like a good thing.

> What I would
> like to achieve is to construct an MD device for use as a boot disk and
> then partition it including the F0 partition in order that the LIF is also
> mirrored. This cannot be done with a stock kernel.

You don't really need to mirror F0. The content is static for all
intents and purposes. One could mirror /  (and /boot if that's seperate)
across two partitions on seperate physcial disks and get basically the
same result.

> OK - maybe the answer is to construct non-mirrored F0 partitions on both
> boot disks and then use the rest of the disk for MD & boot from LVM
> partitions.

Exactly.

> Here's the next question - does palo understand how to
> boot from LVM?

No. HPUX LVM is derived from the same original sources as linux's LVM
but is not compatible. HP cannot release the disk layout since it's not
HP's to give away. MKP tried to reverse engineer it early in the port
and gave up after a while. While it would make migration from HPUX to
parisc-linux easier, I don't see it as essential.

grant

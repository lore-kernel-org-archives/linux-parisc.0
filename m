Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27CC7482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Dec 2001 21:45:37 -0700 (MST)
Message-Id: <200112120440.VAA03792@puffin.external.hp.com>
To: "James P. Kinney III" <jkinney@localnetsolutions.com>
Cc: palinux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] console switching with C160 Hyperdrive option card 
In-Reply-To: Message from "James P. Kinney III" <jkinney@localnetsolutions.com>
   of "11 Dec 2001 14:07:31 EST." <1008097651.31094.35.camel@archimedes.localnetsolutions.com>
Date: Tue, 11 Dec 2001 21:40:46 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

"James P. Kinney III" wrote:
> Grabbed a new kernel source from kernel.org and ran make oldconfig. I
> think it uses the current running kernel for a starting point.

A) It definitelly does not. You either need to find the config file
from the CD or something else.
B) forget kernel.org. parisc tree is at cvs.parisc-linux.org or
   ftp.parisc-linux.org (nightly cvs snapshots). parisc isn't
   fully merged back into linus's tree.

> Looked at the .config file afterwards. No sti frame buffer configured.
> Hmm.=20

Looking arch/parisc/defconfig:
CONFIG_FB=y
CONFIG_FB_STI=y

you just ahd the wrong source tree.

> More research. Current firmware is 2.1. Latest firmware from HP is 6.1.
> And it "fixes" some 3rd  party graphics card problems.

It fixes alot more than just that.
I believe 2.1 is the original firmware shipped with the machine.
6.1 *will* disable PCI if anything other than an HP PCI grapchis
card is plugged into a PCI slot *and* you have an "old" Dino.

> As soon as I get a blank tape, I'll upgrade the firmware (scary
> process!).

Yes. But you can do it via LAN/bootp too.
Boot the update image just a a kernel image as described
in previous emails to this list (eg NFS root).
(Archive is at lists.parisc-linux.org)

grant

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA07456
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Jun 1999 17:53:32 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id UAA10721
	for <parisc-linux@thepuffingroup.com>; Sat, 12 Jun 1999 20:01:06 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3762F4BE.C09B5CA9@thepuffingroup.com>
Date: Sat, 12 Jun 1999 20:01:02 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] It's finally sunk in: bye bye elf32
List-ID: <linux-parisc.vger.kernel.org>


Over the last week I've really spent a lot of time trying to get the
kernel to build and boot when crosss compiled from i386. This meant
using the existing broken elf32 implementation.

This was only to be a temporary solution until at some point we got a
proper ELF64 implementation from Cygnus, which we'd then fold back into
ELF32.  That's a long way off though, and it's important to move forward
on this port.

It's quite possible that we could have fixed up the broken elf32
implementation enough to build our kernel and bootloader, but the worry
is that there's a risk that it's going to be a huge pain.

So, I'm going to do an about face and change my mind completely about
the som/elf32 situation.  So far, Matt Wilcox, Alan Cox, Jef Law and
Chris Beard all seem to agree.  I'm just a bit slow in jumping on board.

There's two reasons I'm changing my mind somewhat suddenly:

- I had really bad nightmares last night about having to fix the broken
elf32 implementation, which I really don't understand, which would be
dumped later down the road, and for which there's a supported
implementation on HPUX.

- I spent the entire day building a deck in the sun; it made me come to
my senses and realize that I'd been arguing some of this because it's
the assumption I'd done my existing work on. It's sometimes difficult to
tear yourself away from the details of the problem and look at the
bigger picture.

So, I'm going to spend some time making the kernel build on HPUX.  I
know there's quite a few changes to make.  But I'll keep the elf
specific work, it'll help later on.

- Alex




- Alex

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06D6A489D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Sep 2001 07:23:30 -0600 (MDT)
Date: Sat, 29 Sep 2001 15:23:20 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 720 - some progress
In-Reply-To: <20010929134528.A25612@dogbert.localdomain>
Message-ID: <Pine.NEB.4.33.0109291517450.9349-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Albert,

> case18 is Jurij's first patch. case11 is his 2nd patch, which I had to
> add in my hand. Then jochen is jochen's additions to that (please check
> that I understood you correctly).

Yes, it's exactly what i meant...

I'm currently re-evaluating the case 18 stuff. Maybe Jurijs proposal about
checking for unaligned access using a decoded opcode might me faster than
dereferencing 3 page tables and having to decode the opcode anyways to
check for read vs write access...

The only question that remains is if the paging code will handle a
recursive trap gracefully (i.e. when the unaligned access emulation code
traps again because of a page fault).

Cheers,
Jochen

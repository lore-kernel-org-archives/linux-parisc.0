Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe54.law3.hotmail.com [209.185.240.54])
	by dsl2.external.hp.com (Postfix) with ESMTP id 898BE4831
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Aug 2002 09:40:34 -0600 (MDT)
From: "Alex Green" <alexdgreen@hotmail.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: "Paul Bame" <bame@fc.hp.com>,
	<parisc-linux@lists.parisc-linux.org>
References: <OE22Aztxc1o8yfogkJX00009958@hotmail.com> <20020807123807.GB9966@systemhalted> <OE50nwpGR881Np7vXee0000cb29@hotmail.com> <E17cSWK-0000pp-00@paul.bame> <OE21vQSK3sFilY05Dxp0000b0ff@hotmail.com> <20020807153647.GD12856@systemhalted>
Subject: Re: [parisc-linux] palo issues
Date: Wed, 7 Aug 2002 17:40:32 +0200
Message-ID: <OE543lwwxOO7UbnLxBj00004f97@hotmail.com>
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

I've rebuilt using make vmlinux, to remove all options for the wrong image
being built, however, even after reloading palo, it still has the same
error.

I'm now going back to look at the kernel build to check if I can anything
there.

----- Original Message -----
From: "Carlos O'Donell" <carlos@baldric.uwo.ca>
To: "Alex Green" <alexdgreen@hotmail.com>
Cc: "Paul Bame" <bame@fc.hp.com>; <parisc-linux@lists.parisc-linux.org>
Sent: Wednesday, August 07, 2002 5:36 PM
Subject: Re: [parisc-linux] palo issues


> On Wed, Aug 07, 2002 at 05:28:20PM +0200, Alex Green wrote:
> > I ran file against my new kernel and the output is the same as the
currently
> > booting kernel.
> >
> >
>
> I was decidedly wrong. While 'make bzImage' will produce the
> right vmlinux for you to use... you cannot use the actual bzImage
> because we don't support compressed kernel images in palo.
>
> Using the vmlinux in /usr/src/linux (or where your tree is) will
> get you to the right place :)
>
> c.
>

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe44.law4.hotmail.com [216.33.148.81])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61933482B
	for <parisc-linux@parisc-linux.org>; Wed, 24 Jul 2002 10:06:46 -0600 (MDT)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: "Richard Hirst" <rhirst@linuxcare.com>
Cc: "Matthew Wilcox" <willy@debian.org>,
	<parisc-linux@parisc-linux.org>
References: <OE32H8BX2vRxFmNHYus00008028@hotmail.com> <20020723150421.G3052@parcelfarce.linux.theplanet.co.uk> <OE71RBHZXFZ0stgr3SU00003162@hotmail.com> <20020724143958.GS29996@sleepie.demon.co.uk>
Subject: Re: [parisc-linux] unresoved symbols when doing a make modules_install
Date: Wed, 24 Jul 2002 18:06:30 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <OE44z4uqqtBqykC26qz00004754@hotmail.com>
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

I see.
Indeed, I'm not configuring any PCI or ISA slots, as my 712 doesn't have any
(at least I haven't seen any of these slots when I replaced the CMOS
battery). That's why I'm building my own kernels in the first place; to have
a kernel suited for my own box.
I assume if I would disable PCI and ISA on my 486 (hypothetically), the ppa
would have some unresolved symbols as well?
So, should I enable PCI or ISA to make the ppa module work? Or is there
another way around to use the ppa module without the PCI or ISA stuff?
Thanks.

Kenneth

----- Original Message -----
From: "Richard Hirst" <rhirst@linuxcare.com>
To: "kenneth westelinck" <kennywest1@hotmail.com>
Cc: "Matthew Wilcox" <willy@debian.org>; <parisc-linux@parisc-linux.org>
Sent: Wednesday, July 24, 2002 4:39 PM
Subject: Re: [parisc-linux] unresoved symbols when doing a make
modules_install


> On Wed, Jul 24, 2002 at 10:33:22AM +0200, kenneth westelinck wrote:
> > > i'm baffled.  we prototype, define and EXPORT_SYMBOL outs[bwl].  i
can't
> > > see why you'd get this error.
>
> But only if CONFIG_PCI or CONFIG_ISA, kenneth has neither in his config.
>
> Richard
>
>

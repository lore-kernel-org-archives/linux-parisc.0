Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E37D6482B
	for <parisc-linux@parisc-linux.org>; Wed, 24 Jul 2002 10:44:44 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17XPFj-0000EX-00; Wed, 24 Jul 2002 17:44:43 +0100
Date: Wed, 24 Jul 2002 17:44:43 +0100
From: Matthew Wilcox <willy@debian.org>
To: kenneth westelinck <kennywest1@hotmail.com>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] unresoved symbols when doing a make modules_install
Message-ID: <20020724174443.P3052@parcelfarce.linux.theplanet.co.uk>
References: <OE32H8BX2vRxFmNHYus00008028@hotmail.com> <20020723150421.G3052@parcelfarce.linux.theplanet.co.uk> <OE71RBHZXFZ0stgr3SU00003162@hotmail.com> <20020724143958.GS29996@sleepie.demon.co.uk> <OE44z4uqqtBqykC26qz00004754@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OE44z4uqqtBqykC26qz00004754@hotmail.com>; from kennywest1@hotmail.com on Wed, Jul 24, 2002 at 06:06:30PM +0200
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

On Wed, Jul 24, 2002 at 06:06:30PM +0200, kenneth westelinck wrote:
> Indeed, I'm not configuring any PCI or ISA slots, as my 712 doesn't have any
> (at least I haven't seen any of these slots when I replaced the CMOS
> battery). That's why I'm building my own kernels in the first place; to have
> a kernel suited for my own box.

right

> I assume if I would disable PCI and ISA on my 486 (hypothetically), the ppa
> would have some unresolved symbols as well?
> So, should I enable PCI or ISA to make the ppa module work? Or is there
> another way around to use the ppa module without the PCI or ISA stuff?
> Thanks.

the ppa module needs to be rewritten to consider that the parallel port
might be memory mapped.  it will never work on a PA box (except maybe
the B1000 / C3000 / J5000 range).

-- 
Revolutions do not require corporate support.

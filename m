Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 328AC482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 14:00:24 -0600 (MDT)
Date: Fri, 20 Apr 2001 14:00:03 -0600
To: "Eric S. Raymond" <esr@thyrsus.com>,
	Matthew Wilcox <willy@ldl.fc.hp.com>, linux-kernel@vger.kernel.org,
	parisc-linux@parisc-linux.org
Message-ID: <20010420140003.M4217@zumpano.fc.hp.com>
References: <20010419203639.H4217@zumpano.fc.hp.com> <20010419230009.A32500@thyrsus.com> <20010419211749.I4217@zumpano.fc.hp.com> <20010420154743.A19618@thyrsus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010420154743.A19618@thyrsus.com>; from esr@thyrsus.com on Fri, Apr 20, 2001 at 03:47:43PM -0400
From: willy@ldl.fc.hp.com (Matthew Wilcox)
Subject: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Apr 20, 2001 at 03:47:43PM -0400, Eric S. Raymond wrote:
> CONFIG_BINFMT_SOM: arch/parisc/config.in arch/parisc/defconfig
> 
> Not used in code anywhere.  Can you get rid of this one?

Code not merged yet.

> CONFIG_DMB_TRAP: arch/parisc/kernel/sba_iommu.c
> CONFIG_FUNC_SIZE: arch/parisc/kernel/sba_iommu.c
> 
> Would you please take these out of the CONFIG_ namespace?  Changing the 
> prefix to CONFIGURE would do nicely.

Grant?  This is your code.

> CONFIG_GENRTC: arch/parisc/defconfig
> 
> This is a typo for GEN_RTC.  Please fix it or get rid of it.

in our tree it's in drivers/char/Makefile:

obj-$(CONFIG_GENRTC) += genrtc.o

this code was written by Sam Creasey as part of the sun3 port, and he
schlepped it into our tree too.  we have no GEN_RTC in our tree.

> CONFIG_HIL: arch/parisc/defconfig
> 
> Looks like an orphan.  Can you get rid of it?

code not yet merged.

> CONFIG_SERIAL_GSC: drivers/char/serial.c arch/parisc/defconfig
> 
> That reference pattern looks kind of weird.  Is this a bug?

it's old and needs to die properly.  i haven't had time to fix that yet.

Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id UAA14464
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 20:16:20 -0700
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by atlrel1.hp.com (Postfix) with ESMTP id 14E1A9DB
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 22:18:31 -0500 (EST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA26713;
	Wed, 22 Nov 2000 14:03:07 +1100
Date: Wed, 22 Nov 2000 14:03:07 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "H . J . Lu" <hjl@valinux.com>
Cc: Ulrich Drepper <drepper@cygnus.com>, John Marvin <jsm@udlkern.fc.hp.com>,
        parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com,
        binutils@sourceware.cygnus.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
In-Reply-To: <20001121165327.A12804@valinux.com>
Message-ID: <Pine.LNX.4.21.0011221258270.16860-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 21 Nov 2000, H . J . Lu wrote:

> On Wed, Nov 22, 2000 at 11:13:29AM +1100, Alan Modra wrote:
> > 
> > > Anyway, the ABI value is zero unless you implement ELF extensions.
> > 
> > Exactly what is an "ELF extension"?  Anything outside gABI or
> 
> ELF extension is something whose interpretation is not documented in
> neither gABI nor psABI. HP's old ELF is a good example since it didn't
> implement DT_INIT/DT_FINI, but added DT_INIT_ARRARY/DT_FINI_ARRAY. A
> normal ELF tool will have a hard time to interpret those fields and
> their values.

Neither you nor Ulrich have responded to John's point that the IA64 psABI
states
  "The e_ident[EI_OSABI] value identifies the operating system and ABI to
   which the object is targeted"

Granted, this is only in a processor specific ABI, but it does flatly
contradict your assertions that the purpose of EI_OSABI is to flag the
presense of ELF extensions.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

Received: from mail.valinux.com (smtp-fwd.valinux.com [198.186.202.196])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id UAA14252
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 20:09:19 -0700
Received: from osmium.hdqt.valinux.com
	([10.3.1.14] helo=valinux.com ident=mail)
	by mail.valinux.com with esmtp (Exim 3.16 #1 (Debian))
	id 13yQJl-0003Wr-00; Tue, 21 Nov 2000 19:11:29 -0800
Received: by valinux.com (Postfix, from userid 561)
	id 392FAAD11; Tue, 21 Nov 2000 19:11:29 -0800 (PST)
Date: Tue, 21 Nov 2000 19:11:29 -0800
From: "H . J . Lu" <hjl@valinux.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Ulrich Drepper <drepper@cygnus.com>, John Marvin <jsm@udlkern.fc.hp.com>,
        parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com,
        binutils@sourceware.cygnus.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
Message-ID: <20001121191129.A4978@valinux.com>
References: <20001121165327.A12804@valinux.com> <Pine.LNX.4.21.0011221258270.16860-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0011221258270.16860-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Wed, Nov 22, 2000 at 02:03:07PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 22, 2000 at 02:03:07PM +1100, Alan Modra wrote:
> On Tue, 21 Nov 2000, H . J . Lu wrote:
> 
> > On Wed, Nov 22, 2000 at 11:13:29AM +1100, Alan Modra wrote:
> > > 
> > > > Anyway, the ABI value is zero unless you implement ELF extensions.
> > > 
> > > Exactly what is an "ELF extension"?  Anything outside gABI or
> > 
> > ELF extension is something whose interpretation is not documented in
> > neither gABI nor psABI. HP's old ELF is a good example since it didn't
> > implement DT_INIT/DT_FINI, but added DT_INIT_ARRARY/DT_FINI_ARRAY. A
> > normal ELF tool will have a hard time to interpret those fields and
> > their values.
> 
> Neither you nor Ulrich have responded to John's point that the IA64 psABI
> states
>   "The e_ident[EI_OSABI] value identifies the operating system and ABI to
>    which the object is targeted"
> 
> Granted, this is only in a processor specific ABI, but it does flatly
> contradict your assertions that the purpose of EI_OSABI is to flag the
> presense of ELF extensions.
> 

When I was at the IA64 ABI meeting yesterday, we were looking at the
EI_OSABI issue. Everyone at the IA64 ABI meeting agreed that what
Ulrich and I had said was the correct understanding.

"The e_ident[EI_OSABI] value identifies the operating system and ABI
to which the object is targeted" just means if the e_ident[EI_OSABI]
value is not ELFOSABI_NONE, you have to look somewhere else in addition
to gABI and IA64 psABI to interpret the ELF fields/values specific to
that OS. Otherwise, gABI and IA64 psABI are sufficient.

-- 
H.J. Lu (hjl@valinux.com)

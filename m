Received: from relay.nuxi.com (root@nuxi.cs.ucdavis.edu [169.237.7.38])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA03069
	for <parisc-linux@puffin.external.hp.com>; Sat, 25 Nov 2000 13:29:18 -0700
Date: Sat, 25 Nov 2000 12:31:08 -0800
From: "David O'Brien" <obrien@FreeBSD.org>
To: Ulrich Drepper <drepper@cygnus.com>
Cc: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@puffin.external.hp.com,
        parisc-linux@thepuffingroup.com, binutils@sourceware.cygnus.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
Message-ID: <20001125123108.E96258@dragon.nuxi.com>
Reply-To: obrien@FreeBSD.org
References: <Pine.LNX.4.21.0011221258270.16860-100000@front.linuxcare.com.au> <m3aeasitj6.fsf@otr.mynet.cygnus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m3aeasitj6.fsf@otr.mynet.cygnus.com>; from drepper@redhat.com on Tue, Nov 21, 2000 at 07:18:21PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 21, 2000 at 07:18:21PM -0800, Ulrich Drepper wrote:
> Alan Modra <alan@linuxcare.com.au> writes:
> >   "The e_ident[EI_OSABI] value identifies the operating system and ABI to
> >    which the object is targeted"
> > 
> > Granted, this is only in a processor specific ABI, but it does flatly
> > contradict your assertions that the purpose of EI_OSABI is to flag the
> > presense of ELF extensions.
> 
> The meaning of the field changed over time.  Or better said, some
> people initially understood it differently.

Then lets get the _official_ wording changed.  Obviously my
interpretation wasn't unreasonable.   And the world does not need to have
you as a premadona keeper of the [unwritten] rules of the land.
 
-- 
-- David  (obrien@FreeBSD.org)

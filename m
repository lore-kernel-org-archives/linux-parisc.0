Received: from relay.nuxi.com (root@nuxi.cs.ucdavis.edu [169.237.7.38])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA02437
	for <parisc-linux@puffin.external.hp.com>; Sat, 25 Nov 2000 13:20:29 -0700
Date: Sat, 25 Nov 2000 12:22:11 -0800
From: "David O'Brien" <obrien@FreeBSD.org>
To: Ulrich Drepper <drepper@cygnus.com>
Cc: Alan Modra <alan@linuxcare.com.au>, John Marvin <jsm@udlkern.fc.hp.com>,
        parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com,
        binutils@sourceware.cygnus.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
Message-ID: <20001125122211.A96258@dragon.nuxi.com>
Reply-To: obrien@FreeBSD.org
References: <Pine.LNX.4.21.0011220914180.16860-100000@front.linuxcare.com.au> <m3u290j488.fsf@otr.mynet.cygnus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m3u290j488.fsf@otr.mynet.cygnus.com>; from drepper@redhat.com on Tue, Nov 21, 2000 at 03:27:19PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 21, 2000 at 03:27:19PM -0800, Ulrich Drepper wrote:
> Alan Modra <alan@linuxcare.com.au> writes:
> 
> > Ulrich Drepper also was quite vehement against changing sourceware
> > FreeBSD binutils.
> 
> I've never said anything about any *BSD, why should I?  The *BSD
> people wanted to change the Linux binutils.

No (don't put words in my mouth Ulrich as you'll be wrong 99% of the
time).  I wanted the Sourceware Binutils to set the EI_OSABI to
"ELFOSABI_LINUX" when targeting Linux.
 
-- 
-- David  (obrien@FreeBSD.org)

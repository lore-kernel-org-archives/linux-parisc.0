Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA10633
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 17:26:26 -0700
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by atlrel2.hp.com (Postfix) with ESMTP id D49B2C41
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 19:28:32 -0500 (EST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA20785;
	Wed, 22 Nov 2000 11:13:29 +1100
Date: Wed, 22 Nov 2000 11:13:29 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Ulrich Drepper <drepper@cygnus.com>
Cc: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@puffin.external.hp.com,
        parisc-linux@thepuffingroup.com, binutils@sourceware.cygnus.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
In-Reply-To: <m3u290j488.fsf@otr.mynet.cygnus.com>
Message-ID: <Pine.LNX.4.21.0011221042300.16860-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 21 Nov 2000, Ulrich Drepper wrote:

> Alan Modra <alan@linuxcare.com.au> writes:
> 
> > Ulrich Drepper also was quite vehement against changing sourceware
> > FreeBSD binutils.
> 
> I've never said anything about any *BSD, why should I?  The *BSD
> people wanted to change the Linux binutils.

Sorry, I stated that badly.

> Anyway, the ABI value is zero unless you implement ELF extensions.

Exactly what is an "ELF extension"?  Anything outside gABI or
"gABI + psABI"?  Handly the latter, as it seems to me that a processor
specific ABI can specify extensions.  There's also the awkward possibility
that a psABI may specify an extension that is later incorporated into a
new revision of the gABI (eg. hpux and DT_INIT_ARRAY)  Does that mean that
if a new revision of the gABI completely incorporates all previous
extensions, that EI_OSABI should become zero?

Yes, I'm arguing that "No ELF extensions => EI_OSABI == 0" is not
necessarily true, but I'm _not_ arguing that changing x86 Linux binutils
is wise.  Historical usage is important.  If we were to change x86 Linux
binutils to set EI_OSABI, then that can only be after a considerable
period of time to allow code such as glibc to accept a new branding.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

Received: from rhirst.linuxcare.com (user-79-182.jakinternet.co.uk [194.88.79.182] (may be forged))
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA32016
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Dec 2000 11:55:15 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 0DF1CB005; Mon, 11 Dec 2000 18:52:32 +0000 (GMT)
Date: Mon, 11 Dec 2000 18:52:32 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Jes Sorensen <jes@linuxcare.com>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@puffin.external.hp.com,
        debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] A500 status update
Message-ID: <20001211185232.W7166@linuxcare.com>
References: <200012070634.WAA07459@milano.cup.hp.com> <d3d7ez6kb7.fsf@lxplus015.cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d3d7ez6kb7.fsf@lxplus015.cern.ch>; from jes@linuxcare.com on Mon, Dec 11, 2000 at 04:37:16PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Dec 11, 2000 at 04:37:16PM +0100, Jes Sorensen wrote:
> >>>>> "Grant" == Grant Grundler <grundler@cup.hp.com> writes:
> 
> Grant> o dd to
> Grant> raw disk isn't working right. "No space left on device".  See
> Grant> the output below.
> 
> Likely cause would be that the structs for stat don't match between
> the kernel and glibc. I still think the best approach would be to go
> for a clean 64 bit userland from the beginning as we have on the Alpha
> and ia64 and provide backwards compat support afterwards. I don't like
> to see the hppa64 port end up in the same situation as sparc64 where
> almost nothing gets done for years because there is already a 32 bit
> userland.

This 'no space' problem was caused by an error in the register save/
restore on interrupts, for 64 bit (assembly.h):

date: 2000/12/11 13:10:49;  author: rhirst;  state: Exp;  lines: +10 -0
cr11 (sar) is a funny one.  5 bits on PA1.1 and 6 bit on PA2.0.  For
PA2.0 mtsar or mtctl always write 6 bits, but mfctl only reads 5 bits.
Use mfctl,w to read all six bits.  Otherwise we loose the 6th bit on a
save/restore over interrupt.  Caused dd of=/dev/sdaX to report no space
available at random.

Richard

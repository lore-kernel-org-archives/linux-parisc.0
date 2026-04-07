Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872343CE4BF;
	Tue,  7 Apr 2026 18:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585476; cv=none; b=Sm1sCNSWQ/MovbpEaUpqwGQZztbnVjuIFzjuZyMuj4ZYPrb8XoWsHWttKaW+qUiEhqIpXiYrlYzxigREzUXCWpTJyU3eKFgDVKHL8UO+dGKHjHMHOHiqe0XXS189KoCTLUPcrxMjqOlgAOERF9yGDu8WKuNtNrvByKVxZ0rnQTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585476; c=relaxed/simple;
	bh=vDTlEqiqC5UHqGuIXw9lIYZkTwY1efmAPvGBekx8wSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+F5Q7OvVOvXyjXrGCE3gEELFMENZcSp+hTZS2nC2MI2uo+TD/6A7d76aKZzUND7A+R2HKqyNg0lz10FOtiwdaxGLZWhO77eV4nvsVngzk5ZrePZtMQNJ4digRETgNuPLrS0YNsSBZvdZn1y+WZutMFTLn5UB9j522u01r08fzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=aPX/oUCw; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="aPX/oUCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775585472;
	bh=vDTlEqiqC5UHqGuIXw9lIYZkTwY1efmAPvGBekx8wSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aPX/oUCwLnRnmG6BHe3J/tA1SGxSfA7qtHbyKu5WQJcVO1Do9LBtjizLs6tgmkBNo
	 vPtVoztLrvzRs6JzXcPhcWHq2PWem5pZmp8sK67mhtFw3XFeIqjPJ1hLN5zBQWY2Q0
	 phl3vrsTjlRzvAjVqqTStL8wzempqroE0IigHq0g=
Date: Tue, 7 Apr 2026 20:11:11 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH 2/3] selftests/nolibc: avoid function pointer comparisons
Message-ID: <57076239-4106-44ab-ae1f-9e731c882311@t-8ch.de>
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-2-f70b4509c44a@weissschuh.net>
 <d43a2894-9f78-4fc2-b228-2c29ef6daa58@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d43a2894-9f78-4fc2-b228-2c29ef6daa58@gmx.de>

On 2026-04-07 19:20:12+0200, Helge Deller wrote:
> On 4/7/26 18:37, Thomas Weißschuh wrote:
> > The upcoming parisc support would require libgcc to implement function
> > pointer comparisons. As we try to avoid the libgcc dependency rework
> > the logic to work without such comparisons.
> 
> Instead of working around at this specific code, I think it makes more sense
> to simply add the __canonicalize_funcptr_for_compare() symbol somewhere.
> Code is in arch/parisc/kernel/real2.S:
> ENTRY_CFI(__canonicalize_funcptr_for_compare)
> #ifdef CONFIG_64BIT
>         bve (%r2)
> #else
>         bv %r0(%r2)
> #endif
>         copy %r26,%r28
> ENDPROC_CFI(__canonicalize_funcptr_for_compare)
> 
> Or am I missing something?

nolibc is license more liberally than the rest of the kernel.
So lifting code from there is problematic. Also users should still
be able to use libgcc if they so desire, so this function could
conflict.

> Btw, since you want to avoid libgcc, I think this is quite hard, since
> gcc automatically adds lots of parisc specific millicode functions (see the "$$" symbols
> in parisc_ksyms.c) and many of the gcc helper functions (e.g. __muldi3).

The only one I ran into was $$dyncall. But that was mitigated by using
--mfast-indirect-calls. This option does not support shared libraries or
nested functions, but both are irrelevant for nolibc anyways.

> So, I'm not sure if it makes sense to try to avoid libgcc....

It works for the current version of nolibc-test.
If a user uses features that do require libgcc support then they can
always just use it. We only want to avoid forcing it on users.


Thomas

Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C43833E35B;
	Tue,  7 Apr 2026 18:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587835; cv=none; b=pnnX2LMGdRgYx6DTifwM5KZj2qyMSou4w5yIcBNg+VWEE//Ea59OK3LpZ6pkgcG3Hspd4bpnJS/fryb4yq4Kdf+DaPqsyzphywtcAKj3xWKCmbjv0M9BncsSM4lwfgD1gzbxrxO0+ZpYYlcBC/8fgtnluNk9tbnvDxauTuvkGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587835; c=relaxed/simple;
	bh=TNJpOkmwa51MbrI2mt9ZF0AgTcM+eOrx7/zIdsOqOMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXFwJ9EZMQJvjPV8E/OG1Wu7kJUB6t1zVG56F/6LRox+5BQPU4mI++S8hHb57wBPqa82LGRQ4y0iJTsulcX6K5Efbjr/pdUdi4SuJbgVOT5EaV4he/kk4ZFwImIfHdDx7p67eYH1lvdTIrVjL+VjCuhpOi9OcK6dcsqrxtCRgH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=RNQUb2Bj; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="RNQUb2Bj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775587832;
	bh=TNJpOkmwa51MbrI2mt9ZF0AgTcM+eOrx7/zIdsOqOMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNQUb2BjhT/iWGJu5LQU2icjpJK621stO6QTrF/OCFZr4M7MyUoxOqbh9yhX85CHc
	 fOOpT6y8PWhd+lCWCqHWJ+/tl12FEQbWYsIL/eAV0lON7YEgZkaADvalQOI/EY0gcT
	 oFVV1bXognNC47kCoWKgQS8BumZPJqJohT3FZsCA=
Date: Tue, 7 Apr 2026 20:50:31 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Willy Tarreau <w@1wt.eu>, John David Anglin <dave.anglin@bell.net>, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH 3/3] tools/nolibc: add support for 32-bit parisc
Message-ID: <ed64a923-1e99-46a2-819c-5e1d6212df9c@t-8ch.de>
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-3-f70b4509c44a@weissschuh.net>
 <0fad3d18-72fa-4d99-b9ac-477964fdd654@gmx.de>
 <9477a477-6abc-4de3-bb9b-1080e0cefc80@t-8ch.de>
 <4c1c0d5c-d05c-4b98-bfbb-bbb2650c0fab@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c1c0d5c-d05c-4b98-bfbb-bbb2650c0fab@gmx.de>

On 2026-04-07 20:40:39+0200, Helge Deller wrote:
> On 4/7/26 20:14, Thomas Weißschuh wrote:
> > On 2026-04-07 19:33:05+0200, Helge Deller wrote:
> > > On 4/7/26 18:37, Thomas Weißschuh wrote:
> > > > Extend nolibc to target the 32-bit parisc architecture.
> > > > 64-bit is not yet supported.
> > > 
> > > Adding 64-bit would be very cool.
> > 
> > It is on my roadmap. But the 64-bit kernel I tried didn't seem to boot.
> 
> Just in case you used qemu, you need to use "-machine C3700" or "-machine A400".
> The default B160L is a 32-bit only machine.

Thanks, I'll try that.

> > Also it would be nice if CONFIG_COMPAT could be disabled.
> 
> Ah... never thought about that. Will check, but I don't think
> the kernel will become much smaller.

It's not about size for me but about simplifying the toolchain setup.

> > > Dave Anglin is currently working on adding 64-bit userspace support
> > > to gcc/glibc (dynamic loader), but that takes some time.
> > > In the meantime a 64-bit nolibc would be cool for testing.
> > 
> > Nice. Do you have instructions to run the 64-bit kernel in QEMU?
> 
> As mentioned above, I think the "-machine C3700" should be sufficient.
> Some more info is at: https://parisc.docs.kernel.org/en/latest/qemu.html
> 
> > Is qemu-user support planned?

> 32-bit qemu user works great and is used on many debian buildd machines.
> 64-bit is on my todo list, I just need time to do it :-)

32-bit qemu user is indeed used by the proposed patches. I'm looking
forward to the 64-bit support.

Thomas

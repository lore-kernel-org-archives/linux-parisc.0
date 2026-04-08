Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340DD312826;
	Wed,  8 Apr 2026 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775682038; cv=none; b=Q7np8DhzrcoiRuda9AVnFof4Wdn5bxpY/23b5WpfrThsK7QCIGjRC0n1t421GOW/2dra44Wx9rOmKvGkdb7UcZO1B5NRlTddL31mr4UhYDjLumUI/SS+1HS5IbfF/H6RQZcH2Qh2BbUizsKjq1WVZBF3mEBD2J2V3viK8sIWGeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775682038; c=relaxed/simple;
	bh=KfKB5Fx4TuzMFtmnuD9XSk9EKzUo9Yw3SHobwFQOStI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8kKvO6ipt+J4IhzlepZx4MARi+rOnE3OE3LBFGCpdeBKvXKTjvLeu0R1arFmy551/Bd0EfrU4XQ4Q7EEE+n+HaEw/6Zbi0FWi2dmMzr+w+ktiE7XxLK+GR07vhXnSkWtqR2biz6ZkDSwwlII8WZa4ia46DIJL98qx7/3vjrMYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Oi1mY/Y+; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Oi1mY/Y+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775682034;
	bh=KfKB5Fx4TuzMFtmnuD9XSk9EKzUo9Yw3SHobwFQOStI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oi1mY/Y+h6XOmLmmjCNchylFNoP5oku9AHsTB7H3nChN1esaA52cpkhS+tF+YPPyL
	 NdA9kTSLzcvbk+J/dmS70p1Ps6YhTY4UTdleHE+ian9iQLhkT6M6DT/Tbz1WG96lEi
	 /zBhlnfdd1zCrHQKoyywQeYcfSIusYeNN9ali0FY=
Date: Wed, 8 Apr 2026 23:00:33 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] parisc: Makefile: use the regular compiler to
 build a native 32-bit vDSO
Message-ID: <40bb6110-abfb-4d6c-8682-8933ad0b6816@t-8ch.de>
References: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
 <20260408-nolibc-hppa-v2-2-7fe404cb61e3@weissschuh.net>
 <1ac41118-471e-44a9-bf2c-f727ec5ded42@gmx.de>
 <273b3a02-9c1d-4a92-ba7e-fc10a0ef869f@t-8ch.de>
 <bcf93eb6-3937-4165-a4cd-569d1cef8f7e@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcf93eb6-3937-4165-a4cd-569d1cef8f7e@gmx.de>

On 2026-04-08 22:52:22+0200, Helge Deller wrote:
> On 4/8/26 21:42, Thomas Weißschuh wrote:
> > On 2026-04-08 21:01:45+0200, Helge Deller wrote:
> > > On 4/8/26 20:18, Thomas Weißschuh wrote:
> > > > When building a native 32-bit kernel $(CC) the compiler is obviously
> > > > able to compile 32-bit code. There is no need to force the user to
> > > > configure a dedicated 32-bit compiler.
> > > 
> > > I'm not sure, but still I think this logic of your patches #1 and #2
> > > may break the builds for others.
> > > That said, I'd prefer if we can get it working without your patches #1 and #2.
> > > Can't we do without them?
> > 
> > They are mostly do avoid hacks in the nolibc testsuite.
> > I'll drop them and use this instead: ---
> > a/tools/testing/selftests/nolibc/run-tests.sh
> > +++ b/tools/testing/selftests/nolibc/run-tests.sh
> > @@ -175,6 +175,10 @@ test_arch() {
> >   	fi
> >   	MAKE=(make -f Makefile.nolibc -j"${nproc}" XARCH="${arch}" CROSS_COMPILE="${cross_compile}" LLVM="${llvm}" O="${build_dir}")
> > +	if [ "$arch" = "parisc32" ]; then
> > +		MAKE+=("CROSS32CC=${cross_compile}gcc")
> can you try if
> 		MAKE += "  ARCH=parisc"
> works too?

Makefile.nolibc will already build the kernel with ARCH based on XARCH.

> > However in the long-term it would be nice not the need it anymore.
> > Afaik is parisc the only architecture which needs a special compiler
> > specification for the native vDSO.
> 
> actually it doesn't. It will figure out itself.

Thanks!

> > > I tried your patch series, but they fail to apply to my series or
> > > upstream.
> > 
> > These patches are currently based on nolibc/for-next
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/log/?h=for-next
> 
> Ok.

Do you want to review the nolibc bits?
If so I will wait for your review.


Thomas

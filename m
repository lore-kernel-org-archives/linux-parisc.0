Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65C2228CB8;
	Tue,  7 Apr 2026 21:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775597242; cv=none; b=ujul/KI80bea0w1Z2MsHX5Q7qekRhjYU8xv6baaHPtj/fQsMnUPZLMRqIDFjyxS2LOFeU9Ebxs7hmAa/vnwRGhtXY10b7VPHESln2yJngkWMg2NcYCsYFUjf8kSz01hctlFklG2bO16FK4zgOC0WooZrqlHWRVmyNhhQfSjUJyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775597242; c=relaxed/simple;
	bh=uB0tPZNQvYol3do6Va/58/w9WzjTGMMds3/pDXB9Tbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9meFN45SBCLAr8e2tS2NvCNzpVmvqfCK5j8foyjy2mYadJMPdNngiN5+aGoXYt0AWFrn4bs5wgLiRMuvF9q936RPEW6eMrq0c00YtnSAoj6KKjrKkKh9W0bHilRQcGF1RGkZ9B1C754zRzoslbtXAFDjvslcYJbnFrXNIGaGtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=RI1I0qWm; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="RI1I0qWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775597238;
	bh=uB0tPZNQvYol3do6Va/58/w9WzjTGMMds3/pDXB9Tbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RI1I0qWmYVOV9OXTNrzGn60wvBpQg8xxCdGtf+QzPL2w1UWKZXBH6hL4ubxgWxB6i
	 ZFBkb1gC/ZFZF53lQ1m1hU9wJTMAY3zUrYOyC/zSyKWsF73/1n4pGBOxjyvX6dYuIm
	 Biv56BdaYbaaGwMjfDx1A/m0hXQ/pJwBxlYJLtVg=
Date: Tue, 7 Apr 2026 23:27:18 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/3] parisc: Makefile: use the regular compiler to build
 a native 32-bit vDSO
Message-ID: <129b4f90-9f05-42d2-84a1-81a7fa1d88cc@t-8ch.de>
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-1-f70b4509c44a@weissschuh.net>
 <b0eaa2ff-cf5e-4508-be41-61d265943b6a@gmx.de>
 <76ccb417-822f-4fcc-bf8a-f829f8a14ff4@t-8ch.de>
 <b6edb6aa-76a6-4f66-bd04-6a2163591990@gmx.de>
 <e91c3d3e-2214-450c-a212-1baab9dace4d@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e91c3d3e-2214-450c-a212-1baab9dace4d@gmx.de>

On 2026-04-07 22:20:34+0200, Helge Deller wrote:
> On 4/7/26 21:27, Helge Deller wrote:
> > On 4/7/26 20:06, Thomas Weißschuh wrote:
> > > Hi Helge,
> > > 
> > > On 2026-04-07 19:14:23+0200, Helge Deller wrote:
> > > > On 4/7/26 18:37, Thomas Weißschuh wrote:
> > > > > When building a native 32-bit kernel $(CC) the compiler is obviously
> > > > > able to compile 32-bit code. There is no need to force the user to
> > > > > configure a dedicated 32-bit compiler.
> > > > > 
> > > > > Use the regular compiler for the 32-bit vDSO when it is sufficient.
> > > > > 
> > > > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > > 
> > > > This part is quite fragile, especially since the kernel is often also
> > > > cross built...
> > > 
> > > I also used this patch during cross-building and it worked so far.
> > > 
> > > > I can add the series to for-next branch of the parisc git tree to see if this
> > > > breaks somewhere. (unless you take care of it at another git tree?)
> > > 
> > > I'd like to take the nolibc patches through the nolibc tree.
> > > If you want to take the Makefile patch through your tree into the v7.1
> > > merge window that would also work, as I will only apply these patches
> > > for the next v7.2 cycle.
> > Ok I'll add patch #1 the to the parisc tree...
> As I assumed.... it breaks immediately for me.
> On an x86-64, running "make ARCH=parisc palo" doesn't work.
> I think you set the "CROSS_COMPILE" variables. Just leave them out....

Then let's ignore this series for this cycle.
How are you configuring your compiler?


Thomas

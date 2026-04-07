Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4305B3B27D2;
	Tue,  7 Apr 2026 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585191; cv=none; b=IGZ2Qig2dT4u0Q+LLEKd3xoxURrl9HULzOH2RULtxT27XRwHbD4fkWxg+h9C9+TbKlnd47ZGJPfBhKUXw40WvbHadNGyeIHOiTPL7PqrJna8zeqK4bDpQkVUPl/sU0erTzqDj40EaCuDCjGMqoFHhcKjW4hep7QyXKsAO/KGX1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585191; c=relaxed/simple;
	bh=tHAi5M3T0tVcc1t44qNJnJ9ITeSChmqDYGLt6/jg2+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dp9b/yLxsIUPtT80pazhTx4+kuMQIsjkQQvn0Vzp2lW8LIy4/c6lKuZY282IjSxAwBfeIHN2UAeDp6uVaZRV/f3+crYewBAcYRhtOehCLeiR4jpnYtTQT+pimQrwoXn3MHsuuOLnTDuCbyt0nno6ebqgEcE2Bh9TyI6QlKq4sEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fLF04flK; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fLF04flK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775585188;
	bh=tHAi5M3T0tVcc1t44qNJnJ9ITeSChmqDYGLt6/jg2+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLF04flKxiQ4NMJVzaS7kCCo/Xa7mgljNeetrwhOaXa6CPOP7jCreZ0VC8W57tsP/
	 DVI4i68nHimqkMArvr8OH+JouyRsEQKnqY/yMhdFq4O3xzMJyprX9ttusqZWOnAt13
	 8I1SCuS1ve0T+zrRbqyYd/bVWz+26ofjFGMB/r9Y=
Date: Tue, 7 Apr 2026 20:06:27 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH 1/3] parisc: Makefile: use the regular compiler to build
 a native 32-bit vDSO
Message-ID: <76ccb417-822f-4fcc-bf8a-f829f8a14ff4@t-8ch.de>
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-1-f70b4509c44a@weissschuh.net>
 <b0eaa2ff-cf5e-4508-be41-61d265943b6a@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0eaa2ff-cf5e-4508-be41-61d265943b6a@gmx.de>

Hi Helge,

On 2026-04-07 19:14:23+0200, Helge Deller wrote:
> On 4/7/26 18:37, Thomas Weißschuh wrote:
> > When building a native 32-bit kernel $(CC) the compiler is obviously
> > able to compile 32-bit code. There is no need to force the user to
> > configure a dedicated 32-bit compiler.
> > 
> > Use the regular compiler for the 32-bit vDSO when it is sufficient.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> This part is quite fragile, especially since the kernel is often also
> cross built...

I also used this patch during cross-building and it worked so far.

> I can add the series to for-next branch of the parisc git tree to see if this
> breaks somewhere. (unless you take care of it at another git tree?)

I'd like to take the nolibc patches through the nolibc tree.
If you want to take the Makefile patch through your tree into the v7.1
merge window that would also work, as I will only apply these patches
for the next v7.2 cycle.


Thomas

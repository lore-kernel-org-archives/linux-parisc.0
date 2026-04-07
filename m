Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BDF22083;
	Tue,  7 Apr 2026 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775585665; cv=none; b=Wqsz3B8sJYUunxX7jLOtBzlyIxLlWyh0MatPnoY4tW+cTogZiLCABHQyJLv8+xOynnQjRPbFkZG+TeRMczZ73XVrjmB0+tqmN6gxXUvDVz7/VMvw+D7LSHZzxCXXj2zmNv66ss+ZD3fcBqvVFgmUYrRiMwcZhQ4zJm0zhH4uCEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775585665; c=relaxed/simple;
	bh=/RhFVQqlEWgcAnAwPFW/jL09QB+abo+bQ2s7CLEsIlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B55sXoDCreD6uXZe8OFjIM/RwvPh5DBtawGpbVOZAf2FFFEZ4qWoTujDYKdcVEa5kNNPsmDP+TiPA+OGf/1oGI4WFnP11GEV/X5GW6yOcjUmzagBsl7dXAqXlA9w/snfbaeeq/0m7CT9a1GV2DB34KKesPDN9Pfhdr4qUcJYL0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=lJFCk/AL; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="lJFCk/AL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775585662;
	bh=/RhFVQqlEWgcAnAwPFW/jL09QB+abo+bQ2s7CLEsIlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJFCk/AL4vMESnRnNyfB+T3VhG3UcJCvpcUlkr/arknDLXbvLHOOIhpGeASx5Afl/
	 Ky2sQNBrV275pomFHokPzTdxcHAaW2FTj26QbcqhmZlIlWYB8lONHCUcwCEQgdSi4X
	 6W03+hI4SppdPGLDZbmNrqitv03pXQNOdJxPEwGQ=
Date: Tue, 7 Apr 2026 20:14:22 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Willy Tarreau <w@1wt.eu>, John David Anglin <dave.anglin@bell.net>, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH 3/3] tools/nolibc: add support for 32-bit parisc
Message-ID: <9477a477-6abc-4de3-bb9b-1080e0cefc80@t-8ch.de>
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-3-f70b4509c44a@weissschuh.net>
 <0fad3d18-72fa-4d99-b9ac-477964fdd654@gmx.de>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fad3d18-72fa-4d99-b9ac-477964fdd654@gmx.de>

On 2026-04-07 19:33:05+0200, Helge Deller wrote:
> On 4/7/26 18:37, Thomas Weißschuh wrote:
> > Extend nolibc to target the 32-bit parisc architecture.
> > 64-bit is not yet supported.
> 
> Adding 64-bit would be very cool.

It is on my roadmap. But the 64-bit kernel I tried didn't seem to boot.
Also it would be nice if CONFIG_COMPAT could be disabled.

> Dave Anglin is currently working on adding 64-bit userspace support
> to gcc/glibc (dynamic loader), but that takes some time.
> In the meantime a 64-bit nolibc would be cool for testing.

Nice. Do you have instructions to run the 64-bit kernel in QEMU?
Is qemu-user support planned?


Thomas

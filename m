Received: from manchmal.in-ulm.de (manchmal.in-ulm.de [217.10.9.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9587E381AF7
	for <linux-parisc@vger.kernel.org>; Thu, 30 Apr 2026 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.9.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532446; cv=none; b=mpmXN1RA3CNwzQKL0BFn+CXku0CW7Z7YoXxL2oop92npgYubEw49MNgZwtEhQ9smHFuOAnVFHK1H2TzM6XqYbzd2N9c7WZei0wQEDFx7pISOCkdO/D6/yBWLOe0qUWYz8RVX+kSWk+Wo9zEO4JJWtwZUdvrIvG76wlIzIkmyvzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532446; c=relaxed/simple;
	bh=d0A4Z3dyhncCu2zGJXioCHpEM1mWf0SZQy9XKSUBz2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkAQ32VYzW2sRmf7P1vui9JCDauKncbFiWgWKD9Eaj0PUf6rgVxzED3OLjlS4TQMbaIvIZFtcwYwNg43Kk3z3R9m9+snDpoPl/IPByvItVl9Z8BPuE4GWJpUxpT7UJrOGYZOmsGwzFWKORQKEpn69202/s56dSvG02wPF1w+fjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=manchmal.in-ulm.de; spf=pass smtp.mailfrom=manchmal.in-ulm.de; arc=none smtp.client-ip=217.10.9.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=manchmal.in-ulm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manchmal.in-ulm.de
Date: Thu, 30 Apr 2026 09:00:38 +0200
From: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To: Helge Deller <deller@kernel.org>
Cc: linux-parisc@vger.kernel.org, deller@gmx.de
Subject: Re: [PATCH] parisc: Fix build failure for 32-bit kernel with PA2.0
 instruction set
Message-ID: <1777532385@msgid.manchmal.in-ulm.de>
References: <20260429193903.76228-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429193903.76228-1-deller@kernel.org>

Helge Deller wrote...

> From: Helge Deller <deller@gmx.de>
>
> The CONFIG_PA11 is not reliable option to check if we build a 32-bit
> kernel which needs the 32-bit VDSO.
> Instead depend on CONFIG_64BIT and CONFIG_COMPAT only.
(...)

Tested-by: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>

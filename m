Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333928;
	b=qk7wk3y0ETGmotioUfG4jEtQf3j568PxVFFWNiwhZHcbLRAn+6TPkss4OiZJEY8T2d6x
	 aHwp8cA6ir4f5MBVHsjpMhlqsqB87wV3VvDr/nkeeSCeAzlI8UrnHRyjqPoDYFkvjxX3r
	 YHRSOwhCGDTa4SLa1uYm/101Nt2tPmn7WVTA3G7FKeXMuUkGYKcvmGSzCMC1biSEEfPvD
	 /JgOglFifIA3q/KEDg7MaUcDX+bockO4bKJqcUSURzRIgSKofeCS996srQnhJ2kEdA69D
	 gQWyUicdje4k9SaqNyp6Srz2CQmE5675mZG9e8Qw9nZ/fGWQXVufPcwDp0g/XCmdUGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333928;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=c/SfsXQpzDXdeKfcwZ75FBtcxtEfsB2j4cQsJxUTwm4=;
	b=iIchC9m9rGgQYcy6vLOrvZuqx4tdbFWQ9coGEBjiR+Mm0Yk2JL2tU+HrVXgdUVkJaoSp
	 UrJ2VwNkiiB1VTYx9H/8mgUpZO9Pn7V1PAe1SLrQ0ts18ZTZCKS8hQYtYVoSBawuEWYd1
	 7VkxF8i3qQGqQDJtvsAb0p3ydUPq7aCJdx5NBhGKJN9XQww6Ilx60tOJnJPwuYK4LiSeF
	 XgOBzbI5bltC5VJJiRDHhKbr5GhZL4mkKOxL+J7SMOQRqTw1RM2dk61qHerzIn4efju/K
	 c7V997NmUA0oUBsRT0PDxygHspMmOU64EErbKivaK0qNAsic8/MAUw5dYmxCIyYV34g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GTmI1KpM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F12606A32C;
	Sun, 22 Nov 2026 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GTmI1KpM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED13E1F000C4;
	Sun, 22 Nov 2026 07:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795333928;
	bh=c/SfsXQpzDXdeKfcwZ75FBtcxtEfsB2j4cQsJxUTwm4=;
	h=Date:From:To:Subject;
	b=GTmI1KpMYpwRO4/Z0JWkhsd3cdMCbdeIEqTiq7lW4eNsd0jP1X9FPyEYvCtsFyLc8
	 V/WVH7CqYUHz8QGz0kC26znQB6E2+PA4cFJj/DjyjlUPMxspEM0QBvgx8c/k0DePDF
	 tiPNANYniXwsGmQyWCHxYg51Q3COd+vfKzQrSEorM3+q4KBnM9bmxJp8aNrAN3mdC1
	 TzJCR7NLF+A0IrNH26/7KVHbr6pDVMzpERGgDNnIBlSHA6P4j9CC+RkRoZOHOQdjjQ
	 I6yaL82lo9px6aP8Vo8/Dd24lzDlEeqRV7AQcmLtFHGAm2crbpB4TXjs/5CM99fzDT
	 PZ4B7+R1AgSXA==
Date: Sun, 22 Nov 2026 08:52:04 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fixes for v7.4-rc4
Message-ID: <awKfJF_664rOGw4X@p100>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dear Linus,

please pull two fixes for parisc architecture which fix lockdep and ftrace bugs.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.4-rc4

for you to fetch changes up to e9c14351f84f2ddf4aae2914979c0378bc14460a:

  parisc: Fix register corruption in 32-bit dynamic ftrace (2026-11-18 23:01:13 +0100)

----------------------------------------------------------------
parisc architecture fixes for kernel v7.4-rc4:

Fix a register corruption with the 32-bit dynamic ftrace, and
prevent a lockdep assertion failure in the timer tick.

----------------------------------------------------------------
Karl Mehltretter (2):
      parisc: irq: Trace hardirq state in do_cpu_irq_mask()
      parisc: Fix register corruption in 32-bit dynamic ftrace

 arch/parisc/kernel/entry.S  | 4 ----
 arch/parisc/kernel/ftrace.c | 2 +-
 arch/parisc/kernel/irq.c    | 4 +++-
 3 files changed, 4 insertions(+), 6 deletions(-)

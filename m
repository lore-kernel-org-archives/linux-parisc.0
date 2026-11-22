Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372122;
	b=qHXmBQm2W5xfKou9JrGdV4P80Wwcqarb+wZZjigoTSu/sA0Fqe07yvW+n0Pjd81iYTIN
	 KHy7rHTRhP0nmDi5TN236eB0uNdhw9nWIB5nOOu7MiuIeE6+0aPvRsbT1Tb6R64qMUGZX
	 I1Oqlh7Jh5iRJYmwfxRyisbI5m5+W5lU33R2sHR1gDcuaZZJsPXpl+XPaDDOZ9wdBcO0b
	 QifomFIRhxqM8rypB01pDn2di/mY3uNONkBJleHc00lZbieYxetYtg8O5PGevGCIYXhkT
	 UJ8sBsah4gQu6qSOSoZskZTr1rX9/vaAsfUrGFH4AUBKRltbtLnSj+A8YSfPOynV4Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372122;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=McrpRKk4iSGxFterhW3QgJOZliuxxpr6M5lvC3Mdk40=;
	b=5Hw4l7rpMKCeCQZSabrvTh+mzBepJxqJeKMdM1rLWhjxlmBVcAIDIWdLDgZ4iNp2ut+C
	 5UIrI3v1v/poJJ5lePnQ4VQGiDCUrDiTCQxGbqY9g9uc/11eT6i7d1HSKibKa84NJllj8
	 hUoKC3yV/c6jli4p2XEDOhzx2KvlCpzvCKwrExU+EvtplBbkTtpOSkvnXbT13jTT99BfV
	 MstnPsi9JgHX4tvI/wNlF09v2HiUgZSjuS7V8ct1FVMYf6EF0mMDWfy1DIis8SnlYEqWT
	 M/q0fqJ/MaovLOd6UTtDsBf4HRfSDeg8R3TN2suIfTwmJCdxqsX/JLAEAaMg9gKo6FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqiJFQEd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE67606A320;
	Sun, 22 Nov 2026 18:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqiJFQEd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC2C1F000C6;
	Sun, 22 Nov 2026 18:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795372121;
	bh=McrpRKk4iSGxFterhW3QgJOZliuxxpr6M5lvC3Mdk40=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kqiJFQEdA3mU5I4OoO93aBofMTcQtpfY0pVoScEkESMOqP7ZE3j8VPdnmBxT8rw8O
	 R/YIRIKuZlNGu5rvk2ayveoBPAMAoLTHyyz1yE0904+pm2jN4kvL1v6V6/Ix43aOKq
	 NdZbCU4b7QiiacvV6gXXD0ZQj7jn8b+UVYe+KDiqO1XWuxj+TH/PqGOp6oSnSW6Kxz
	 ANTSJT1WSuXLXE8HOZv0xPp/SnN2NSjZEcVDQ+hSIZmbBfp6Lf1SNq5W8llS6zhI3o
	 jt8DiLSP0mpRRVi9ZBHqcLnkz4EKNM1Xw0/9EsvcGZ0a7p9135BDusgdH2tJgGbnvf
	 Tmt4F2+3xDZIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4519392ED1D;
	Sun, 22 Nov 2026 18:28:41 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes for v7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <awKfJF_664rOGw4X@p100>
References: <awKfJF_664rOGw4X@p100>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <awKfJF_664rOGw4X@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.4-rc4
X-PR-Tracked-Commit-Id: e9c14351f84f2ddf4aae2914979c0378bc14460a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 69712157c9f40ac806fa0448ac56475eae40957f
Message-Id: <179537212022.1494759.15225764042452698071.pr-tracker-bot@kernel.org>
Date: Sun, 22 Nov 2026 18:28:40 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, John David Anglin <dave.anglin@bell.net>
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 22 Nov 2026 08:52:04 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/69712157c9f40ac806fa0448ac56475eae40957f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

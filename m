Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9C5375AC4;
	Thu, 19 Mar 2026 23:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773963043; cv=none; b=MB8r2JaQ+aMVVeldL1mEgHctDpXId+j1McZ3F4wqCxZ3kFVty+Ngq7gH9ruIoKp3kiAno4VCazcc917YsLGZY+UpDnn78rRYO59qqwovi6G7HadOpqWrOCRZID11nDWMMhRcuiXCUp+5U/z9gWnxKlMCwiq/gzaXzSNEzrF/bsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773963043; c=relaxed/simple;
	bh=bBT+QZawv6j8rHUhdWV3VApk8rCLCSbxFVxaTaFKwLg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Z+n3TX+0u2TXIC9fdX1xkXFJJ8Dh9bT7dM2A7xdTNMhMbGtAMEZD0meN45knfPUWuM4QAIA86qURh/dRzIKx/WeFZwkvxqcTJG9HBG5PbZoOuJJ1bDuZVAim6mgn7BGBYFy3HtaZnEP0FovTSVMDEPP+HY+2p4gB9HxPIn7/AGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAv1oo75; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAv1oo75"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCC3C19424;
	Thu, 19 Mar 2026 23:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773963043;
	bh=bBT+QZawv6j8rHUhdWV3VApk8rCLCSbxFVxaTaFKwLg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KAv1oo75F5dSr8ne5HBKQMEUlvjHO5FJuk65p1kNuYUuN5RpxB2Yv2PClPAidkDxM
	 d11nGdMAVQPCNLvLCKoMsIQPFaxDlqe30WcKWYTPrX7SibPeUoJhIjoaf74s6BDUFV
	 jnQl+e/AjAU3UXw9DUA+ttBIPTl7aERgp4Z6V9uHE7bV7StLFV3kqvEmYG1a7JT6Dg
	 YwoMd0bNDi/mkQFk6BDSvKesL5IdoguEfeDikFXFznl1R0gfXIeiy1OmB/H+moibm6
	 jLnV3HQE3BtEUBhZVellFD2nUDlli4TKmKWnQ9/scRrchAmVH8r8ZSbx58nDxAHnNY
	 qqpycd5Y5+LAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0302639302F6;
	Thu, 19 Mar 2026 23:30:35 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fix for v7.0-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <abxryWtKxRq5Fofk@p100>
References: <abxryWtKxRq5Fofk@p100>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <abxryWtKxRq5Fofk@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.0-rc5
X-PR-Tracked-Commit-Id: 2c98a8fbd6aa647414c6248dacf254ebe91c79ad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e4f8f1a3d081e834be5fd0a62bdb2554fadd307
Message-Id: <177396303357.1847629.14782686442122658545.pr-tracker-bot@kernel.org>
Date: Thu, 19 Mar 2026 23:30:33 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, Felix Lechner <felix.lechner@lease-up.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 19 Mar 2026 22:34:01 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.0-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e4f8f1a3d081e834be5fd0a62bdb2554fadd307

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

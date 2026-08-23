Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1A3AC0F6;
	Sun, 23 Aug 2026 19:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787512827; cv=none; b=o56eU80Onw1WeBSnQIxLkg3CrTp+a5a1sv4L4Yhl5mQQMv+Ec8FCSEcf8xIhfFNB30EuhphloU0AosfVQPHGvMdeDdRJqWSvxw0avaOi+uiLm8QEyszw/OhaMF7hTas+gKaQah8YanozyojnAXgDapiNElbyT0LHudon5EgaZlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787512827; c=relaxed/simple;
	bh=eudr1bGLK6mlwz6THZdmqUPtjjOx4jOH7emAAM+qAC8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=I9uBE7hDdrIcJaxeigIPs1WL2WMPpUX58iNRzQjefoCqt3dmxMXhIriQ1AvYQ8qBsTnaYQ5T4su0JgNC9Z7nBFT1AyleBvYLq4RTlsobKL0/2KA8VMLx/8ezMNF49WnkYp3Aw37d5NKvMQAkp5H6A//2lf2JAIPfyQOOrp10sXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BM5i7Gno; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BM5i7Gno"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350571F000E9;
	Sun, 23 Aug 2026 19:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787512826;
	bh=XEXZIYenlqy1XHSX64NZrGFC7zK04qoINDwVntrLOms=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BM5i7GnopCRrE+9eJFoAxpUtLeJQaZhReALkr5ZxMCyz6Ma+0OXQoQY6woodtaH/t
	 Jy+owsQatojLeYAwCrfemh0w9hlbGIfF+U6N2c2zLJG7ZMkX4Ak/T4JuqS6tfgI3pX
	 HwgIhZAwbBEZ5M/lmID2u2I3jUEuayCtXYQ8zQMUdb5YU6xWGObtr7jNDn3iPko7VX
	 +ZS4y/AQThq01eIxj2wx37ZGVD0ecY3f/sSXgNn4y/EunNy6bqC4tof/2R+vn3UKii
	 3BRn0GuM4Y/9UijxsUZrIKC+50tMKRKO5X/np7ExGlQqz08cOpsjo/5M/ahhtuUxca
	 GjVbxDWhAunlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939E7380AA78;
	Sun, 23 Aug 2026 19:19:35 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes and updates for v7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aosrM-t2ji3ONNMG@p100>
References: <aosrM-t2ji3ONNMG@p100>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aosrM-t2ji3ONNMG@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.3-rc1
X-PR-Tracked-Commit-Id: 8b585431a16cfb9d8f2955a9fa0787ce3dceb3c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b6b019a1d9b90ac51174f0ca15b1338b61506bf9
Message-Id: <178751277413.2120410.3267820203972646672.pr-tracker-bot@kernel.org>
Date: Sun, 23 Aug 2026 19:19:34 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, John David Anglin <dave.anglin@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 23 Aug 2026 19:17:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b6b019a1d9b90ac51174f0ca15b1338b61506bf9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6937030DD1C;
	Wed,  6 May 2026 21:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778103645; cv=none; b=PqItSgXP73lY5NX6+a6UN7yFDAzZ3Wb7L3nCndRyoc9hg445mDqKAScKaIk9ZfTMebfuB+hh7MR/gLl245JGOTj+MBWSqAQJOYdumbaTJaiZAaRMO0ZFdW4c7MlM3RGfCSsGv3j7/zrs3dHm339QGw49ZpZfxk/TTLvMJYRIGt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778103645; c=relaxed/simple;
	bh=BPzkPCEosMGzLYYWNE2dFHBhjzQIyvZ3HelEbCGNDuE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WjHRKDldZpOKIus69niYB+ZJPnLjcCMOb+00ViC6tlpTEFswJXFwcsY8INeqBy7MRPtmbr3UfL6LSna03OyPY14/k3xPaaS51UfcMhhGNYnv8htEnnRV6T9/DtSGDHPw409iTEG19G72ZzBNLDL0hQ6HHJnpU5VxTDtJpi4Er3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vj6H6GxY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vj6H6GxY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B5EC2BCB0;
	Wed,  6 May 2026 21:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778103645;
	bh=BPzkPCEosMGzLYYWNE2dFHBhjzQIyvZ3HelEbCGNDuE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Vj6H6GxYPYKd2Jt4WZr5we2qDGBQ3Ju3bYMHVa2UvPfdFsWCk49WUaVv69vt83ero
	 AxW+sCtaBOXKgkSx/+VpOvaQ7oYd3/tqzlarhaoew2PDgV6D8+wYaHrWeNnlitLfmW
	 GeQILCeb3x1/MuL5KzhBPXlBmhAkE0m+nNE4IsgMThfQcyv03SvP/QZiwvPlWVmCrD
	 4ZagaKcUJIQV8fvjA65UldCb+qR7yk3x1857yNiF1MjwGDsnB50MaJHzaX7SkZdh7w
	 xeJE1aYoD/7/qZ/euPKn19gYq2JRHxuLTh372T6oPh8UIuztW4o1RSqyFrZsdW2I6z
	 4ZOdD9p6YpPSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02EA2393089F;
	Wed,  6 May 2026 21:39:56 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes for v7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <afuU7lUDaUGho6EH@p100>
References: <afuU7lUDaUGho6EH@p100>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <afuU7lUDaUGho6EH@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.1-rc3
X-PR-Tracked-Commit-Id: 37b0dc5e279f35036fb638d1e187197b6c05a76d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5862221fddede6bb15566ab3c1f23a3c353da5e1
Message-Id: <177810359465.3214072.18347672757250549697.pr-tracker-bot@kernel.org>
Date: Wed, 06 May 2026 21:39:54 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, John David Anglin <dave.anglin@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 6 May 2026 21:22:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5862221fddede6bb15566ab3c1f23a3c353da5e1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

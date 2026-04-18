Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956E33439F;
	Sat, 18 Apr 2026 18:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776537691; cv=none; b=SQUubyvZgf1rFhKzdpAOKlc5lgtsO6bi5WllZoe/Jd0LtIl5lqllJcYElxOZshmAhSqyuQ3u4uwX5lVepZ+ppBqJRrj/i1/+xrA8po56tzi3qj+QPya74Mo/BxA6zTA+ZuztVqbmEyeQjxMrECqAvyr9zFNifjJTwcX94SPJPGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776537691; c=relaxed/simple;
	bh=E/G2vlUZGkjIpSfWCX//VjVGf9YRzpM6r9SZS1HGTC8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=PWxQ8r/TbURcTOF4I6WRJNpyLiNxu9tutEhVKuHDEwB3gy+mai3tYjYup4seIoMAkJn9x7iM3xkMD7Lz+Fdc3UmxVWsKp4No5dqLiteeud6RHILQuAqg9GRWY+bdLnAvX1EWHrryyg6W7V5V8xqmCvWj5E9vBDKu4tZhjhEOCwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o77Jd2if; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o77Jd2if"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A056C19424;
	Sat, 18 Apr 2026 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776537691;
	bh=E/G2vlUZGkjIpSfWCX//VjVGf9YRzpM6r9SZS1HGTC8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=o77Jd2ifsqIgLCC6Abv2hmj1U0f0C7YECdAOCSYggfkc9oDD+37MCQy3eiETOeQxL
	 3COtyF+pGhtB5dcZcxmdaoFnMU5I6bja+CqiEWutA0uyrR5ES17TuyqrC8tlg7E8w3
	 +Bn1jwj2CTTjfld0S8PP5u8sJtuL45k3Is+dEBFAkKC+OQlmn0RP3uENx+U93dx44w
	 IKYUmtY+5tQawKi8hmMJpbyfSU42ud/9mu4CMn007QAm5TFcCpwYhRg6JGMhGQppq6
	 g7nH8ekino7qn4XRp4Jz9WhOFRn9KGuQxv70kl1WbeyTxK+hkQ/YXQSK0ilSvLvaWs
	 earYWJNY9uMoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DE6380CEDD;
	Sat, 18 Apr 2026 18:40:59 +0000 (UTC)
Subject: Re: [GIT PULL] parisc architecture fixes and updates for v7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aeOoMH5JI2wjFQrZ@p100>
References: <aeOoMH5JI2wjFQrZ@p100>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <aeOoMH5JI2wjFQrZ@p100>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.1-rc1
X-PR-Tracked-Commit-Id: 707610bcccbd0327530938e33f3f33211a640a4e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eb5249b12507246dc959945454cd1be8d7dc3795
Message-Id: <177653765763.499435.1453576560125924975.pr-tracker-bot@kernel.org>
Date: Sat, 18 Apr 2026 18:40:57 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, John David Anglin <dave.anglin@bell.net>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 18 Apr 2026 17:50:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eb5249b12507246dc959945454cd1be8d7dc3795

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

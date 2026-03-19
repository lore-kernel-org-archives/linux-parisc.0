Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F203B19C9;
	Thu, 19 Mar 2026 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773956045; cv=none; b=MXDxRa8e1B3EfMPB02Eex/kiC4JdhmTawoSvHOk+XrO+JszneFJpwWxQyF7Bjqa1IjadmVjFf+J7Ft3FOv7nuqhdB5KKg8nOzhKqekk0mxQ5B3oIfcu5vIYgx+ITqo7f1mg96ur6swQCs5vIaNIxP4CKa/Gf5o7nLJ2CO6zYwoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773956045; c=relaxed/simple;
	bh=uN91gJMMf29B5T6jkWM5Wbv8JvvYvjjlkitRpPCrlJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fTA6wp9K7umQPZ3DH0wxQaYKnvh3e7YAFJE2Lujd1Z3ZFNYXIMRRfvgfOqEm6SWF4XO0SMzVoZM6wSQ8+sJPV2dJxQEPZNuluKsG0FVXi3cwJNB/H4kv2MTgQ4mCp8Mij6RkEagKaPreEPLVSzFalhb4XOMzjd16pzhQr5E99Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaMcEBLw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaMcEBLw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA0AC19424;
	Thu, 19 Mar 2026 21:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773956045;
	bh=uN91gJMMf29B5T6jkWM5Wbv8JvvYvjjlkitRpPCrlJE=;
	h=Date:From:To:Cc:Subject:From;
	b=gaMcEBLwAEuuj4RL8ZVaOhe+OUNZWdWWkvElEjmCVYz14qq2RxP6ubFRc7fdIZRxC
	 rK0xO+b6aJOLKxh+qi7cump97Ix//ARuRdqKzxO+i85x5kKojoJS4QYdHkmFX1Njnq
	 e+f0DKEzTUyUT0FxdWmAxFfUuahfXUd2wgDVKKnJrHLovFJBXmKIBuzfHErPLWg93m
	 iWxtKzGPwpW7ebud/zhhMrkFNfEQMmCntzgVZguh49SdD9AcjnKyJ4ilysoRiif4Zp
	 fIsTb8cVktD6/dpLkdvOE+yzsewWaAJGJjH5honkrvN58wVT94DEZFsfFJLa/K1SIz
	 I3q6pLccNJZ6g==
Date: Thu, 19 Mar 2026 22:34:01 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Felix Lechner <felix.lechner@lease-up.com>
Subject: [GIT PULL] parisc architecture fix for v7.0-rc5
Message-ID: <abxryWtKxRq5Fofk@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:

  Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.0-rc5

for you to fetch changes up to 2c98a8fbd6aa647414c6248dacf254ebe91c79ad:

  parisc: Flush correct cache in cacheflush() syscall (2026-03-15 09:28:49 +0100)

----------------------------------------------------------------
parisc architecture fix for kernel v7.0-rc5:

One fix for the cacheflush() syscall which had D/I caches mixed up.

----------------------------------------------------------------
Helge Deller (1):
      parisc: Flush correct cache in cacheflush() syscall

 arch/parisc/kernel/cache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C5930AAD8;
	Wed,  6 May 2026 19:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778095346; cv=none; b=kEtUvIC8uCPQRZhqpPZFyVYXTaKrahzgFwnbrOU9sh9znWU2Tpvv0VnbWzDDqqcgiuQGWt0qO0vE2xCId2K0JW4/iM4ZUlxDKssRIxtf8X/4O8Ovjph727AJ5s4iYPuOBz1qCLLwcMOvRRVNArr0LTlEqrDmEfDoYHWSOunH7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778095346; c=relaxed/simple;
	bh=ygABvE+JunXpW5nvqZdyY0jsAFFxrz0ZAiusrQpQUkE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZPP3TygIv/AiUUfLUtXSlqYB6bDtNbZ6X76n/U0MOiQIN0sjrHKiMGQFTMQzJzSED/qYJcIDcvTG8xe+WZhpORMXKK5Pv9IQCD635XEuwaRk5Ut0gKqlpm/0lokdYetZ1Zdbt0bDYpk0x2r5mXZ8v1cI9m/fPwlgjcRqd5kKQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCuyCZeX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCuyCZeX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF31C2BCB0;
	Wed,  6 May 2026 19:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778095346;
	bh=ygABvE+JunXpW5nvqZdyY0jsAFFxrz0ZAiusrQpQUkE=;
	h=Date:From:To:Subject:From;
	b=RCuyCZeXAzmnWOMcUV28OCBPsl0sLs3Or9v5cm111KIrhsbwwG8fi/H5fveaRzRzs
	 iT+Q6QV7723XZHgjGEgywYm3uKAJlWhf0mQOgHyHlCGuaGadLb5Y5riILv/2gLDg4x
	 gsnduKz31Z1iULkUBpscrDNpeiuG+cRduHY1GGaEtK369mHUW9SH+ByKNMCG0e8MDl
	 nQK//OVQMt5CbL49fAtwIXbsa4vX8c+yf8FaIkrBHRflpc9uxMRlCLaZW3rjUgH4k9
	 +BKivQQl4jiWEZLforNWBF2ZoK/rhfDROi7upsqeRj4oyaMt1ZfX2aarvGJQVGEVAl
	 HP3Pz9MMz3ntg==
Date: Wed, 6 May 2026 21:22:22 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fixes for v7.1-rc3
Message-ID: <afuU7lUDaUGho6EH@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull some small fixes for the parisc architecture.

Thanks!
Helge

----------------------------------------------------------------

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.1-rc3

for you to fetch changes up to 37b0dc5e279f35036fb638d1e187197b6c05a76d:

  parisc: Fix IRQ leak in LASI driver (2026-05-04 11:48:12 +0200)

----------------------------------------------------------------
parisc architecture fixes for kernel v7.1-rc3:

- Revert "parisc: led: fix reference leak on failed device registration"
- Fix build failures introduced when allowing to build 32-/64-bit only VDSO
- Switch to dynamic parisc root device to avoid upcoming warnings
- Fix IRQ leak in LASI driver

----------------------------------------------------------------
Helge Deller (3):
      Revert "parisc: led: fix reference leak on failed device registration"
      parisc: Fix build failure for 32-bit kernel with PA2.0 instruction set
      parisc: Fix 64-bit kernel build when CONFIG_COMPAT=n

Hongling Zeng (1):
      parisc: Fix IRQ leak in LASI driver

Johan Hovold (1):
      parisc: drivers: switch to dynamic root device

 arch/parisc/Makefile           | 16 +++++++++++-----
 arch/parisc/include/asm/vdso.h |  7 ++++---
 arch/parisc/kernel/Makefile    |  7 +++++--
 arch/parisc/kernel/drivers.c   | 21 ++++++++++-----------
 drivers/parisc/lasi.c          | 12 ++++++++----
 drivers/parisc/led.c           |  6 ++----
 6 files changed, 40 insertions(+), 29 deletions(-)

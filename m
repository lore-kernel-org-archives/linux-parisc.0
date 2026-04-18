Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30282EC54A;
	Sat, 18 Apr 2026 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776527412; cv=none; b=qqur/Fk+7yFJKE8kAZq3lsovJD1qi1aLn49tqf4wcsWABnpWgnWV0f++YfmkrwmqDwZkyUaMgsTgGoYg2y8HnaeVsaNUSE4mGzQ1gkJUYuf/vSdlMWXMEW7B+qvaYrejr9GWr8HTZgTWiUxn4q6ICu1ZclbS8brM4qVzkCs1TPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776527412; c=relaxed/simple;
	bh=IWfhYjX+2avwyfoH8lZUYfx5k9+r2JO6Atk/w/WsX8k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rYNqdKteTRGYpViG2WlFiYXDpu/5nH5HO3aujG4bOQP9u1bdKiiw3DtqJmDs31mpprH8vhu7bgHLFa9w/7GJ360ZPcTmYW5gyqRstyRqJQ1Fn61YjH8DmsLCx2yCGzhlTW3wqqExZE+bl34WoxFVjJsmV8btvNNXVjvteXG3DCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2vZMz7E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2vZMz7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074E0C19424;
	Sat, 18 Apr 2026 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776527412;
	bh=IWfhYjX+2avwyfoH8lZUYfx5k9+r2JO6Atk/w/WsX8k=;
	h=Date:From:To:Subject:From;
	b=c2vZMz7Ec70rjxtZyo0qBXx8dBr00JfEbSDHTlY9pERJHGMwEJLSkvQrT3AiUC6jx
	 cJ2pVlUeBLf/ES58zJDRE6EOtuEZcsc9HYNHa3ftMjKB3YrkHhwv+tfXPlVgm3nlRU
	 RjO29pz19A/GItJoCdOZdoBe4N654eRMRnejLoGr/TmCmsH/J3cHVLbE91dQmQES7w
	 +2NJa1P+Pmqd+hi8gB1idus20oD7w9Tq6wugwy2Gj4+4UAa+MWrDapNvYgWSzytClm
	 aeGwXGJvl9ZxfPHyvoq5Lztz6PArSIWTo44tUH1M+GHK7EOhm56F0r18+9wdcPWtED
	 lb/ZCbDcWB9ZA==
Date: Sat, 18 Apr 2026 17:50:08 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fixes and updates for v7.1-rc1
Message-ID: <aeOoMH5JI2wjFQrZ@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull fixes and updates for parisc for kernel 7.1-rc1.

One important fix to unbreak modules on 32-bit parisc, which were broken
since kernel v6.19. The other changes are just smaller maintenance cleanups.

Thanks!
Helge

----------------------------------------------------------------

The following changes since commit 43cfbdda5af60ffc6272a7b8c5c37d1d0a181ca9:

  Merge tag 'for-linus-iommufd' of git://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd (2026-04-16 21:21:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.1-rc1

for you to fetch changes up to 707610bcccbd0327530938e33f3f33211a640a4e:

  parisc: led: fix reference leak on failed device registration (2026-04-17 15:46:46 +0200)

----------------------------------------------------------------
parisc architecture fixes and updates for kernel v7.1-rc1:

- A fix to make modules on 32-bit parisc architecture work again
- Drop ip_fast_csum() inline assembly to avoid unaligned memory accesses
- Allow to build kernel without 32-bit VDSO
- Reference leak fix in error path in LED driver

----------------------------------------------------------------
Guangshuo Li (1):
      parisc: led: fix reference leak on failed device registration

Helge Deller (10):
      parisc: Drop ip_fast_csum() inline assembly implementation
      parisc: _llseek syscall is only available for 32-bit userspace
      parisc: Avoid compat syscalls when COMPAT=n
      parisc: is_compat_task() shall return false for COMPAT=n
      parisc: Fix signal code to depend on CONFIG_COMPAT instead of CONFIG_64BIT
      parisc: Fix default stack size when COMPAT=n
      parisc: Allow to disable COMPAT mode on 64-bit kernel
      parisc: Include 32-bit VDSO only when building for 32-bit or compat mode
      parisc: Allow to build without VDSO32
      module.lds.S: Fix modules on 32-bit parisc architecture

Kexin Sun (1):
      parisc: update outdated comments for renamed ccio_alloc_consistent()

 arch/Kconfig                            |  7 +++
 arch/parisc/Kconfig                     |  7 ++-
 arch/parisc/Makefile                    |  6 +-
 arch/parisc/include/asm/checksum.h      | 89 +----------------------------
 arch/parisc/include/asm/compat.h        |  2 +-
 arch/parisc/include/asm/vdso.h          |  2 +
 arch/parisc/kernel/Makefile             |  3 +-
 arch/parisc/kernel/signal.c             | 18 +++---
 arch/parisc/kernel/sys_parisc.c         |  4 ++
 arch/parisc/kernel/syscall.S            | 11 ++--
 arch/parisc/kernel/syscalls/syscall.tbl |  2 +-
 arch/parisc/lib/Makefile                |  2 +-
 arch/parisc/lib/checksum.c              | 99 ---------------------------------
 drivers/parisc/ccio-dma.c               |  8 +--
 drivers/parisc/led.c                    |  6 +-
 scripts/module.lds.S                    |  2 +
 16 files changed, 56 insertions(+), 212 deletions(-)
 delete mode 100644 arch/parisc/lib/checksum.c

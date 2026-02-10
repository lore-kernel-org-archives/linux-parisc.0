Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C1330334;
	Tue, 10 Feb 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754059; cv=none; b=g0PovgOpFhVa514RI3mJNmEX2glnWN4Wt05FY+unS3Zsduc/p9Bk/PGLZJtIYqaiwLFNRR86JiHSKY/uXd6wnosNz4yPp5Jwd8T/8Zi380ZishdScEhrpvpXE6RKbJvcBu/PzZsOkhLYO8FALPae+Uuu5kOe8E7vsIZ3uACWg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754059; c=relaxed/simple;
	bh=WC/I69z9es5QNqWZBvp2YAWzWqvCIMgIkr7rY0nzC+o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TpYw8yobPnXvPxBGl1o/TpeFRkac8XszMmV+wztUA4xdM6VfgGMxItA942By3TOJE/NfUblbrWGnAMOspa5/AEDzUikFoTvRco2Sa+1zrmOxSF30lHu5OehkDRiX39zpu+d0RX1I5BNtFnHy4fWkklKh+4SZlZxVHBx46tZMagk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdoh4yw/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdoh4yw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04472C19421;
	Tue, 10 Feb 2026 20:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770754059;
	bh=WC/I69z9es5QNqWZBvp2YAWzWqvCIMgIkr7rY0nzC+o=;
	h=Date:From:To:Subject:From;
	b=pdoh4yw/Ehlna909Ggr9IwpRwaeCJzmugxPdU88RST9vUFtcgt7tHlabJ59Mcdr28
	 bm0jsoBpvHKdXJd9BMLX4tGLS0p+Hpr/P3Lqf3fBJ04UA912Ub8U9QAotYfNB/wFZs
	 /wwxa65sZms4nxc5+/QiiMMnAT8xOWpqBY6NgLed4XSA+PLsQCh737Ex9KTLYiN9Hx
	 UntlkYGtBFxgfiEBJahTj1m7GpKVfB6HeAmA4A0cmQNK9Z0le5+qENLLkVRN7tp1K5
	 xGCUWLLYoiw0YmTLYtQzJU+v06Ms6joFm1ZzLYBthd9gLI0hi5pfCoW73QktqT2sgX
	 JsUHO/IWlUUpw==
Date: Tue, 10 Feb 2026 21:07:35 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: [GIT PULL] parisc architecture fixes and updates for v7.0-rc1
Message-ID: <aYuQBx7-f11nAgU6@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.0-rc1

for you to fetch changes up to 1651d69443c3a5fc12f1dee1229d526e7af9020a:

  parisc: lba_pci: Add debug code to show IO and PA ranges (2026-02-07 00:45:19 +0100)

----------------------------------------------------------------
parisc architecture fixes and updates for kernel v7.0-rc1:

- Fix device reference leak in error path
- Check if system provides a 64-bit free running platform counter
- Minor fixes in debug code

----------------------------------------------------------------
Haoxiang Li (1):
      parisc: kernel: replace kfree() with put_device() in create_tree_node()

Helge Deller (9):
      parisc: Print hardware IDs as 4 digit hex strings
      parisc: Prevent interrupts during reboot
      parisc: Export model name for MPE/ix
      parisc: Fix module path output in qemu tables
      parisc: Add PDC PAT call to get free running 64-bit counter
      parisc: Enhance debug code for PAT firmware
      parisc: Fix minor printk issues in iosapic debug code
      parisc: Detect 64-bit free running platform counter
      parisc: lba_pci: Add debug code to show IO and PA ranges

 arch/parisc/include/asm/pdcpat.h |  7 +++++--
 arch/parisc/kernel/drivers.c     | 12 ++++++++----
 arch/parisc/kernel/firmware.c    | 27 ++++++++++++++++++++++++++-
 arch/parisc/kernel/inventory.c   | 13 +++++++++++++
 arch/parisc/kernel/process.c     |  3 +++
 arch/parisc/kernel/processor.c   | 26 +++++++++++++-------------
 arch/parisc/kernel/time.c        | 20 ++++++++++++++++++++
 drivers/parisc/iosapic.c         | 21 ++++++++++++---------
 drivers/parisc/lba_pci.c         |  4 ++++
 9 files changed, 104 insertions(+), 29 deletions(-)

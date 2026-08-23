Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E23176EE;
	Sun, 23 Aug 2026 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787505468; cv=none; b=JVUH0c52CXtTxRl32ZD/A31CkFOTxIy2LIxQkExvPRq7sDa5iftkS/3r+qPQyWNExEcjYdpsmweeaCJK9nenGeJzES12w6d6IwqY16LG5zytm2Mkwo6B8852I5c7qR5qlCdqJaW/1ARSC+I/N+cc8jMd9tdVTjE9lIXyYywL360=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787505468; c=relaxed/simple;
	bh=9EG5PtgBiVoddVATnsVdbL+9L6J3JuZMmqv7X0K2VQ4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gbyoe7l7m5wgLRscFDNXevxrdxX2bOXwbWpG8+y+PbgMFMU6ZKh3ZSAITGD9SufQuFf5BkihL/GgYoPUP/E+EQktXz5ABHUC6Q8dY8TSl6kSgahsWvdBp7qucMtPEnjZFgqZjz3vm8oX7GIj+XzrWiqEs5lG9w5L7T0aTumCrmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hm+Rvmwv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hm+Rvmwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECAF1F000E9;
	Sun, 23 Aug 2026 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787505463;
	bh=mBmlMw7A+WRXoferIWkVAPqteu5QBD1DzST2gSzU31A=;
	h=Date:From:To:Subject;
	b=Hm+RvmwvZRPZ81w+xqDwo8aVCGuRchAbuOwv7hA5MkICXpHh56iLOzut3O123zF1N
	 Te2L8fPo5gco9rZzjUHsOjWXa3zbQcAPFIHUfAgHo7c8c0vAM1ycUkfUmEmNcdYzyO
	 9iqc4dYWg5WDOSdHUe9ywnw4Hv34hq7+kzBDY14r+Fu15MvgvVnIiXYtdowrdP9Vkf
	 tAY2kdmrfCejSY8vkl0WJWDhEJuigCxBEkAC+RkQ0zBxXIGEDgMlPnVmJrU/APc6no
	 CnPmRZW1b6aNJVBm7v/fxNu/Rq6L5aPp0bHXsrIyaoLwBMx2c90YKaO4YzydK+SmFl
	 +plzjkNKJdqMw==
Date: Sun, 23 Aug 2026 19:17:39 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Subject: [GIT PULL] parisc architecture fixes and updates for v7.3-rc1
Message-ID: <aosrM-t2ji3ONNMG@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull the fixes and updates for parisc for kernel 7.3-rc1.

Nothing exciting this time, just usual small fixes and cleanups.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 075b74841bd0065a3bda3440873c747938e69b68:

  Linux 7.2-rc6 (2026-08-02 16:24:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-7.3-rc1

for you to fetch changes up to 8b585431a16cfb9d8f2955a9fa0787ce3dceb3c2:

  parisc: eisa: Fix infinite loop when parsing invalid IRQ value (2026-08-18 11:43:05 +0200)

----------------------------------------------------------------
parisc architecture fixes and updates for kernel v7.3-rc1:

- Drop PER_HPUX personality from UAPI headers
- Infinite loop fix when parsing IRQ value in eisa code
- Switch to use asm-generic/serial.h
- Prevent possible unaligned asm code in head.S

----------------------------------------------------------------
Geert Uytterhoeven (1):
      parisc: superio: Spelling s/Peterson/Petersen/

Helge Deller (2):
      UAPI: Drop PER_HPUX personality
      parisc: Fix alignment of asm statements in head.S

Jean Delu (1):
      parisc: eisa_eeprom: Add missing MODULE_DESCRIPTION()

Muhammad Usama Anjum (1):
      parisc: sba_iommu: Remove dead DEBUG_DMB_TRAP code

Pei Xiao (1):
      parisc: eisa: Fix infinite loop when parsing invalid IRQ value

Thorsten Blum (1):
      parisc: Use asm-generic/serial.h

 arch/parisc/include/asm/serial.h |  8 --------
 arch/parisc/kernel/head.S        |  1 +
 drivers/parisc/eisa.c            |  5 +++++
 drivers/parisc/eisa_eeprom.c     |  1 +
 drivers/parisc/sba_iommu.c       | 21 ---------------------
 drivers/parisc/superio.c         |  2 +-
 include/uapi/linux/personality.h |  1 -
 7 files changed, 8 insertions(+), 31 deletions(-)
 delete mode 100644 arch/parisc/include/asm/serial.h

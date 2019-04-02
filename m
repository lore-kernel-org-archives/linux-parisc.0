Return-Path: <SRS0=b8iV=SE=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B615C4360F
	for <linux-parisc@archiver.kernel.org>; Tue,  2 Apr 2019 20:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3F262082C
	for <linux-parisc@archiver.kernel.org>; Tue,  2 Apr 2019 20:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="e4eTbaGA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbfDBUsg (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 2 Apr 2019 16:48:36 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:50722 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfDBUsg (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 2 Apr 2019 16:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=DS1HO1b2fF77wqRHRtI8AAv1m/2oPB3+501gRlgvHEk=; b=e4eTbaGANd5glHfmA7DtvWH3px
        p/VoGqu0PNvDK8UktzjW5Qp4PdmGUzMYsaZVOUWUYj4W/ULJmjnltQEKWo4em/3WU9TtmYrc/pSe0
        dgf2W54iBa6AcnHW3gXMtNCTu1AtEpdEhq4YCZ575R2jzjRq+dkpXGWtM68M085H3mT0=;
Received: from [134.3.47.207] (helo=t470p.stackframe.org)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1hBQKh-0006Pf-5h; Tue, 02 Apr 2019 22:48:35 +0200
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 0/3] Add KGDB support to parisc
Date:   Tue,  2 Apr 2019 22:48:15 +0200
Message-Id: <20190402204818.5929-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi,

these series add fixed mappings, a function to patch kernel text
with RO kernel text and kgdb support to parisc.

Fixed mappings are located at the end of the VMALLOC address range. patch_text()
is introduced based on the ARM implementation, which utilizies fixed mappings.
patch_text() only supports late patching, but we might extend it later with
early patching functionality. And last but not least the last patch adds KGDB
functionality. KGDB was tested on C3750 with a 32 and 64 bit kernel, on C8000
with 64 bit.

Sven Schnelle (3):
  parisc: add set_fixmap()/clear_fixmap()
  parisc: add parisc code patching
  parisc: add KGDB support

 arch/parisc/Kconfig              |   1 +
 arch/parisc/include/asm/fixmap.h |  19 ++-
 arch/parisc/include/asm/kgdb.h   |  68 ++++++++++
 arch/parisc/include/asm/patch.h  |   7 ++
 arch/parisc/kernel/Makefile      |   4 +-
 arch/parisc/kernel/kgdb.c        | 210 +++++++++++++++++++++++++++++++
 arch/parisc/kernel/patch.c       |  78 ++++++++++++
 arch/parisc/kernel/traps.c       |  15 +++
 arch/parisc/mm/Makefile          |   2 +-
 arch/parisc/mm/fixmap.c          |  43 +++++++
 arch/parisc/mm/init.c            |  14 ++-
 11 files changed, 453 insertions(+), 8 deletions(-)
 create mode 100644 arch/parisc/include/asm/kgdb.h
 create mode 100644 arch/parisc/include/asm/patch.h
 create mode 100644 arch/parisc/kernel/kgdb.c
 create mode 100644 arch/parisc/kernel/patch.c
 create mode 100644 arch/parisc/mm/fixmap.c

-- 
2.20.1


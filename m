Return-Path: <SRS0=WSCq=6J=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888F9C55186
	for <linux-parisc@archiver.kernel.org>; Sat, 25 Apr 2020 06:04:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53F5E20857
	for <linux-parisc@archiver.kernel.org>; Sat, 25 Apr 2020 06:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587794667;
	bh=5NvMlhV63s/99rCCCnB1GMnsIpHyd0G8Ug9nKO9hb9E=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=m5psutOBi4fg2Yi3lt4ooUnGfAGo1SVMY1J8mgcveq9Jnfnu0o9/HFYq5tAIqK7v9
	 jC9DhO0Me0uMysp2R1OJmUR/dIepfGW1ZJXY6x0mGmPVpBxTpzyGHomw3tiJdAq8+n
	 Q0+hpoGoLVMmjlRjDcnXk7Fz3p7T3aTZAwMBgxXs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgDYGE1 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 25 Apr 2020 02:04:27 -0400
Received: from condef-03.nifty.com ([202.248.20.68]:19964 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgDYGE0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 25 Apr 2020 02:04:26 -0400
X-Greylist: delayed 641 seconds by postgrey-1.27 at vger.kernel.org; Sat, 25 Apr 2020 02:04:25 EDT
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-03.nifty.com with ESMTP id 03P5ljOg020260
        for <linux-parisc@vger.kernel.org>; Sat, 25 Apr 2020 14:47:45 +0900
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 03P5l4L9017497;
        Sat, 25 Apr 2020 14:47:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 03P5l4L9017497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587793625;
        bh=9lkXFEvtGlkYPvIYcRpnWYNpi83t6Gjxvz28e7hf/RE=;
        h=From:To:Cc:Subject:Date:From;
        b=jX7215SxQFAOrpxTFJSC0ARxP7N8K59iteGl167e+IXIY0PZhrtxCORqZAdxpuPHw
         +PHk227tlHzAGf87Swb7cpETuFu4os7tyVA06XTC7XgB1F3pErDi4NF2wHMrajVrUg
         /5PHLp1E3bcffRaqzGqoE+77W08d1iRSmWV5VprZ5hoWGPdcbepUzRmXFuv9LsJUC9
         avuHuFUJfBY/BcVTfHaePPP6G0bgyFXu1Q2G4wHGDvY+StiRDtgaMkYg5H1QypUYKS
         9TuuC+uOQgMqj9Mz0AjQ8yF+K6xslabdhGFh59r0nW9ltgOmfPV83/qCen58i8Zbds
         QuoPQqHelr82g==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] parisc: suppress error messages for 'make clean'
Date:   Sat, 25 Apr 2020 14:46:59 +0900
Message-Id: <20200425054659.814774-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

'make ARCH=parisc clean' emits a tons of error messages as follows:

  $ make ARCH=parisc clean
  gcc: error: unrecognized command line option '-mno-space-regs'
  gcc: error: unrecognized command line option '-mfast-indirect-calls'; did you mean '-mforce-indirect-call'?
  gcc: error: unrecognized command line option '-mdisable-fpregs'
  gcc: error: missing argument to '-Wframe-larger-than='
  gcc: error: unrecognized command line option '-mno-space-regs'
  gcc: error: unrecognized command line option '-mfast-indirect-calls'; did you mean '-mforce-indirect-call'?
  gcc: error: unrecognized command line option '-mdisable-fpregs'
  gcc: error: missing argument to '-Wframe-larger-than='
    ...

You can supporess them except '-Wframe-larger-than' by setting correct
CROSS_COMPILE=, but we should not require any compiler for cleaning.

This $(shell ...) is evaluated so many times because LIBGCC is exported.
Use the ':=' operator to evaluate it just once, and sink the stderr.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/parisc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 628cd8bb7ad8..d82787da43cd 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -21,7 +21,7 @@ KBUILD_IMAGE := vmlinuz
 
 NM		= sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+= -D__hppa__=1
-LIBGCC		= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
+LIBGCC		:= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name 2>/dev/null)
 export LIBGCC
 
 ifdef CONFIG_64BIT
-- 
2.25.1


Return-Path: <SRS0=MVQE=VA=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A0CC5B578
	for <linux-parisc@archiver.kernel.org>; Wed,  3 Jul 2019 05:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3B8821880
	for <linux-parisc@archiver.kernel.org>; Wed,  3 Jul 2019 05:22:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="Zk/5mbVe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="Zk/5mbVe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfGCFW0 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 3 Jul 2019 01:22:26 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:35596 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725785AbfGCFW0 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 3 Jul 2019 01:22:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id AFA0A8EE1D2
        for <linux-parisc@vger.kernel.org>; Tue,  2 Jul 2019 22:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562131345;
        bh=KAFKOOaSaW02MI/y5hTuRXxWbEgqlr6Eda7++V2+OJU=;
        h=Subject:From:To:Date:From;
        b=Zk/5mbVeM66MJvzXBUgYbbJjsy8C8bB7+Enx3Prk3SSI7aa60YzXH64uYphFcGvuZ
         FduCsUAgvjfiqALWSpp+7oBQ49M9CdhjSplmlxGIDfA2MV6mTW4H6o6ZtY+Gm4kHFB
         3aTYTpfRkpjxyk6CIyXMMmYBSdw//UloadLml4AU=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HuxJyhUyGKBw for <linux-parisc@vger.kernel.org>;
        Tue,  2 Jul 2019 22:22:25 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.68.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 61FE28EE0CC
        for <linux-parisc@vger.kernel.org>; Tue,  2 Jul 2019 22:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1562131345;
        bh=KAFKOOaSaW02MI/y5hTuRXxWbEgqlr6Eda7++V2+OJU=;
        h=Subject:From:To:Date:From;
        b=Zk/5mbVeM66MJvzXBUgYbbJjsy8C8bB7+Enx3Prk3SSI7aa60YzXH64uYphFcGvuZ
         FduCsUAgvjfiqALWSpp+7oBQ49M9CdhjSplmlxGIDfA2MV6mTW4H6o6ZtY+Gm4kHFB
         3aTYTpfRkpjxyk6CIyXMMmYBSdw//UloadLml4AU=
Message-ID: <1562131344.29304.100.camel@HansenPartnership.com>
Subject: [PATCH] palo: fix IPL overlap with ext2/ext3 resize_inode
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Parisc List <linux-parisc@vger.kernel.org>
Date:   Tue, 02 Jul 2019 22:22:24 -0700
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

palo is producing corrupt filesystems because ext2 can't cope with any
of the resize_inode, which is traditionally placed at blocks 3-258,
being in the badblocks list.  If this happens, mke2fs silently
produces a corrupt filesystem image and the palo partition will
eventually trigger a filesystem error.  The fix is to force palo to
specify -O^resize_inode to mke2fs which prevents ext2/3 from
allocating a resize_inode (and thus prevents the filesystem from being
resized).

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 palo/palo.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/palo/palo.c b/palo/palo.c
index 68b85cf..e088993 100644
--- a/palo/palo.c
+++ b/palo/palo.c
@@ -443,7 +443,11 @@ do_cdrom(int media, int kernel32, int kernel64,
 #define EXT2_HOLE	((MAXBLSIZE + 1) / EXT2_BLOCKSIZE)
 
 /* offset in bytes before start of hole,  ext2 doesn't allow holes at
- * to cover the first four blocks of the filesystem */
+ * to cover the first four blocks of the filesystem
+ *
+ * Note: modern ext2/3 has a resize_inode covering blocks 3-258 so you
+ * must either always include the -O^resize_inode when creating the
+ * filesystem or define EXT2_OFFSET to (259*EXT2_BLOCKSIZE)*/
 #define EXT2_OFFSET	(4*EXT2_BLOCKSIZE)
 
 int
@@ -502,7 +506,7 @@ do_formatted(int init, int media, const char *medianame, int partition,
 	    }
 	}
 
-	sprintf(cmd, "mke2fs %s -b %d -l %s %s", do_format == 3 ? "-j" : "",
+	sprintf(cmd, "mke2fs %s -O^resize_inode -b %d -l %s %s", do_format == 3 ? "-j" : "",
 		EXT2_BLOCKSIZE, badblockfilename, partitionname);
 
 	if (verbose)
-- 
2.16.4


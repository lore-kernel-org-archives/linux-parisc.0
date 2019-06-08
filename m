Return-Path: <SRS0=yJk0=UH=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4882C28CC5
	for <linux-parisc@archiver.kernel.org>; Sat,  8 Jun 2019 11:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A13FF216C4
	for <linux-parisc@archiver.kernel.org>; Sat,  8 Jun 2019 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559994727;
	bh=JJG+oXo8L7xI8kAMR0LTR1wt7Hovmkk9f0cgYmJh/l8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=cVxgGwN0iFMYltELoYTLMA5jQOnovG/2dwvZZjbops+WEPZpDUEBot9TfKyD6PkP2
	 3MmwipNBLb9Ir8VA0EzxBIYiv6pTypW7O2+eBx/zLiTM8nbJPjxq37dr3midhVckt+
	 C6wstA8y0ABxaPzGamlbWf42lT7JUVM1twmm5HpQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbfFHLwC (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 8 Jun 2019 07:52:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:36104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729221AbfFHLrY (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 8 Jun 2019 07:47:24 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D12EF214DA;
        Sat,  8 Jun 2019 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559994443;
        bh=JJG+oXo8L7xI8kAMR0LTR1wt7Hovmkk9f0cgYmJh/l8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kFxoOxRRb+qjR0jt6TyvvBuT0xBHtzI7rH2Q6mNfYapwzKGLEmSVJqPOjWYkWajTP
         Lc4BJ1sM8ww5iIp0dnTqmyGDNz9/6iYe9U/iQbl+P/zF9eEnb9tNXYEoUthW0VSUBD
         Z79ZhnLN+SXBZpH10v5TCWWzkNJSTFixNHQHayOI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-parisc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 14/31] net: tulip: de4x5: Drop redundant MODULE_DEVICE_TABLE()
Date:   Sat,  8 Jun 2019 07:46:25 -0400
Message-Id: <20190608114646.9415-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608114646.9415-1-sashal@kernel.org>
References: <20190608114646.9415-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

From: Kees Cook <keescook@chromium.org>

[ Upstream commit 3e66b7cc50ef921121babc91487e1fb98af1ba6e ]

Building with Clang reports the redundant use of MODULE_DEVICE_TABLE():

drivers/net/ethernet/dec/tulip/de4x5.c:2110:1: error: redefinition of '__mod_eisa__de4x5_eisa_ids_device_table'
MODULE_DEVICE_TABLE(eisa, de4x5_eisa_ids);
^
./include/linux/module.h:229:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
extern typeof(name) __mod_##type##__##name##_device_table               \
                    ^
<scratch space>:90:1: note: expanded from here
__mod_eisa__de4x5_eisa_ids_device_table
^
drivers/net/ethernet/dec/tulip/de4x5.c:2100:1: note: previous definition is here
MODULE_DEVICE_TABLE(eisa, de4x5_eisa_ids);
^
./include/linux/module.h:229:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
extern typeof(name) __mod_##type##__##name##_device_table               \
                    ^
<scratch space>:85:1: note: expanded from here
__mod_eisa__de4x5_eisa_ids_device_table
^

This drops the one further from the table definition to match the common
use of MODULE_DEVICE_TABLE().

Fixes: 07563c711fbc ("EISA bus MODALIAS attributes support")
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/dec/tulip/de4x5.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/dec/tulip/de4x5.c b/drivers/net/ethernet/dec/tulip/de4x5.c
index 0affee9c8aa2..0b1e7a96ff49 100644
--- a/drivers/net/ethernet/dec/tulip/de4x5.c
+++ b/drivers/net/ethernet/dec/tulip/de4x5.c
@@ -2108,7 +2108,6 @@ static struct eisa_driver de4x5_eisa_driver = {
 		.remove  = de4x5_eisa_remove,
         }
 };
-MODULE_DEVICE_TABLE(eisa, de4x5_eisa_ids);
 #endif
 
 #ifdef CONFIG_PCI
-- 
2.20.1


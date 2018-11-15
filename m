Return-Path: <SRS0=3seb=N2=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186B8C43441
	for <linux-parisc@archiver.kernel.org>; Thu, 15 Nov 2018 20:10:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B776A20858
	for <linux-parisc@archiver.kernel.org>; Thu, 15 Nov 2018 20:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B776A20858
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbeKPGTX (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 16 Nov 2018 01:19:23 -0500
Received: from mout.gmx.net ([212.227.15.18]:57429 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbeKPGTX (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 16 Nov 2018 01:19:23 -0500
Received: from ls3530.dellerweb.de ([92.116.174.227]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MTTKZ-1fw8DO45tX-00SPRJ; Thu, 15 Nov 2018 21:10:02 +0100
Date:   Thu, 15 Nov 2018 21:09:59 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix serio address output
Message-ID: <20181115200959.GA23425@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Provags-ID: V03:K1:d2a8L9S6B5ovzkr99ebYGCbL45/+2ow3cROnVpt9n8wstGiY/Ca
 QO5i7xC3+smAorzOHca7lrXlTix6hbXnXP9jPHk3WzsBDgREia3bRqTp95RUTy+eAB4/D4n
 /fZKbaDdOgITRH4G526zaiayDmo6glTOEY6x9DkpS6nfIyL35QTtkWAOjKM1lkLtGXCu7WT
 mb8u3aNvDZKyms21IMULA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:DCrUHKZOoDk=:SYAZ9frtBAytL3L7DJfhyx
 I6Az3a7FYkmD9RLJ4ztSocLH8+6y29938XaMvdNktxbWpA661TjqerTL+OCd2GtOq5Ec/BpKh
 7dw/Be0YIvWJnPyQXyLmOec0q/xRldKoepRcdMNeppvMJFLlYZEWGcZdehWGEOsiZlo0FoNLY
 9r5tDkULjh993dvRfp1beI49gPZ0HataRgyK4nILxueM41en5ld0lMcfhq8ODKEbFOidjto7D
 EWCfTR9KOMy2sG7/ivL/YUgGTBHiq2gW9Y8Fk/JyvbqvjqALk6gWg2wFS72Vb8itynODz1Iil
 H/v2scdLQgDf/iNDHgs0P9fti5yj3YGBtURCzd/n3UXESUwDtz2QI/ReD35LyodKSQoT13IP2
 Le0VFTkygI2VNTTmdXORGXfRnKBvakd5Of2nmwEvbVcJ7z9IfOlCfq+1RVrIdMMJXFHa5Zo8z
 KUMJEjRUIcvemCksX3aMYxTx/zc8sV7ytdU/l76Rfi4L5D/jyZ5oo8rMUTaM1J298nfNdRn0t
 2Bi9mSfYAhDNxII2FJNc9YtUUaWb8WA2COVpUgeEjtxTG10bO8BGEWYGYGIwoadQaDV7jck3d
 ev4v89ApfxZKW/sQ3F4nXCcBiU25jCWBA8VPIflh18+YGzX97i/b79/r/f6AEb6eT6m9QC1sg
 zeNo/5RF6Z7G8Ghqrv//jTcaj6BJwaplOK2iqKI/XZ2fB9KZx5jV9ylpkQpmvBQ6mqW5XL10R
 dHKzJgUXVZ6etb/3nVFxjdKynI8RsXulsLUf5N2wVYppsK7Pg0mrr/Rg2ShR2N8O+g3SL2Mxe
 2xQGmu7NAi+ili81xteHaWJi7rDwY+OgHj9FbeUD2FxPglcBZTGfrgNiUyNpNwZx/VzF/WcxH
 HEW+e4GPk0VIagvXMsKCNZIPWmFthOPwgANANHpQ8=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

We want the hpa addresses printed in the serio modules, not some
virtual ioremap()ed address, e.g.:

 serio: gsc-ps2-keyboard port at 0xf0108000 irq 22 @ 2:0:11
 serio: gsc-ps2-mouse port at 0xf0108100 irq 22 @ 2:0:12

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index 49d8d53e50b7..96f9b5397367 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -381,9 +381,9 @@ static int __init gscps2_probe(struct parisc_device *dev)
 		goto fail;
 #endif
 
-	printk(KERN_INFO "serio: %s port at 0x%p irq %d @ %s\n",
+	pr_info("serio: %s port at 0x%08lx irq %d @ %s\n",
 		ps2port->port->name,
-		ps2port->addr,
+		hpa,
 		ps2port->padev->irq,
 		ps2port->port->phys);
 

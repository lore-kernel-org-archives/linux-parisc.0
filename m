Return-Path: <SRS0=TYWj=PD=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B816AC43387
	for <linux-parisc@archiver.kernel.org>; Wed, 26 Dec 2018 19:46:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CBE6214D8
	for <linux-parisc@archiver.kernel.org>; Wed, 26 Dec 2018 19:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbeLZTqm (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 26 Dec 2018 14:46:42 -0500
Received: from mout.gmx.net ([212.227.15.18]:54163 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727368AbeLZTql (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 26 Dec 2018 14:46:41 -0500
Received: from ls3530.dellerweb.de ([92.116.132.153]) by mail.gmx.com
 (mrgmx001 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LomuB-1hH3CH2anz-00gqbj; Wed, 26 Dec 2018 20:46:30 +0100
Date:   Wed, 26 Dec 2018 20:46:27 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Hide built-in serial aux port of Tosca GSP card
Message-ID: <20181226194627.GA22931@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:gVPFRBccoefcIafvKkmCamCvOBkjbhXD/Z9NCt81K4T7hh4tVxY
 L4chK87mii672n3CGiVMWNRYtI24AJ1+3/0fTAeTB+ujIZzzjwjD4EYxhOgf0j3X4+ldr4o
 dOfQKL4k8/230QBHaNts62mfjarSKciOWRxeg9PjV0cHqxy1aHHfr6yc5xcoeLPqCQ4P5pk
 dntzJzZkfnalC7ZPDIAHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xdh6269dap8=:NjHq9c/9etFItnhih/NNla
 R71m85GZ5vecDlRnw2jnu03y8kyyTAEBZPC7fRjShUguTegTPSaZhwZeLcaMF8vf5M6Q7T6Vg
 LdnO17tSwJTcKbOaiKPOupgiQ+CmI4spH8sTb1q5bIF4u/W2fSXAPY9k+SIPqbP+wzoQTgDT8
 IYgU8GIj+2Dlb0rdyKB8rckt8s6mbWctZAq892jND3cl72xnPL3Y/Q+4tMYOlF1iAnFQuk3V1
 uWBQC5QrBU4dzJxOZC2wHm+kDKf/moOFlPfJDsMTunT6avI0WpGuf/S7XFxECdjhY/HAYvYw+
 l6kVVNsNcO14SY+Qo/X26IdYSLmLS6viziQNzS+8/AauCC1UTBrHnx7QWK5nN77KmlWBQwvAi
 gXxlhLnv0fdrZdr4kiA3gFr1iEw64vbLxICeN7pn+CswKadsjoJHKdXd6TTfK3VmI6bf9JW/i
 c2gQDJH0gkA+hfagZOYtbGCVxCheEVDgf1djoJPFkcA20uN5sV8+BiLHz2+1USUXKs+eJQYAO
 0VkKERukjNFtC2KQZ1XN+H/OncI1xNcLbzNSKlr+kLFhhCVP5tYxx7xhQsm+VN+T8w1xK9CEO
 c6KHKo/YzHD/IauvKmL/6bMLcAsoLUMnNoaObmxE+Cpjm9wZTH7PQANZSvxneucX10/lZzuij
 uGA55Dnycr/VTxnDMHlqThNJiNGbxT5IQJJcPLZdmvJeVEVBy88FiInb0r6Tu7GUP2LaVC/zN
 qep77/339nBLVw4eVO5Xuz0sOHVYsuT6Hwd2j56E7wYUvsKmdeuTvsRwuQdnWk+uEsRVtwV1a
 MO51Ms81jsj9K8jJFirk81rWEBt53ULinw2TO/v8AQqa03+CLGmCrALPTFqO9EEL14iyn5VuY
 Sx3AObDgm71ezlYGss4422/iDVUdM941AROpBLnTI=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Similar to commit bcf3f1752a62 ("parisc: Hide Diva-built-in serial aux and
graphics card") it's better to hide the built-in serial AUX port at bootup.
When not hiding the port, the Linux serial driver will try to manage this port
and fails on a A500 server like this:

 serial 0000:00:05.0: enabling device (0000 -> 0003)
 serial 0000:00:05.0: enabling SERR and PARITY (0003 -> 0143)
 0000:00:05.0: ttyS3 at MMIO 0xfffffffff8005000 (irq = 71, base_baud = 115200) is a 16550A
 serial 0000:00:05.0: Couldn't register serial port 0, irq 71, type 2, error -28

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index 69bd98421eb1..d376201bc6a0 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -1743,3 +1743,15 @@ static void quirk_diva_aux_disable(struct pci_dev *dev)
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_HP, PCI_DEVICE_ID_HP_DIVA_AUX,
 	quirk_diva_aux_disable);
+
+static void quirk_tosca_aux_disable(struct pci_dev *dev)
+{
+	if (dev->subsystem_vendor != PCI_VENDOR_ID_HP ||
+	    dev->subsystem_device != 0x104a)
+		return;
+
+	dev_info(&dev->dev, "Hiding Tosca secondary built-in AUX serial device");
+	dev->device = 0;
+}
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_HP, PCI_DEVICE_ID_HP_DIVA,
+	quirk_tosca_aux_disable);

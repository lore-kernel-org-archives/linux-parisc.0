Return-Path: <SRS0=p2uU=QP=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EC5C169C4
	for <linux-parisc@archiver.kernel.org>; Fri,  8 Feb 2019 17:28:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E394E2146E
	for <linux-parisc@archiver.kernel.org>; Fri,  8 Feb 2019 17:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfBHR21 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 8 Feb 2019 12:28:27 -0500
Received: from mout.gmx.net ([212.227.15.19]:47167 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbfBHR21 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 8 Feb 2019 12:28:27 -0500
Received: from ls3530.dellerweb.de ([92.116.155.128]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MTSrf-1giZJF1Ik3-00SPL1; Fri, 08 Feb 2019 18:28:18 +0100
Date:   Fri, 8 Feb 2019 18:28:13 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Show machine product number during boot
Message-ID: <20190208172813.GB29207@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:avcsgRKnPtdrSOtq4UDO9sGJAL+s7xX4AVyJVXs+IivNUaUtLMF
 UYjXH3fHDp2Yo6fx9PqDgxdfMREtAqD4p/oEJTNMFFGKz6WXnNL9r1ozb8tXQgvgzQlxkFL
 0VGO3m1Ssc4Pcq0vV2kvQfAywU5EpiFAPC8kTBSrKIQMwxGyYt621Bp8nRir/bqGhrnGrif
 eh2C0G5QkiSVvWkvKdycw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y6PP8n98TIM=:AJXL+9+mi4GrHPAb9KE/wT
 cn9hhJaDHqMGJWyRTWPsSSjjU3/0Q9kOogaH0G+BmpFEKuHqublyGFXuLhkNOF+t2jixAuxco
 AQPVdNb1isi6YvCP7FX7Ydpw/TMcpEiu0wmF3g/yapRSEL/bPZh71MKSEuwss+eMUdU70SlMn
 fp/H0vHuP3UgOsXftipae/E2nMuJXYGCi6RH0/iYAX1WN3DeYexerpqFM4cM38bwZo49EPP0g
 xNwqJ8854WqBij7LOTsEEE5Ecy74AuulmENBImGH0IvBYgqjTkawhozgG+HcgggFZq/1lOC22
 yTZLpzmmK3YIfAOklu2uuCojVjtirvLHwbgQZKCy2hPRQIgcoMc9NfASHhn6/30HLyP48OWL2
 G2cj47/USjzfj/Z6BcA+ljQdCrmZW7dhtoQ2YxfEYnBkQgZegaBN3X4rwG5UpNh8cwNM7wl7A
 dRN0e4a39UMvN6DQBnW+bsXAhkcXeRaz/7xKckSGC6iIvMWRjsd7OeISdCXV9JeOoP5jygRXe
 V4H1XN2OJY5zn2T33HMF7GAe0S+q+ItsgKvvL0Pu1TVDgHnLjat3T/uw4i8ds+g7bJ6VPWEex
 ZBl1ORyD4nSq9WZb+5mythYMhqhyRyq00nWdGVY1y2UIHHbwDNbgPyeWQkfooipe4cTFSZ98Y
 Z7L6fXHUqRpm2pCcwGYS4ZfL+72gYN27db2p5KtpiYTMRkLcOldm8cQ8AgVMjwBKXdWhfE3WC
 1OSmVjtFA6CjCXTwn+yUHtflil4QUQWKrOE+ErIm7KPuc1ibALSGC2awyqIxcClSpBPqXAzBb
 88m/IP2UPY21I14s2CtoN3NJF9f3TvwUDbaRjOqx171J1n/KDYDiB9QXzBl5ips0+xETE2w9m
 fSHNidT8y5Jh8rEC8SjiU0DVmfmUINp9YejJguCEWJSL6WlHU/kMMunFO1/Hbv
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Ask PDC firmware during boot for the original and current product
number as well as the serial number and show it (if available).

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 5b187d40d604..19bb2e46cd36 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -44,6 +44,7 @@ int pdc_model_sysmodel(char *name);
 int pdc_model_cpuid(unsigned long *cpu_id);
 int pdc_model_versions(unsigned long *versions, int id);
 int pdc_model_capabilities(unsigned long *capabilities);
+int pdc_model_platform_info(char *orig_prod_num, char *current_prod_num, char *serial_no);
 int pdc_cache_info(struct pdc_cache_info *cache);
 int pdc_spaceid_bits(unsigned long *space_bits);
 #ifndef CONFIG_PA20
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index e6f3b49f2fd7..7a17551ea31e 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -568,6 +568,30 @@ int pdc_model_capabilities(unsigned long *capabilities)
         return retval;
 }
 
+/**
+ * pdc_model_platform_info - Returns machine product and serial number.
+ * @orig_prod_num: Return buffer for original product number.
+ * @current_prod_num: Return buffer for current product number.
+ * @serial_no: Return buffer for serial number.
+ *
+ * Returns strings containing the original and current product numbers and the
+ * serial number of the system.
+ */
+int pdc_model_platform_info(char *orig_prod_num, char *current_prod_num,
+		char *serial_no)
+{
+	int retval;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pdc_lock, flags);
+	retval = mem_pdc_call(PDC_MODEL, PDC_MODEL_GET_PLATFORM_INFO,
+		__pa(orig_prod_num), __pa(current_prod_num), __pa(serial_no));
+	convert_to_wide(pdc_result);
+	spin_unlock_irqrestore(&pdc_lock, flags);
+
+	return retval;
+}
+
 /**
  * pdc_cache_info - Return cache and TLB information.
  * @cache_info: The return buffer.
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index 82bd0d0927ce..7f4d042856b5 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -242,6 +242,7 @@ static int __init processor_probe(struct parisc_device *dev)
 void __init collect_boot_cpu_data(void)
 {
 	unsigned long cr16_seed;
+	char orig_prod_num[64], current_prod_num[64], serial_no[64];
 
 	memset(&boot_cpu_data, 0, sizeof(boot_cpu_data));
 
@@ -301,6 +302,14 @@ void __init collect_boot_cpu_data(void)
 	_parisc_requires_coherency = (boot_cpu_data.cpu_type == mako) ||
 				(boot_cpu_data.cpu_type == mako2);
 #endif
+
+	if (pdc_model_platform_info(orig_prod_num, current_prod_num, serial_no) == PDC_OK) {
+		printk(KERN_INFO "product %s, original product %s, S/N: %s\n",
+			current_prod_num, orig_prod_num, serial_no);
+		add_device_randomness(orig_prod_num, strlen(orig_prod_num));
+		add_device_randomness(current_prod_num, strlen(current_prod_num));
+		add_device_randomness(serial_no, strlen(serial_no));
+	}
 }
 
 

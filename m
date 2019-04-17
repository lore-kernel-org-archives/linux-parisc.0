Return-Path: <SRS0=jXT6=ST=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5E2C282DA
	for <linux-parisc@archiver.kernel.org>; Wed, 17 Apr 2019 21:09:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32B6A2183E
	for <linux-parisc@archiver.kernel.org>; Wed, 17 Apr 2019 21:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbfDQVJy (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 17 Apr 2019 17:09:54 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:40846 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728074AbfDQVJy (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 17 Apr 2019 17:09:54 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190417210953.JEIE4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Wed, 17 Apr 2019 17:09:53 -0400
Received: from [192.168.0.183] (really [67.70.70.35]) by torspm02.bell.net
          with ESMTP
          id <20190417210953.KAPN30132.torspm02.bell.net@[192.168.0.183]>;
          Wed, 17 Apr 2019 17:09:53 -0400
Subject: Re: [PATCH] parisc: Remove lock code to serialize TLB operations in
 pacache.S
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc:     linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <bd9ad9ce-8e83-6653-00d9-68b8504efc11@bell.net>
 <20190417205515.GA2001@t470p.stackframe.org>
 <19e13735-bfe6-531a-1920-d8955546040e@gmx.de>
 <a8829e22-e5e7-a896-5cd3-0cc82a96c227@gmx.de>
From:   John David Anglin <dave.anglin@bell.net>
Openpgp: preference=signencrypt
Message-ID: <28d40070-75b9-a5c3-94ab-544345723cd9@bell.net>
Date:   Wed, 17 Apr 2019 17:09:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a8829e22-e5e7-a896-5cd3-0cc82a96c227@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_x a=C6YE1pi530fUolnhqNw7rA==:117 a=C6YE1pi530fUolnhqNw7rA==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=VwQbUJbxAAAA:8 a=Q1nb7qljDLDfjy7-nZYA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22 a=AjGcO6oz07-iQ99wixmX:22
X-CM-Envelope: MS4wfH7OPl92vAoAFRs3FGUUqYzGlgMcloBbnxREdV43QKWdi1ZdNTKEdkqTMDlV5wtlpDMN1fxndYKaMq9M6vIdlLH57j/UePkMs7KAvzHck3VRppl3gLr7 /KfK0oeptvxMCLg25Q0GF4jFVGGDqHQ22gQfB+iFgjfqtcsEoo+fnMS4IlZLJpoe9iFTqMahv0NXaQ==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 2019-04-17 5:01 p.m., Helge Deller wrote:
> On 17.04.19 22:58, Helge Deller wrote:
>> On 17.04.19 22:55, Sven Schnelle wrote:
>>> On Fri, Apr 12, 2019 at 07:12:04PM -0400, John David Anglin wrote:
>>>> TLB operations only need to be serialized on machines with the Merced (Stretch) bus.
>>>> The only machines in this category are L and N class, and they require a 64-bit PA 2.0
>>>> kernel.  On these machines, we use local TLB purges in the tmpalias routines.  We don't
>>>> need to serialize TLB purges on all other machines.  Thus, the lock/unlock code can be
>>>> removed when CONFIG_PA20 is not defined.  Further, when CONFIG_PA20 is not defined,
>>>> alternative patching converts the TLB purges to local purges when PA 2.0 hardware has
>>>> been detected.
>>>>
>>>> Signed-off-by: John David Anglin <dave.anglin@bell.net>
>>> I had this patch running on my C8000 and J5000 for a few days, and haven't
>>> encountered any issues.
>> Nah...
>> I do have one of the critical machines (rp5470), and I tried
>> to add the necessary code to detect and handle the TLB serialization.
>> Until now the patch sadly doesn't work yet (hangs at boot), it still needs more work.
>> You can find it in my git tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=tlb-flush-merced-bus&id=fc6044f83cb9828ec6ebecb23a46549d9ebc518f
> Please ignore my comments.
> Dave's patch is OK.
>
> I mixed it up with the Mikulas Patocka's patch: "use per-pagetable spinlock"
> https://patchwork.kernel.org/patch/10888249/

I think this hunk needs fixing to handle merced case:

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 5796524a3137..3e11fdd9d3af 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -48,14 +48,9 @@
     .level 2.0
 #endif
 
-    .import        pa_tlb_lock,data
-    .macro  load_pa_tlb_lock reg
-#if __PA_LDCW_ALIGNMENT > 4
-    load32    PA(pa_tlb_lock) + __PA_LDCW_ALIGNMENT-1, \reg
-    depi    0,31,__PA_LDCW_ALIGN_ORDER, \reg
-#else
-    load32    PA(pa_tlb_lock), \reg
-#endif
+    .macro  load_process_pte_lock reg
+    mfctl        %cr25,\reg
+    addil        L%((PAGE_SIZE << PGD_ALLOC_ORDER) - PAGE_SIZE),\reg
     .endm
 
     /* space_to_prot macro creates a prot id from a space id */


-- 
John David Anglin  dave.anglin@bell.net


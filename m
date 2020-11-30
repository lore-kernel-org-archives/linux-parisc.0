Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84099C64E7B
	for <linux-parisc@archiver.kernel.org>; Mon, 30 Nov 2020 15:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CCEB20719
	for <linux-parisc@archiver.kernel.org>; Mon, 30 Nov 2020 15:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgK3PHs (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:07:48 -0500
Received: from out02.mta.xmission.com ([166.70.13.232]:47706 "EHLO
        out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgK3PHs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 30 Nov 2020 10:07:48 -0500
X-Greylist: delayed 1309 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Nov 2020 10:07:48 EST
Received: from in02.mta.xmission.com ([166.70.13.52])
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1kjkQY-000kSf-4d; Mon, 30 Nov 2020 07:45:18 -0700
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95] helo=x220.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1kjkQU-001Uc9-1V; Mon, 30 Nov 2020 07:45:17 -0700
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
        <155a20fd-09c4-df35-9cc6-8526a89c2933@infradead.org>
        <20201128084414.3daa87d2@canb.auug.org.au>
Date:   Mon, 30 Nov 2020 08:44:44 -0600
In-Reply-To: <20201128084414.3daa87d2@canb.auug.org.au> (Stephen Rothwell's
        message of "Sat, 28 Nov 2020 08:44:13 +1100")
Message-ID: <87pn3unbtv.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1kjkQU-001Uc9-1V;;;mid=<87pn3unbtv.fsf@x220.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX18L++z/WGJY5Gw4SH8IUJ/lWI0CwB3Tf5E=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: linux-next: Tree for Nov 27 (parisc: signal flags)
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> On Fri, 27 Nov 2020 10:43:07 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 11/27/20 1:04 AM, Stephen Rothwell wrote:
>> > Hi all,
>> > 
>> > Changes since 20201126:
>> >   
>> 
>> on parisc, _SA_SIGGFAULT is undefined and causing build errors.
>> 
>> commit 23acdc76f1798b090bb9dcc90671cd29d929834e
>> Author: Peter Collingbourne <pcc@google.com>
>> Date:   Thu Nov 12 18:53:34 2020 -0800
>> 
>>     signal: clear non-uapi flag bits when passing/returning sa_flags
>> 
>> 
>> 
>> _SA_SIGGFAULT is not used or defined anywhere else in the
>> kernel source tree.
>
>
> _SA_SIGGFAULT was removed by commit
>
>   41f5a81c07cd ("parisc: Drop HP-UX specific fcntl and signal flags")
>
> which was added to Linus' tree in v5.10-rc1.

Thanks.

It looks like one of the patches in the patchset took so long it got out
of date.  I will sort it out.

Eric


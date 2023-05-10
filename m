Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8D1C7EE22
	for <linux-parisc@archiver.kernel.org>; Wed, 10 May 2023 04:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjEJEMp (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 10 May 2023 00:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjEJEMn (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 10 May 2023 00:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2446E6A
        for <linux-parisc@vger.kernel.org>; Tue,  9 May 2023 21:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683691918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EhMhj5d/G7n1EDqnhcO4ODQXL3YvB1dKGcoGs91Uegg=;
        b=b5KIAiyZJAU9GPE13VTHohcrcThAqZcgUH1PIlNO8bbBJjKXzKuloyw+cFThQoCnFNmQ7n
        0tO0TWSPErtDxE/uq8OL9kewr0NIlNfikKH0L9JLAtsctPi/tP+7U4bhZFZeHrwKeRhgR/
        7LcDSMYEUYpIM5R7oaURwa3x9vEgm7c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-b1P_QNRuOCqoEZ1_-JsbBw-1; Wed, 10 May 2023 00:11:52 -0400
X-MC-Unique: b1P_QNRuOCqoEZ1_-JsbBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB3F529DD990;
        Wed, 10 May 2023 04:11:51 +0000 (UTC)
Received: from localhost (ovpn-12-62.pek2.redhat.com [10.72.12.62])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B37A61121314;
        Wed, 10 May 2023 04:11:50 +0000 (UTC)
Date:   Wed, 10 May 2023 12:11:47 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Simon Horman <horms@kernel.org>
Cc:     "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        kexec@lists.infradead.org, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] parisc: kexec: include reboot.h
Message-ID: <ZFsZg0fvPA2/eysa@MiWiFi-R3L-srv>
References: <20230508-parisc-kexec-include-reboot-v1-1-78a155a8a0a4@kernel.org>
 <ZFoL9ntYCCfZFCNs@bhe.users.ipa.redhat.com>
 <ZFo0Gd/Eucw/0gtC@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFo0Gd/Eucw/0gtC@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 05/09/23 at 01:52pm, Simon Horman wrote:
> On Tue, May 09, 2023 at 05:01:42PM +0800, Baoquan He wrote:
> > On 05/09/23 at 09:01am, Simon Horman wrote:
> > > Include reboot.h in machine_kexec.c for declaration of
> > > machine_crash_shutdown and machine_shutdown.
> > > 
> > > gcc-12 with W=1 reports:
> > > 
> > >  arch/parisc/kernel/kexec.c:57:6: warning: no previous prototype for 'machine_crash_shutdown' [-Wmissing-prototypes]
> > >     57 | void machine_crash_shutdown(struct pt_regs *regs)
> > >        |      ^~~~~~~~~~~~~~~~~~~~~~
> > >  arch/parisc/kernel/kexec.c:61:6: warning: no previous prototype for 'machine_shutdown' [-Wmissing-prototypes]
> > >     61 | void machine_shutdown(void)
> > >        |      ^~~~~~~~~~~~~~~~
> > > 
> > > No functional changes intended.
> > > Compile tested only.
> > > 
> > > Signed-off-by: Simon Horman <horms@kernel.org>
> > 
> > Acked-by: Baoquan He <bhe@redhat.com>
> > 
> > We may need to find out the places in all architectures and fix all of
> > them.
> 
> I did check. It seemed to be needed for riscv, m68k and parisc.
> I've sent out patches for all three. But I may have missed something.

That's great, thanks. I didn't notice the other two.


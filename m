Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435ACC636CC
	for <linux-parisc@archiver.kernel.org>; Thu, 16 Feb 2023 13:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjBPNun (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 16 Feb 2023 08:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjBPNum (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 16 Feb 2023 08:50:42 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618683B670;
        Thu, 16 Feb 2023 05:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Ibnv8g16Ve+hYFdGWqnh6F06K0enaspoNkBCEKjxOJc=; b=IoxP6R7Cl/R9XNaQb6AwS9idS+
        J/BHLHSnaMKMw/FKz4eMaKhyhz3faSEajfaAsYu/iWYOsXbMRPLG21wgk7bDPIfk/2wCR9YZiczUt
        FyKt9rgYAYnZHLAbNEuLIUegoi0FJDND6zodaG1pv6gAHqt0iZvw0eMMYZiYGVbo2JS0+G9UVEA7/
        SNWZbkGFeQl4eANlk6P/qceI1sgaNrjtvjiotpFYoVc9kYU0i+eObR2W5D7hb7Dabl7V+idn3mwQp
        WvBKjEwLzODwbW+4/ORdXRb2sZOAEPKjTCPFSs1hJe7R2LuUJBz7H57qAYsZtGFVIqURyXZf1jCpd
        xQNhJH2A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pSeee-008SPM-1C; Thu, 16 Feb 2023 13:50:32 +0000
Date:   Thu, 16 Feb 2023 13:50:31 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Baoquan He <bhe@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
        hch@infradead.org, agordeev@linux.ibm.com,
        wangkefeng.wang@huawei.com, schnelle@linux.ibm.com,
        David.Laight@aculab.com, shorne@gmail.com, arnd@arndb.de,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v4 12/16] parisc: mm: Convert to GENERIC_IOREMAP
Message-ID: <Y+40p3oegc2Of9w2@casper.infradead.org>
References: <20230216123419.461016-1-bhe@redhat.com>
 <20230216123419.461016-13-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216123419.461016-13-bhe@redhat.com>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Thu, Feb 16, 2023 at 08:34:15PM +0800, Baoquan He wrote:
> Meanwhile, add macro ARCH_HAS_IOREMAP_WC since the added ioremap_wc()
> will conflict with the one in include/asm-generic/iomap.h, then an
> compiling error is seen:

Huh?  ARCH_HAS_IOREMAP_WC comes up nowhere else in this patchset, and
the current definition of ioremap_wc() is guarded by an ifndef ioremap_wc

> +#define ioremap_wc(addr, size)  \
> +	ioremap_prot((addr), (size), _PAGE_IOREMAP)

This should be enough all by itself.

Return-Path: <SRS0=XMze=O5=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3ABCC43387
	for <linux-parisc@archiver.kernel.org>; Thu, 20 Dec 2018 17:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FD902186A
	for <linux-parisc@archiver.kernel.org>; Thu, 20 Dec 2018 17:37:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387662AbeLTRhT (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 20 Dec 2018 12:37:19 -0500
Received: from verein.lst.de ([213.95.11.211]:54391 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387591AbeLTRhT (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 20 Dec 2018 12:37:19 -0500
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 5076F68AA6; Thu, 20 Dec 2018 18:37:17 +0100 (CET)
Date:   Thu, 20 Dec 2018 18:37:17 +0100
From:   "hch@lst.de" <hch@lst.de>
To:     Eugeniy Paltsev <eugeniy.paltsev@synopsys.com>
Cc:     "hch@lst.de" <hch@lst.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "vineet.gupta1@synopsys.com" <vineet.gupta1@synopsys.com>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
        "ashutosh.dixit@intel.com" <ashutosh.dixit@intel.com>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>,
        "monstr@monstr.eu" <monstr@monstr.eu>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
Subject: Re: ensure dma_alloc_coherent always returns zeroed memory
Message-ID: <20181220173717.GA20939@lst.de>
References: <20181214082515.14835-1-hch@lst.de> <20181219165939.GA26087@lst.de> <1545316369.14089.20.camel@synopsys.com> <20181220143415.GA17726@lst.de> <1545316759.14089.22.camel@synopsys.com> <20181220144604.GA18034@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181220144604.GA18034@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Btw, can you try wit the very latests dma-mapping-for-next tree
which has a new fix from Thierry Reding that might be related.

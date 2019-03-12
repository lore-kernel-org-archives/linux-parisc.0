Return-Path: <SRS0=dOuI=RP=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040F7C43381
	for <linux-parisc@archiver.kernel.org>; Tue, 12 Mar 2019 11:54:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3C0220657
	for <linux-parisc@archiver.kernel.org>; Tue, 12 Mar 2019 11:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbfCLLyH (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 12 Mar 2019 07:54:07 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45160 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfCLLyH (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 12 Mar 2019 07:54:07 -0400
Received: by mail-qk1-f194.google.com with SMTP id z76so1177319qkb.12
        for <linux-parisc@vger.kernel.org>; Tue, 12 Mar 2019 04:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2kYB1p/b/VSU9SsB3LoLb0aZfIgS7NS7Z3NfTbSHKls=;
        b=lW7RcqSUfEea2m9z5oVx+vlbSBOzYpMlZW1pbEVjYa8EWVUiXhIuQCrpvEvDUQivKv
         3uLjodKcj+9PjOmzgKUaUSLVPJ9XIvg+CC6wmS2joIUXbH08w4Yw2AkPB8EEDkY9dmBG
         BJ5anh6/WHrBwXzltn6akg39hhoULNepEAH6E7hRR22JY0UeaRBivvURCNspVFFPg6mb
         rhbzUzoCS/A+slZY50LohEz7wCtgrE+wlKf6U6k1+2My5hdXtl69SrsKvMG0SiRHAPPd
         l+E+8li9YimVmING0sxAOPlt6Z3D1x7UNBmTMr5d41UP93v7HgSZms9KxIGNhT0hUwQA
         cuvQ==
X-Gm-Message-State: APjAAAVylWJIeNobHjTTnEr9h8VlqtvBOaSnEQ9IJsD6WFww8kEVVy0Y
        EgDVo8rr+f2sISxXOdXbp7+NfQmO7Do=
X-Google-Smtp-Source: APXvYqxlYyfklOn1Ixv2yLTKmxFig1ic497FcTleSgokOtZQtp/NrlhMzHsNN0QtF+AybUzOKVjxPQ==
X-Received: by 2002:ae9:ec13:: with SMTP id h19mr17835707qkg.345.1552391646180;
        Tue, 12 Mar 2019 04:54:06 -0700 (PDT)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net. [173.76.246.42])
        by smtp.gmail.com with ESMTPSA id s186sm2889766qkb.57.2019.03.12.04.54.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2019 04:54:04 -0700 (PDT)
Date:   Tue, 12 Mar 2019 07:54:02 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     David Miller <davem@davemloft.net>, hch@infradead.org,
        kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        peterx@redhat.com, linux-mm@kvack.org, aarcange@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org
Subject: Re: [RFC PATCH V2 0/5] vhost: accelerate metadata access through
 vmap()
Message-ID: <20190312075033-mutt-send-email-mst@kernel.org>
References: <20190308141220.GA21082@infradead.org>
 <56374231-7ba7-0227-8d6d-4d968d71b4d6@redhat.com>
 <20190311095405-mutt-send-email-mst@kernel.org>
 <20190311.111413.1140896328197448401.davem@davemloft.net>
 <6b6dcc4a-2f08-ba67-0423-35787f3b966c@redhat.com>
 <20190311235140-mutt-send-email-mst@kernel.org>
 <76c353ed-d6de-99a9-76f9-f258074c1462@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76c353ed-d6de-99a9-76f9-f258074c1462@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Mar 12, 2019 at 03:17:00PM +0800, Jason Wang wrote:
> 
> On 2019/3/12 上午11:52, Michael S. Tsirkin wrote:
> > On Tue, Mar 12, 2019 at 10:59:09AM +0800, Jason Wang wrote:
> > > On 2019/3/12 上午2:14, David Miller wrote:
> > > > From: "Michael S. Tsirkin" <mst@redhat.com>
> > > > Date: Mon, 11 Mar 2019 09:59:28 -0400
> > > > 
> > > > > On Mon, Mar 11, 2019 at 03:13:17PM +0800, Jason Wang wrote:
> > > > > > On 2019/3/8 下午10:12, Christoph Hellwig wrote:
> > > > > > > On Wed, Mar 06, 2019 at 02:18:07AM -0500, Jason Wang wrote:
> > > > > > > > This series tries to access virtqueue metadata through kernel virtual
> > > > > > > > address instead of copy_user() friends since they had too much
> > > > > > > > overheads like checks, spec barriers or even hardware feature
> > > > > > > > toggling. This is done through setup kernel address through vmap() and
> > > > > > > > resigter MMU notifier for invalidation.
> > > > > > > > 
> > > > > > > > Test shows about 24% improvement on TX PPS. TCP_STREAM doesn't see
> > > > > > > > obvious improvement.
> > > > > > > How is this going to work for CPUs with virtually tagged caches?
> > > > > > Anything different that you worry?
> > > > > If caches have virtual tags then kernel and userspace view of memory
> > > > > might not be automatically in sync if they access memory
> > > > > through different virtual addresses. You need to do things like
> > > > > flush_cache_page, probably multiple times.
> > > > "flush_dcache_page()"
> > > 
> > > I get this. Then I think the current set_bit_to_user() is suspicious, we
> > > probably miss a flush_dcache_page() there:
> > > 
> > > 
> > > static int set_bit_to_user(int nr, void __user *addr)
> > > {
> > >          unsigned long log = (unsigned long)addr;
> > >          struct page *page;
> > >          void *base;
> > >          int bit = nr + (log % PAGE_SIZE) * 8;
> > >          int r;
> > > 
> > >          r = get_user_pages_fast(log, 1, 1, &page);
> > >          if (r < 0)
> > >                  return r;
> > >          BUG_ON(r != 1);
> > >          base = kmap_atomic(page);
> > >          set_bit(bit, base);
> > >          kunmap_atomic(base);
> > >          set_page_dirty_lock(page);
> > >          put_page(page);
> > >          return 0;
> > > }
> > > 
> > > Thanks
> > I think you are right. The correct fix though is to re-implement
> > it using asm and handling pagefault, not gup.
> 
> 
> I agree but it needs to introduce new helpers in asm  for all archs which is
> not trivial.

We can have a generic implementation using kmap.

> At least for -stable, we need the flush?
> 
> 
> > Three atomic ops per bit is way to expensive.
> 
> 
> Yes.
> 
> Thanks

See James's reply - I stand corrected we do kunmap so no need to flush.

-- 
MST

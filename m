Return-Path: <SRS0=kyJK=7B=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2BCC433E0
	for <linux-parisc@archiver.kernel.org>; Tue, 19 May 2020 16:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBC32207C4
	for <linux-parisc@archiver.kernel.org>; Tue, 19 May 2020 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589906111;
	bh=k5cskPiRg2azYZesiHKpC+Uxfv5dSMfvTZXTYNV3j1o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=xwpOR5N1dzQMVK1E7pcnQP9CFmtPNDWpveIO6ODba6a7y2deAqmdjmBxfvH+VONsr
	 py0T6oKvd27S+o6nMQbwFAbbmnvy9xZAPuWS+1IWcyqBWydOHtDLH3gcJ6fh2QE3SL
	 vvkIl2fiXn61INBtHznYCU+Eh94Q0RajHSMNLWZY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729303AbgESQfL (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 19 May 2020 12:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729219AbgESQfK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 19 May 2020 12:35:10 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77573C08C5C2
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:35:10 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 82so88348lfh.2
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=54tiBIP0EU7n2aZj7YIONdjaPqjtzHIpQK/HSrYUxTM=;
        b=BKlafAkH7UQm8tvxZZNMBXFgkeIFjR+sjrqKcA5zu8XfgLo2XsHzCIggLB+hau5PqY
         bXm4UtHx7/hgToK6wSRtXVRYfkosw2PzhwIv8qXaSb+oYyfc0spNrlQZmy04cFyxd8aX
         2/kuksBERD9XsYiDJcDnbRjB+/bFhGsJeMkcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=54tiBIP0EU7n2aZj7YIONdjaPqjtzHIpQK/HSrYUxTM=;
        b=nHYwjxD0Yx3icNHqi/69F5htef52Gkadx4Ur9tmyvxuwAckXoVnw4lUJW9Uu8UT6UY
         RJzRJHhbYwvMJFbQf6y5Vn7p9DjFvIQCLzIWWn7tR33vMDQMAO6luiRKsbNFhDb16/Zu
         uqs6h0ZReJM3BD/q/TodDFyYq+V8zbynSAjNTIPwOvR0Vv+LS1PI9Da8bG76x1QwLBLz
         /1AzdmJbkXETH5ZDZt/k//uz83vevNrUwZfpqxzBReuDqaYAHzfXWNmaQT5s75+AkRe6
         mrLbPDwPe5dxKsi+BOpHWU1X59L+DeQIFDRYHPCu3+MOshe8EbNDyLRLfbn+3XR64K2e
         5Okg==
X-Gm-Message-State: AOAM5327zFf4ZAKg/PmnLcwwmNc+XKETlXU8v9xxy8Za7G7w4SNHdC5W
        BZRfJs5VM4p3GCjPvAICv9VE+Co7GvA=
X-Google-Smtp-Source: ABdhPJzfCxqF0Z7RLN/vPLnIfkhFl/kuYTLEJtaE3gLvOrNCKqY37iFw3sbGSfgIIHrNLdSG8zW/Jg==
X-Received: by 2002:a05:6512:682:: with SMTP id t2mr1906170lfe.101.1589906107910;
        Tue, 19 May 2020 09:35:07 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id n2sm9277347lfl.53.2020.05.19.09.35.06
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 09:35:06 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 82so88215lfh.2
        for <linux-parisc@vger.kernel.org>; Tue, 19 May 2020 09:35:06 -0700 (PDT)
X-Received: by 2002:ac2:5a4c:: with SMTP id r12mr1549357lfn.10.1589906105818;
 Tue, 19 May 2020 09:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200519134449.1466624-1-hch@lst.de>
In-Reply-To: <20200519134449.1466624-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 19 May 2020 09:34:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=whj0zVP-ErHcqGNrM0-bZ+TvSFAwpEd+pKFadZeFXj5PA@mail.gmail.com>
Message-ID: <CAHk-=whj0zVP-ErHcqGNrM0-bZ+TvSFAwpEd+pKFadZeFXj5PA@mail.gmail.com>
Subject: Re: clean up and streamline probe_kernel_* and friends v3
To:     Christoph Hellwig <hch@lst.de>
Cc:     "the arch/x86 maintainers" <x86@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-parisc@vger.kernel.org,
        linux-um <linux-um@lists.infradead.org>,
        Netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, May 19, 2020 at 6:44 AM Christoph Hellwig <hch@lst.de> wrote:
>
>  - rebased on 5.7-rc6 with the bpf trace format string changes

Other than the critique about illegible conditionals in the result
when doing that bpf/trace conversion, I like it.

                  Linus

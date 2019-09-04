Return-Path: <SRS0=mLgw=W7=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E560C3A5A9
	for <linux-parisc@archiver.kernel.org>; Wed,  4 Sep 2019 21:17:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3F2020828
	for <linux-parisc@archiver.kernel.org>; Wed,  4 Sep 2019 21:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567631868;
	bh=LuUtzpYz+SszjJS1ASCTqLWs6NSw/g3zdJ1//DUUYJs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=mkGCrOHgt7JvU9bSXpnj0TPdfmSx5FcH2wo6EWIbOzaOoYy13ZEd5pEthmYn7itev
	 UlELPL/o3jYzoeBWXQhH9ncNwxo9kTFmbgdBYHdvY8BSYXoNLZAoRLjw7BdNxHiqYU
	 I4OkqiR9Ww4AsiwmLO+jPN8J/2ghHC6+GvsmZeeE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfIDVRs (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 4 Sep 2019 17:17:48 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39483 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfIDVRs (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 4 Sep 2019 17:17:48 -0400
Received: by mail-lf1-f68.google.com with SMTP id l11so167099lfk.6
        for <linux-parisc@vger.kernel.org>; Wed, 04 Sep 2019 14:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hgF2nRVhP2Z9Hk/CZOFcXhAAs++h0MvE3fMY8xcOeYw=;
        b=V0fXrvG/y6fw7T3tD/KUlmTDsOhByRFRgMw+QxPA9hiU5TDgpngn7HfopRM+i/LJMb
         k2AA+nRMkFxYb/ldSeHBR5el3bmmhNNCMxw9ToB+OOlkWRR6wchZHlLiKsQK9TmfmvjP
         dVvrUijYkfU5Fh9X3uECYhU3OGmtsUJMmdGfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hgF2nRVhP2Z9Hk/CZOFcXhAAs++h0MvE3fMY8xcOeYw=;
        b=WfXW72fgKB/s3QEAVUWbhT6g4Pfnu5301cpTS4X0VzNAG71yIACjr3rccWGhH56LBl
         m01EBvNQrPgamzZthzRh+CCC2Q0Jo7GcUeEDiikQ9sh2j2eHDd+4Ry/NjBBYPE6h3Jhx
         T96NGpIQceeMbuXGvchCLSwdoj3mSoUJORpurgyUTMo8YhOAMELKJOqsEm8F3v66qaA0
         xjdYxx+NVzypGErDOekBQXaaEFuzhjX4A+tsXj63TTq0a4odskFGdUz2anAcAOMN8Bcd
         wFt+nkeiqn4HPdIEIPdKUFVp2pjsZc/9u0I2EBrbkG2xFbYHzApz4R6KJ0I1uIUjncQI
         CYbQ==
X-Gm-Message-State: APjAAAXmueRIoIB4ku7bY5ldkSczYERc0kYXG+3uD3vxeIP5SPQe0+yV
        VjmdS5XvCEpEMDm0TWfND1bJFAvfP20=
X-Google-Smtp-Source: APXvYqwQ6mL69Cmux7lRfmF7U0Z6gHQy0iDsQwZTTH0uOXpbZ2YiDSUTONuzTEn/gQ4CEYNNJY1AMg==
X-Received: by 2002:a19:2c1:: with SMTP id 184mr127973lfc.100.1567631865923;
        Wed, 04 Sep 2019 14:17:45 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id k21sm1698lfm.68.2019.09.04.14.17.45
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2019 14:17:45 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id t14so187983lji.4
        for <linux-parisc@vger.kernel.org>; Wed, 04 Sep 2019 14:17:45 -0700 (PDT)
X-Received: by 2002:a2e:8507:: with SMTP id j7mr10579330lji.156.1567631404184;
 Wed, 04 Sep 2019 14:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-11-cyphar@cyphar.com>
In-Reply-To: <20190904201933.10736-11-cyphar@cyphar.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 4 Sep 2019 14:09:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com>
Message-ID: <CAHk-=wiod1rQMU+6Zew=cLE8uX4tUdf42bM5eKngMnNVS2My7g@mail.gmail.com>
Subject: Re: [PATCH v12 10/12] namei: aggressively check for nd->root escape
 on ".." resolution
To:     Aleksa Sarai <cyphar@cyphar.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian@brauner.io>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Tycho Andersen <tycho@tycho.ws>,
        David Drysdale <drysdale@google.com>,
        Chanho Min <chanho.min@lge.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Aleksa Sarai <asarai@suse.de>,
        Linux Containers <containers@lists.linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, Sep 4, 2019 at 1:23 PM Aleksa Sarai <cyphar@cyphar.com> wrote:
>
> This patch allows for LOOKUP_BENEATH and LOOKUP_IN_ROOT to safely permit
> ".." resolution (in the case of LOOKUP_BENEATH the resolution will still
> fail if ".." resolution would resolve a path outside of the root --
> while LOOKUP_IN_ROOT will chroot(2)-style scope it). Magic-link jumps
> are still disallowed entirely because now they could result in
> inconsistent behaviour if resolution encounters a subsequent ".."[*].

This is the only patch in the series that makes me go "umm".

Why is it ok to re-initialize m_seq, which is used by other things
too? I think it's because we're out of RCU lookup, but there's no
comment about it, and it looks iffy to me. I'd rather have a separate
sequence count that doesn't have two users with different lifetime
rules.

But even apart from that, I think from a "patch continuity" standpoint
it would be better to introduce the sequence counts as just an error
condition first - iow, not have the "path_is_under()" check, but just
return -EXDEV if the sequence number doesn't match.

So you'd have three stages:

 1) ".." always returns -EXDEV

 2) ".." returns -EXDEV if there was a concurrent rename/mount

 3) ".." returns -EXDEV if there was a concurrent rename/mount and we
reset the sequence numbers and check if you escaped.

becasue the sequence number reset really does make me go "hmm", plus I
get this nagging little feeling in the back of my head that you can
cause nasty O(n^2) lookup cost behavior with deep paths, lots of "..",
and repeated path_is_under() calls.

So (1) sounds safe. (2) sounds simple. And (3) is where I think subtle
things start happening.

Also, I'm not 100% convinced that (3) is needed at all. I think the
retry could be done in user space instead, which needs to have a
fallback anyway. Yes? No?

                 Linus

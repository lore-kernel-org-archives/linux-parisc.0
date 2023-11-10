Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F75C4332F
	for <linux-parisc@archiver.kernel.org>; Fri, 10 Nov 2023 20:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjKJUO6 (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 10 Nov 2023 15:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjKJUO5 (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 10 Nov 2023 15:14:57 -0500
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BE5A9
        for <linux-parisc@vger.kernel.org>; Fri, 10 Nov 2023 12:14:53 -0800 (PST)
References: <87lebjz9z6.fsf@gentoo.org> <875y2jro9a.fsf@gentoo.org>
 <0fec2446-a523-486f-9df7-4c6af9e2e0e3@gmx.de>
User-agent: mu4e 1.10.8; emacs 30.0.50
From:   Sam James <sam@gentoo.org>
To:     Helge Deller <deller@gmx.de>
Cc:     Sam James <sam@gentoo.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        joey.gouly@arm.com
Subject: Re: prctl call wrongly succeeds on HPPA?
Date:   Fri, 10 Nov 2023 20:12:55 +0000
Organization: Gentoo
In-reply-to: <0fec2446-a523-486f-9df7-4c6af9e2e0e3@gmx.de>
Message-ID: <87zfzl8ix3.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


Helge Deller <deller@gmx.de> writes:

> On 11/3/23 13:53, Sam James wrote:
>> Sam James <sam@gentoo.org> writes:
>>> I recently hit an issue with systemd-254 which tries to use the new
>>> prctl(PR_SET_MDWE) for systemd's MemoryDenyWriteExecute functionality.
>
> Is this still a problem?

Yes. When I get time, I will play with Dave's changes to allow using
non-exeuctable stacks, but for now, it is broken until I can test these
(thanks dave for working on that, and helge for the kernel side).

>
>>> On HPPA, we still need executable stacks, so this option doesn't work
>>> and leads to a segfault on boot.
>
> For kernel we don't need it any longer.
> But there might be dependencies on glibc version and/or combination.
> So, I've currently lost overview if we still need executable stacks...
>

I don't remember which kernel version either.. I think it was last year
that you finished off all the DSO bits.

I had to configure binutils with --enable-default-execstack=no for it to
work in addition to Dave's GCC patches. But I did not test systemd yet...

(sorry, I know this is equally vague.)

>>> Should this call be succeeeding on HPPA, or should we reject it for
>>> now until we have things wired up?
>>>
>>> Reported to systemd at https://github.com/systemd/systemd/issues/29775.
>>
>> Lennart has made clear (and I don't think I disagree) that he considers
>> this squarely a kernel bug.
>
> I've read the various bug reports and looked at the kernel commits regarding, e.g.
>
> commit b507808ebce23561d4ff8c2aa1fb949fe402bc61
> Author: Joey Gouly <joey.gouly@arm.com>
> Date:   Thu Jan 19 16:03:43 2023 +0000
>
>     mm: implement memory-deny-write-execute as a prctl
>
> but what is prctl(PR_SET_MDWE, PR_MDWE*, 0, 0)... expected to return on parisc?
> EINVAL? ENOTSUP?

Maybe we can ask Joey or the ARM people what they expect the semantics
to be.

>
> Helge


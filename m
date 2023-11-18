Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39835C2BB3F
	for <linux-parisc@archiver.kernel.org>; Sat, 18 Nov 2023 05:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjKRFxd convert rfc822-to-8bit (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 18 Nov 2023 00:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjKRFxd (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 18 Nov 2023 00:53:33 -0500
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E51D72
        for <linux-parisc@vger.kernel.org>; Fri, 17 Nov 2023 21:53:29 -0800 (PST)
References: <87lebjz9z6.fsf@gentoo.org> <875y2jro9a.fsf@gentoo.org>
 <0fec2446-a523-486f-9df7-4c6af9e2e0e3@gmx.de>
 <7409ec05-7a28-45fe-9604-519de5ae934e@bell.net>
 <cf75a1e4-c269-4530-b3aa-b02a81597acb@gmx.de>
 <b0a524df-9dab-4038-981f-33fc69043c1c@bell.net>
 <87sf5d8f9h.fsf@gentoo.org>
 <9bc4615d-122b-4c12-9537-b2eddc753a32@bell.net>
 <87leb58d45.fsf@gentoo.org>
 <7b4b838d-a3c2-40b4-b21e-0e5e73187bff@bell.net>
 <0cec0dfb-7a13-41fb-8498-3844102d18a5@gmx.de>
 <466ef8a1-92b3-4718-bb53-530c1e607ade@bell.net>
User-agent: mu4e 1.10.8; emacs 30.0.50
From:   Sam James <sam@gentoo.org>
To:     John David Anglin <dave.anglin@bell.net>
Cc:     Helge Deller <deller@gmx.de>, Sam James <sam@gentoo.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Subject: Re: prctl call wrongly succeeds on HPPA?
Date:   Sat, 18 Nov 2023 05:52:17 +0000
Organization: Gentoo
In-reply-to: <466ef8a1-92b3-4718-bb53-530c1e607ade@bell.net>
Message-ID: <87msvbli96.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


John David Anglin <dave.anglin@bell.net> writes:

> On 2023-11-17 9:55 a.m., Helge Deller wrote:
>> On 11/11/23 00:02, John David Anglin wrote:
>>> On 2023-11-10 5:16 p.m., Sam James wrote:
>>>> John David Anglin <dave.anglin@bell.net> writes:
>>>>
>>>>> On 2023-11-10 4:32 p.m., Sam James wrote:
>>>>>> John David Anglin <dave.anglin@bell.net> writes:
>>>>>>
>>>>>>> On 2023-11-10 3:38 p.m., Helge Deller wrote:
>>>>>>>> On 11/10/23 21:12, John David Anglin wrote:
>>>>>>>>> On 2023-11-10 3:01 p.m., Helge Deller wrote:
>>>>>>>>>>>> On HPPA, we still need executable stacks, so this option doesn't work
>>>>>>>>>>>> and leads to a segfault on boot.
>>>>>>>>>> For kernel we don't need it any longer.
>>>>>>>>>> But there might be dependencies on glibc version and/or combination.
>>>>>>>>>> So, I've currently lost overview if we still need executable stacks...
>>>>>>>>> FWIW, I recently changed gcc-14 to enable GNU stack notes and fixed a bug in the
>>>>>>>>> 32-bit PA 2.0 trampoline template.  All execute stack tests in glibc now pass with gcc-14.
>>>>>>>> Yes, I saw your commits.
>>>>>>>> So, any code compiled with >= gcc-14 should be fine with non-writeable stacks?
>>>>>>> Not exactly.  An executable stack is still needed for nested functions.  They are still called
>>>>>>> via a stack trampoline.  The GNU stack note indicates whether an object needs an executable
>>>>>>> stack or not.  These notes are collected by linker.  The glibc loader determines whether to setup
>>>>>>> an executable stack or not.
>>>>>>>> It would be easier if it would be a glibc dependency (for distribution maintainers)...
>>>>>>> I'm not aware of any glibc dependency...
>>>>>>>
>>>>>>> I think once gcc-14 becomes the default compiler, we will have to enable GNU stack notes in
>>>>>>> previous gcc versions.  We will still have executable stacks until everything is rebuilt.
>>>>>> We will need to update that default in Binutils too, I think. That
>>>>>> configure arg is working OK for me, but I did not try systemd yet.
>>>>> Currently, there are no architecture dependencies in the ld --enable-warn-execstack and --enable-default-execstack
>>>>> configure options.  The -z execstack and -z noexecstack ld options can override the GNU notes, or lack thereof.  We
>>>>> may have to fix some assembly code.  Maybe binutils should be built with --enable-warn-execstack once we switch
>>>>> to gcc-14.  I don't think we want --enable-default-execstack after switching to gcc-14.
>>>> Are you sure? I just did some more digging now...
>>>> * It looks like targets can set elf_backend_default_execstack in
>>>> bfd/elf-*.c to override the default, see e.g. 81cd0a49c9e5f28c0fec391e449ea3272077c432 for cris.
>>>> * See acd65fa610df09a0954b8fecdadf546215263c5d where HPPA's default got changed.
>>>> * ld/configure.tgt still has some suppression for HPPA's default for
>>>> warnings.
>>>>
>>>> I think we may need to, in due course, set elf_backend_default_execstack
>>>> in bfd/elf32-hppa.c, and then drop those bits in ld/configure.tgt too?
>>> You are right about both.  We have in ld/configure.tgt:
>>> if test "${ac_default_ld_warn_execstack}" = 2; then
>>>    case "${targ}" in
>>>        # The HPPA port needs to support older kernels that
>>>        # use executable stacks for signals and syscalls.
>>>        # Many MIPS targets use executable stacks.
>>>      hppa*-*-* | \
>>>      mips*-*-*)
>>>        ac_default_ld_warn_execstack=0
>>>        ;;
>>>      *)
>>>        ;;
>>>    esac
>>> fi
>>>
>>> We also may need:
>>> #define elf_backend_default_execstack 0
>>> in elf32-hppa.c at some point.
>>>
>>> I think when GNU stack notes are present, they determine whether the stack in an executable will be executable or not.
>>> But I could be wrong 🙁
>>>
>>> I'll try building binutils with gcc-14.
>>
>> Did it worked?
> Build succeeds but there are about a dozen fails in ld testsuite which need investigation.
>
> I got waylaid:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=112415
>
> Jeff thinks the patch which I committed to gcc trunk to improve handling of REG+D addresses
> will fail: https://gcc.gnu.org/pipermail/gcc-patches/2023-November/637018.html
>
> There have been many problems with this over the years but I would prefer to see what breaks
> with current implementation.  It fixes python build and we no longer need to disable inlining of
> small functions.  A lot of water has passed under the bridge since Jeff worked on the issue.

OK, I'll go ahead with testing then and let you know if there's any
issue. I didn't want to start if it was going to be reverted shortly or
something.

Am keen on seeing if I notice any differences with Python build time and
runtime performance too...

>>
>> Btw, I added a small section about executable stacks in the TODO
>> section of the wiki:
>> https://parisc.wiki.kernel.org/index.php/TODO#executable_stack

Nice, thanks!

>
> Dave


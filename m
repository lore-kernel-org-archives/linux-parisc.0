Return-Path: <SRS0=cI4q=OH=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427E6C43441
	for <linux-parisc@archiver.kernel.org>; Wed, 28 Nov 2018 17:14:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0DAD9206B6
	for <linux-parisc@archiver.kernel.org>; Wed, 28 Nov 2018 17:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DAD9206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbeK2EQq (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 28 Nov 2018 23:16:46 -0500
Received: from mout.gmx.net ([212.227.15.18]:36495 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728807AbeK2EQq (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Nov 2018 23:16:46 -0500
Received: from localhost.localdomain ([155.56.44.143]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MBnSJ-1gHuf90dZH-00Apkr; Wed, 28 Nov 2018 18:14:16 +0100
Subject: Re: C200, 712/80: strange sysfs issues with Linux 4.18.0-1-parisc
To:     Frank Scheiner <frank.scheiner@web.de>
References: <c7ab21b1-6ee2-37c1-272e-7f39a4953403@web.de>
Cc:     HPPA porters <debian-hppa@lists.debian.org>,
        linux-parisc <linux-parisc@vger.kernel.org>
From:   Helge Deller <deller@gmx.de>
Message-ID: <49dd98ae-bd74-b3b4-add0-0427bd642859@gmx.de>
Date:   Wed, 28 Nov 2018 18:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <c7ab21b1-6ee2-37c1-272e-7f39a4953403@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mdwNaoV5byxw8mz4JnwTHrM1GMOemqRw40ERArbkPt7rLcZhh/O
 +tejb3F5VfaFSudQ5uIbg7q3RqUGFDatwqTVhLRmoXSC0ycT3Bj5Lu92NIed++kkkJg1JEb
 qNvq8HcKpPm+ZouZcXXLaeQHctA74LZEfPDZmaojyMJyUXkt0jksvu/XDH74D8s1Yp+RTeX
 FUraL+wKjiBH5LYKGN94A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6tFpCnd2Jdc=:dbaC18r91yjQQQbl4p6aWc
 8eaAIJfxXuJsHaCA8UhguO3fdHKjzz0KSulwKR4HBeUSD1QIdAsfI2moDGFv70Uv8rwtFxRgl
 L3em5aRd723VBLSi0Yl6bWMGeNUui1dzkQO86cpzdNPf8zzQ7nQ84siX9ZbNh/ao1VV/Vnocz
 EL+ovrKVBO8AJW8Bx/ftPbUvnFZGDQWgrOigv8Hy5Ap73R893l7nM6vYHoO67pSiJFUHGlaBW
 o4pulwdFsJhsiEvFkUJap5KtwF1boK1w3BWFG5/zOZ9vLxFArU3sv6BGiL1jHkgvL5I+b0YfV
 kA+6RJgGh5KIiYklg1ykpbBUoXu45DIuyuhgsPOYZEfmoansPW5KqEAVcFYT46tZyHUQzplYV
 Btb5FaRshKoAA3sAsbf62TK3rk9cnwbgTQ8h2uFOth34GyGE84Nsr5B5Z5x1CodMhfRKt3mti
 oJgUf9hBIfHpYeWvSQQ2z4y9ViSJcs8lUTEJII2i7fV46Ur24oaIMoMWx+np9WDbzS+1bo48X
 m1t+nEucaZ1U4RpqRpW//GUzUkc2v8sN1/2RJoJJKzpwqsLzmf3Dw2h9/BGTZc9YUSoKc249z
 2ll1qP/Q4GaHmmNHUPLRWgaVLdihqEeycpg28HpdE2NsRBjIoP+a7YsT82WtQoGeVQGiaxecE
 u3P30sDoKLjSaUyyDyHvMAj3ILP7TW0PMnG9QCZ09AstWKmO8TaSOiLp7hiAyQiXQNI4xgKr5
 hnx4cJ3vo7dyq2UqIrhE/vco2nne+WlcyT0AOumtqe+f6ijABfKNb6Vf1nggNQC2J9JoxRQjM
 vy9gu07Ipir3WxgrObayPb54eUy8QJ31bJRVNotS4Bvr1dqsxj6VsPZziyWQuFqDXWVJNELP+
 Da910UFsdVZjvgHeA60rYs7XcQ8MXZe25InLwLJg7bG9kxJ06DvFOu3Zl2EeyF
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On 28.11.18 16:26, Frank Scheiner wrote:
> I'm experiencing some strange issues on both a C200 and a 712/80 with
> the current 32 bit SP kernel (4.18.0-2.parisc (4.18.10-2)). This does
> not happen when using the 64 bit MP kernel of the same version on a
> rp3440 for example.
> 
> For every module loaded I get a message similar to the following example:
> [...]
> [   47.799100] sysfs: cannot create duplicate filename '/module/nfs/sections/.text'
> [   47.887396] CPU: 0 PID: 98 Comm: modprobe Not tainted 4.18.0-2-parisc #1 Debian 4.18.10-2
> [   47.984894] Backtrace:
> [   48.013164]  [<1017ce2c>] show_stack+0x3c/0x50
> [   48.066177]  [<107a7210>] dump_stack+0x28/0x38
> [   48.119192]  [<103f900c>] sysfs_warn_dup+0x88/0xac
> [   48.176329]  [<103f8b1c>] sysfs_add_file_mode_ns+0x164/0x1d0
> [   48.243832]  [<103f9e70>] internal_create_group+0x11c/0x304
> [   48.310277]  [<103fa0a0>] sysfs_create_group+0x48/0x60
> [   48.371571]  [<1022abe8>] load_module.constprop.35+0x1f9c/0x23b8
> [   48.443200]  [<1022b278>] sys_finit_module+0xd0/0x11c
> [   48.503468]  [<101831dc>] syscall_exit+0x0/0x14

I think it happens because I disabled building the kernel with the "-ffunction-sections" compiler option.
The relevant patch was included in kernel 4.18:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24b6c22504a27210a8377e54d24d425ae414f2c1

On kernel 4.17 I see:

./4.17.0-3-parisc-smp/kernel/drivers/net/ethernet/intel/e1000/e1000.ko:     file format elf32-hppa-linux
Sections:
Idx Name          Size      VMA       LMA       File off  Algn
   0 .note.gnu.build-id 00000024  00000000  00000000  00000034  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   1 .text         00000000  00000000  00000000  00000058  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
   2 .text.e1000_alloc_dummy_rx_buffers 0000002c  00000000  00000000  00000058  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   3 .text.e1000_fix_features 00000074  00000000  00000000  00000084  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   4 .text.unlikely.e1000_regdump 0000049c  00000000  00000000  000000f8  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   5 .text.e1000_setup_rctl 00000144  00000000  00000000  00000594  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   6 .text.e1000_configure_rx 000002a0  00000000  00000000  000006d8  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE


On kernel 4.18 I get:
./4.18.0-3-parisc-smp/kernel/drivers/net/ethernet/intel/e1000/e1000.ko:     file format elf32-hppa-linux

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
   0 .note.gnu.build-id 00000024  00000000  00000000  00000034  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   1 .text         0000a550  00000000  00000000  00000058  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   2 .text.unlikely 0000078c  00000000  00000000  0000a5a8  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   3 .init.text    000000cc  00000000  00000000  0000ad34  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   4 .exit.text    00000030  00000000  00000000  0000ae00  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   5 .text         00007848  00000000  00000000  0000ae30  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   6 .text         00004298  00000000  00000000  00012678  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   7 .text         00000c8c  00000000  00000000  00016910  2**2
                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
   8 .text         00000000  00000000  00000000  0001759c  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, CODE

As can be seen, we now get multiple sections all named ".text" which is what triggers the kernel warning.

It seems we need to revert the patch, or find a way that the compiler doesn't produce multiple .text sections...?

Helge

Return-Path: <SRS0=E/7b=NZ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC327C43441
	for <linux-parisc@archiver.kernel.org>; Wed, 14 Nov 2018 06:35:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D95822360
	for <linux-parisc@archiver.kernel.org>; Wed, 14 Nov 2018 06:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgH7DnZ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D95822360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbeKNQhR (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 14 Nov 2018 11:37:17 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41789 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbeKNQhR (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 14 Nov 2018 11:37:17 -0500
Received: by mail-pg1-f193.google.com with SMTP id 70so6896361pgh.8
        for <linux-parisc@vger.kernel.org>; Tue, 13 Nov 2018 22:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=kMnO6BDIsJ30LH5c9BjM4P+/oJIF7vjQsNdnpI3Mr50=;
        b=TgH7DnZ95OGJBBG6jI8YaodhraQ7LsfrBfI1+BrxD+b27jFPURb+7jJX8YA71GVMJs
         img0aCfDD/O0XLVW2vDMbXNY7/Kd5Q/19YIteIU0n4jRZtb+q88urFnOuPeqMBOYs1V+
         FhDVEaaVNTTH8XFtlf/0ApvYEq6Wjtdu0QH0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kMnO6BDIsJ30LH5c9BjM4P+/oJIF7vjQsNdnpI3Mr50=;
        b=I1rg0aBrQhHH0Z3ZSAgU0G2xdlYFxs1KWuWWTgis4jApxaAx7C+tZhm8IYS0nn0lR/
         F9ghHIP2nhHUUGi1PdTlCjGcyV/QzbOrbmeAshBbqF8t1vcVu5qX80Xy9lWVyr4FR0dq
         U5im45+0uig1IHjo+VgsLTpWUwMy2i0SZtjsEXNiOH5BwqELecx4eWO6k3jyF0eFcl5c
         2qs9IAMSjfHB+EGNZkg78YtEaMIOJcdoTHzxYs6COil7auNxebX3BTa0jx1r4MAJ73T7
         vO2aI6MbmlUhiDbaURTcA4nMObrmeTQ+hraCmefT2kUeyqCuYN51REZ1h5CNplrwgklS
         ZoYw==
X-Gm-Message-State: AGRZ1gJUlIEgXzQHfTuwDKZ0iTk/664/TpzIlA+MCQo9ayS1EytnNCJ9
        qv3Hmd/Uhz4NUC81btWIz6C1xDSH38I=
X-Google-Smtp-Source: AJdET5eTZ36mHZ++hqrdKXLoyuglANBvDeMD0ST3QAIlPBNaVc76O+3ndIn8XXj4hX2SsQ3uDcmC7A==
X-Received: by 2002:a63:2ad4:: with SMTP id q203-v6mr618192pgq.356.1542177325572;
        Tue, 13 Nov 2018 22:35:25 -0800 (PST)
Received: from qualcomm-HP-ZBook-14-G2.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id l26-v6sm39097318pfg.161.2018.11.13.22.35.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 22:35:24 -0800 (PST)
From:   Firoz Khan <firoz.khan@linaro.org>
To:     linux-parisc@vger.kernel.org,
        "James E . J . Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>
Cc:     y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, arnd@arndb.de, deepa.kernel@gmail.com,
        marcin.juszkiewicz@linaro.org, firoz.khan@linaro.org
Subject: [PATCH v7 0/5] parisc: system call table generation support
Date:   Wed, 14 Nov 2018 12:04:56 +0530
Message-Id: <1542177301-25844-1-git-send-email-firoz.khan@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The purpose of this patch series is, we can easily
add/modify/delete system call table support by cha-
nging entry in syscall.tbl file instead of manually
changing many files. The other goal is to unify the
system call table generation support implementation
across all the architectures.

The system call tables are in different format in
all architecture. It will be difficult to manually
add, modify or delete the system calls in the resp-
ective files manually. To make it easy by keeping a
script and which'll generate uapi header file and
syscall table file.

syscall.tbl contains the list of available system
calls along with system call number and correspond-
ing entry point. Add a new system call in this arch-
itecture will be possible by adding new entry in the
syscall.tbl file.

Adding a new table entry consisting of:
        - System call number.
        - ABI.
        - System call name.
        - Entry point name.

ARM, s390 and x86 architecuture does exist the sim-
ilar support. I leverage their implementation to
come up with a generic solution.

I have done the same support for work for alpha, ia64,
m68k, microblaze, mips, powerpc, sh, sparc and xtensa.
Below mentioned git repository contains more details
about the workflow.

https://github.com/frzkhn/system_call_table_generator/

Finally, this is the ground work to solve the Y2038
issue. We need to add two dozen of system calls to
solve Y2038 issue. So this patch series will help to
add new system calls easily by adding new entry in
the syscall.tbl.

changes since v6:
 - changed from generic-y to generated-y in Kbuild.

changes since v5:
 - optimized/updated the syscall table generation
   scripts.
 - fixed all mixed indentation issues in syscall.tbl.
 - added "comments" in syscall_*.tbl.

changes since v4:
 - optimized/updated the syscall table generation
   scripts.
 - removed __IGNORE entries which was added in v2
   to suppress the warning.

changes since v3:
 - optimized/updated the syscall table generation
   scripts.
 - added missing new line.

changes since v2:
 - updated the syscall.tbl file by including missed
   entries.

changes since v1:
 - enclosed __NR_sycalls macro with __KERNEL__.

Firoz Khan (5):
  parisc: move __IGNORE* entries to non uapi header
  parisc: add __NR_syscalls along with __NR_Linux_syscalls
  parisc: add system call table generation support
  parisc: generate uapi header and system call table files
  parisc: syscalls: ignore nfsservctl for other architectures

 arch/parisc/Makefile                      |   3 +
 arch/parisc/include/asm/Kbuild            |   3 +
 arch/parisc/include/asm/unistd.h          |   8 +
 arch/parisc/include/uapi/asm/Kbuild       |   2 +
 arch/parisc/include/uapi/asm/unistd.h     | 382 +------------------------
 arch/parisc/kernel/syscall.S              |  11 +-
 arch/parisc/kernel/syscall_table.S        | 459 ------------------------------
 arch/parisc/kernel/syscalls/Makefile      |  57 ++++
 arch/parisc/kernel/syscalls/syscall.tbl   | 369 ++++++++++++++++++++++++
 arch/parisc/kernel/syscalls/syscallhdr.sh |  36 +++
 arch/parisc/kernel/syscalls/syscalltbl.sh |  36 +++
 scripts/checksyscalls.sh                  |   1 +
 12 files changed, 531 insertions(+), 836 deletions(-)
 delete mode 100644 arch/parisc/kernel/syscall_table.S
 create mode 100644 arch/parisc/kernel/syscalls/Makefile
 create mode 100644 arch/parisc/kernel/syscalls/syscall.tbl
 create mode 100644 arch/parisc/kernel/syscalls/syscallhdr.sh
 create mode 100644 arch/parisc/kernel/syscalls/syscalltbl.sh

-- 
1.9.1


Return-Path: <SRS0=iNii=OA=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFADFC04EBA
	for <linux-parisc@archiver.kernel.org>; Wed, 21 Nov 2018 04:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 957022146D
	for <linux-parisc@archiver.kernel.org>; Wed, 21 Nov 2018 04:14:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="jxzM8Sk+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 957022146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbeKUOrj (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 21 Nov 2018 09:47:39 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42281 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbeKUOri (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Nov 2018 09:47:38 -0500
Received: by mail-pl1-f196.google.com with SMTP id x21-v6so3489418pln.9
        for <linux-parisc@vger.kernel.org>; Tue, 20 Nov 2018 20:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=tcWMYlNQtSLN7aZEXs1ixCkzdZuDoypH0iDD9Tjodp0=;
        b=jxzM8Sk+CWAKgVVDzdr1nmmytbX1BKGYjuTucyyobwfXqcyJsben6UbIWIHT6qdxWS
         ZSvk5Vj7MuAwnW6HXCgrWhAn6MrcUex0wuhZJnWb/UtovfP7k5NhX6a9ylFrVdyaWZzH
         kD6ZQtN8RjgmBgEbKegG77zY4bn4rbOT8bJr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tcWMYlNQtSLN7aZEXs1ixCkzdZuDoypH0iDD9Tjodp0=;
        b=Sm/dQn4Cr6gziliuhsKtYocCVb77eJ9PzVzjYB3Thv6Ln8O2ReffhW+cSWZgx9Z0Ei
         xNr1mu+MK4IVAcKRgkDI6GMVhvBE+NOW8rYVeg42q1nUdmD6Q5auwv2IkHhxAae97/la
         lwtl2s/Tu7ul6QptnqF8krRj0xliNe4RQJ64KfAXW2a5+kqSsU9TbrevOPUxBcH1uDB4
         2m/PogZxF84FBBJLdIl8Eeswc7Et/VTsUhOOr2AGM+ruxF3cqCzIydZhSi3wa6fLncxV
         wzMtP/zpJLh9i3KiJ8OysPE2teYvGM0AYUZ6feXZb11LDiSXdvsgcIfNUGosYnRKc7a/
         B7pA==
X-Gm-Message-State: AGRZ1gI3yAx8GQ1FXQ2w1unZALN6kYWLh/BBPeW2T+7d0L/OBGv8mnMr
        HiH3wf6fQVBM9Qs+T/GrwJIsSOcgGm4=
X-Google-Smtp-Source: AJdET5dbfgBiADEQm5oxDPCXDDhosn/IIdz/zfV5Lrhmx60TF9RZ4vFHeaHhWpOVNjENLz7V6/LG3Q==
X-Received: by 2002:a62:5ac3:: with SMTP id o186-v6mr5325983pfb.40.1542773696630;
        Tue, 20 Nov 2018 20:14:56 -0800 (PST)
Received: from qualcomm-HP-ZBook-14-G2.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id v124-v6sm10818712pfb.182.2018.11.20.20.14.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 20:14:56 -0800 (PST)
From:   Firoz Khan <firoz.khan@linaro.org>
To:     linux-parisc@vger.kernel.org,
        "James E . J . Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>
Cc:     y2038@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, arnd@arndb.de, deepa.kernel@gmail.com,
        marcin.juszkiewicz@linaro.org, firoz.khan@linaro.org
Subject: [PATCH v8 0/6] parisc: system call table generation support
Date:   Wed, 21 Nov 2018 09:44:24 +0530
Message-Id: <1542773670-25460-1-git-send-email-firoz.khan@linaro.org>
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

changes since v7:
 - removed __NR_Linux from uapi header file.

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

Firoz Khan (6):
  parisc: move __IGNORE* entries to non uapi header
  parisc: add __NR_syscalls along with __NR_Linux_syscalls
  parisc: remove __NR_Linux from uapi header file.
  parisc: add system call table generation support
  parisc: generate uapi header and system call table files
  parisc: syscalls: ignore nfsservctl for other architectures

 arch/parisc/Makefile                      |   3 +
 arch/parisc/include/asm/Kbuild            |   3 +
 arch/parisc/include/asm/unistd.h          |   8 +
 arch/parisc/include/uapi/asm/Kbuild       |   2 +
 arch/parisc/include/uapi/asm/unistd.h     | 379 +-----------------------
 arch/parisc/kernel/syscall.S              |  11 +-
 arch/parisc/kernel/syscall_table.S        | 459 ------------------------------
 arch/parisc/kernel/syscalls/Makefile      |  55 ++++
 arch/parisc/kernel/syscalls/syscall.tbl   | 369 ++++++++++++++++++++++++
 arch/parisc/kernel/syscalls/syscallhdr.sh |  36 +++
 arch/parisc/kernel/syscalls/syscalltbl.sh |  36 +++
 scripts/checksyscalls.sh                  |   1 +
 12 files changed, 527 insertions(+), 835 deletions(-)
 delete mode 100644 arch/parisc/kernel/syscall_table.S
 create mode 100644 arch/parisc/kernel/syscalls/Makefile
 create mode 100644 arch/parisc/kernel/syscalls/syscall.tbl
 create mode 100644 arch/parisc/kernel/syscalls/syscallhdr.sh
 create mode 100644 arch/parisc/kernel/syscalls/syscalltbl.sh

-- 
1.9.1


Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 152DB4A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 12:44:37 -0700 (MST)
Date: Thu, 1 Feb 2001 11:46:47 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200102011946.LAA01082@milano.cup.hp.com>
To: parisc-linux@lists.parisc-linux.org
Cc: amodra@linuxcare.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] $$mulI missing
List-ID: <linux-parisc.vger.kernel.org>

I enabled "CONFIG_MODULES" to build a 64-bit kernel
and got the following link error:
arch/parisc64/kernel/kernel.o(__ksymtab+0x300): undefined reference to `$$mulI'

I'll try to work around it by using HPUX's 64-bit libmilli.a.

grant

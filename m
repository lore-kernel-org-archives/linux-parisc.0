Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA12252
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Oct 1999 17:48:03 -0600
Received: from milano.cup.hp.com (grundler@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id TAA13422
	for <parisc-linux@thepuffingroup.com>; Fri, 1 Oct 1999 19:47:46 -0400 (EDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id QAA13637 for parisc-linux@thepuffingroup.com; Fri, 1 Oct 1999 16:47:30 -0700 (PDT)
Date: Fri, 1 Oct 1999 16:47:30 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199910012347.QAA13637@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] linux/Makefile
List-ID: <linux-parisc.vger.kernel.org>


FYI - Alex noticed his tree was recursively building vmlinux because
init_task_union tests weren't working right. Turned out he was picking
up the HP-UX "nm" instead of GNU nm.

Lesson: check $PATH - order matters.

grant

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA15202
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 Jan 2001 09:07:18 -0700
From: 5116@telia.com
Received: from zaphod.halden.lillfab.se (t5o70p28.telia.com [195.67.239.28])
	by mailf.telia.com (8.9.3/8.9.3) with ESMTP id RAA05097
	for <parisc-linux@thepuffingroup.com>; Sat, 27 Jan 2001 17:11:09 +0100 (CET)
Received: (from danne@localhost)
	by zaphod.halden.lillfab.se (8.9.3/8.9.3) id RAA30546
	for parisc-linux@thepuffingroup.com; Sat, 27 Jan 2001 17:10:51 +0100
Message-Id: <200101271610.RAA30546@zaphod.halden.lillfab.se>
Date: Sat, 27 Jan 2001 17:10:51 +0100 (CET)
Reply-To: 5116@telia.com
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
Subject: [parisc-linux] Kernel module loader gived break
List-ID: <linux-parisc.vger.kernel.org>

Hi, all

I get messages like 

break 0,0: pid=116 command='cat'
cat[116]: Breakpoint 0

Followed by a register dump when I do some thing that would trigger the
kernel to call modprobe. Modprobe is not in stalled in my system (is it
ported yet?).

/Daniel
-- 

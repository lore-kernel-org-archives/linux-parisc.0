Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA10696
	for <parisc-linux@puffin.external.hp.com>; Thu, 5 Oct 2000 06:19:27 -0600
Date: 5 Oct 2000 12:20:26 -0000
Message-ID: <20001005122026.30118.qmail@mailserv2.iuinc.com>
Received: from y18626 ([10.108.21.26]) by smtp.huawei.com
          (Netscape Messaging Server 4.15) with SMTP id G1YHTD02.M0R for
          <parisc-linux@thepuffingroup.com>; Thu, 5 Oct 2000 20:10:26 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: parisc-linux@thepuffingroup.com
From: yuqian <yuqian@huawei.com>
Subject: Re: [parisc-linux] pre-build HP-UX/10.20 bash's problem
List-ID: <linux-parisc.vger.kernel.org>

The problem resolved after rebuild hpux kernel with large_ncargs_enabled=1.
Thanks all.

Return-Path: <knaresh@india.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87B374843
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 22:27:16 -0700 (MST)
Message-ID: <4017481D.D43C51C@india.hp.com>
Date: Wed, 28 Jan 2004 10:56:53 +0530
From: Naresh Kumar <knaresh@india.hp.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] error?
References: <40163368.74DACC64@india.hp.com>
	<20040127172256.GB28476@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Grant,
I was referring to linux-2.6. There are two 'break' statements in 'case
PAT_GMMIO:'. Removing the first 'break' will do.
Regards,
Naresh.


> Those are "extra"?
> The version of code in linux-2.4 CVS has:
>                 case PAT_GMMIO:
>                         printk(KERN_WARNING MODULE_NAME
>                                 " range[%d] : ignoring GMMIO (0x%lx)\n",
>                                 i, p->start);
>                         lba_dev->gmmio_base = p->start;
>                         break;
>
> The code you quoted is missing the "case PAT_GMMIO" and printk.
>
> thanks,
> grant

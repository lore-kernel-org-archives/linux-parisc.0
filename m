Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA21636
	for <parisc-linux@puffin.external.hp.com>; Wed, 4 Oct 2000 07:17:37 -0600
Sender: vidal@hpfrcu03.france.hp.com
Message-ID: <39DB2D40.4CC05783@admin.france.hp.com>
Date: Wed, 04 Oct 2000 15:14:40 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: yuqian <yuqian@huawei.com>
Cc: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] pre-build HP-UX/10.20 bash's problem
References: <20001004125746.18672.qmail@mailserv2.iuinc.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

	Hi
I've retrieve the kernel parameter:
large_ncargs_enabled
Put this one to 1 and it would be fine.

	Bye.
yuqian wrote:
> 
> Hi.
> I have a HP B2000 (9000/785) with HP-UX 10.20 and installed
> binaries/HP-UX/depot/10.20/bash-2.03-1.hpux-10.20.depot.gz,
> but it not work when I want to build a new kernel:
>    bash-2.03$ make dep
>    scripts/mkdep init/*.c > .depend
>    scripts/mkdep `find /home/yq/linux/include/asm
> /home/yq/linux/include/linux /home/yq/linux/include/scsi
> /home/yq/linux/include/net -name   SCCS -prune -o -follow -name \*.h ! -name
> modversions.h -print` > .hdepend
>    bash: scripts/mkdep: Arg list too long
>    make: *** [dep-files] Error 126
> 
> Am I missing any thing?
> Thanks for any advices.
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com

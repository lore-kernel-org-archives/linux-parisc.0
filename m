Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA23413
	for <parisc-linux@puffin.external.hp.com>; Wed, 4 Oct 2000 09:05:00 -0600
Message-Id: <200010041505.LAA06932@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pre-build HP-UX/10.20 bash's problem
To: yuqian@huawei.com (yuqian)
Date: Wed, 4 Oct 2000 11:05:50 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <20001004125746.18672.qmail@mailserv2.iuinc.com> from "yuqian" at Oct 4, 2000 12:57:46 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

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

I think this can be fixed by changing the Makefile to use relative paths
instead of absolute paths.  This shortens the arg list enough for 
building under hpux.

Changing the kernel to support a larger arg and environment space looks
like it will waste a lot of memory for most applications and thus may
not be suited for machines with limited memory or swap space.  So, I would
try hacking the Makefile first.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

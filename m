Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA18335
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jun 2000 06:14:55 -0600
Message-ID: <20000607121501.19560.qmail@web514.mail.yahoo.com>
Date: Wed, 7 Jun 2000 05:15:01 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
Subject: Re: [parisc-linux] 715/33 booting from SCSI disk nearly ok
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

--- Ulrich Strelow <ulrich_strelow@yahoo.com> wrote:
> Hi all,
> 
> first the good news: following Paul's excellent palo
> documentation I succeeded to boot my 715/33 from its
> internal HP C3324A SCSI disk. I booted the kernel
> from
> the special F0 partition and used the ext2 fs on
> partition 2 as the root filesystem.
> 
> But booting the kernel /vmlinux directly from the
> ext2
> filesystem fails.
 
With the recent changes to palo, this problem has been
solved. Booting a pre1-kernel from the internal SCSI
disk's ext2 filesystem now works fine on my 715/33.

Ulrich

__________________________________________________
Do You Yahoo!?
Yahoo! Photos -- now, 100 FREE prints!
http://photos.yahoo.com

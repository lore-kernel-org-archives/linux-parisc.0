Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA29867
	for <parisc-linux@puffin.external.hp.com>; Sat, 22 Jul 2000 07:00:31 -0600
Received: from ottawa.linuxcare.com (HELO vodka.thepuffingroup.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 22 Jul 2000 13:02:19 -0000
Date: Sat, 22 Jul 2000 07:56:53 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: borislav dzodzo <dzodzo@students.uiuc.edu>
Cc: willy@thepuffingroup.com, parisc-linux@thepuffingroup.com
Subject: Re: your mail
Message-ID: <20000722075653.C22210@vodka.thepuffingroup.com>
References: <Pine.GSO.4.10.10007211305380.4421-100000@ux5.cso.uiuc.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.GSO.4.10.10007211305380.4421-100000@ux5.cso.uiuc.edu>; from borislav dzodzo on Fri, Jul 21, 2000 at 01:06:33PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 21, 2000 at 01:06:33PM -0500, borislav dzodzo wrote:
> hi i found some of your posts on 
> http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/
> and i thought you might know if 
> there already exists a linux version of fsck for 
> under pa-risc for HFS (not apple but HewlettPackard).

HP's HFS is a BSD Fast Filesystem (FFS) derivative.  There are a few
minor differences, but they are very closely related.  By studying the
HP-specific magic numbers added to recent 2.3/4 series kernels, you should
have no problem making a fsck.ufs or fsck.ffs work on Linux.  If anyone
can find one, let me know, and a mkfs would also be useful to have.

> if not... could you please tell me where are some good specs on
> HFS so that i could write my own.

-- 
Revolutions do not require corporate support.

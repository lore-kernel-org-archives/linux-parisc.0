Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id E682B4829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  1 Jun 2003 08:05:36 -0600 (MDT)
Date: Sun, 1 Jun 2003 14:05:20 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
In-Reply-To: <200306011543.59335.deller@gmx.de>
Message-ID: <Pine.BSF.4.53.0306011402580.1237@e0-0.zab2.int.zabbadoz.net>
References: <Pine.BSF.4.53.0306011303040.1237@e0-0.zab2.int.zabbadoz.net>
 <200306011543.59335.deller@gmx.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, 1 Jun 2003, Helge Deller wrote:

> > is there a chance that one can recover from s.t.h like this ?
> >
> > Command line for kernel: 'root=/dev/sdb3 HOME=/ TERM=linux console=ttyS0
> > palo_kernel=3/boot/vmlinux-2.5.60-pa1' Selected kernel:
> > /boot/vmlinux-2.5.60-pa1 from partition 3
> > ERROR: open /boot/vmlinux-2.5.60-pa1 from partition 3 failed
>
> You could boot a good kernel via tftp. That's how I test different kernels...

not a too bad idea but that's not the problem here.

When palo cannot open the kernel and errors out shouldn't it fall back
to the dialog and ask one to which fields to change instead of simply
running into a dead end where I think I can only recover from with
physical access to the machine ?

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id DDB7B4834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jun 2003 13:56:40 -0600 (MDT)
Date: Wed, 11 Jun 2003 19:52:53 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
In-Reply-To: <3ED4C8B600004A2B@ocpmta1.freegates.net>
Message-ID: <Pine.BSF.4.53.0306111939570.50958@e0-0.zab2.int.zabbadoz.net>
References: <3ED4C8B600004A2B@ocpmta1.freegates.net>
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

On Wed, 11 Jun 2003, Joel Soete wrote:

Hi,

...
> the system hang here (just read on LCD "init c7ff")
....

> I so come back to palo-1.2 where the pb don't occure:
> Command line for kernel: 'root=/dev/scsi/host1/bus0/target5/lun0/part5 HOME=/
> console=ttyS0 TERM=vt102 palo_kernel=3/vmlinux-2.4.21-rc8-pa35-devfs'
>
> Selected kernel: /vmlinux-2.4.21-rc8-pa35-devfs from partition 3
> ELF32 executable
> Entry 00100210 first 00100000 n 6
> Segment 0 load 00100000 size 2101928 mediaptr 0x1000
> [...]

well if I got it right you changed disks ? And after re-running palo 1.2
from command line everything workd fine ? I don't know these internals
of palo - where it get's the kernel etc. from but it might be a problem
if boot disc completely changes ... you might simply try re-running
pal0-1.2patched from command line again and see what happens ?

And yes Matthew is 101% right that devfs at least on linux is a big
mess. It took me almost a week to fix some 2.5.xx and get it boot from
grub on an intel somewhen end of last year. Some weeks later I
installed FreeBSD 5.0R on that machine and I am happy with it ;-) so I
do no longer have the notes a hand (apart from backups) I took those
days about devfs.

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/

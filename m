Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22F584842
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jun 2003 03:16:19 -0600 (MDT)
Date: Thu, 12 Jun 2003 11:16:15 +0200
Message-ID: <3ED71F6D000046F7@ocpmta7.freegates.net>
In-Reply-To: <Pine.BSF.4.53.0306111939570.50958@e0-0.zab2.int.zabbadoz.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] palo II
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

...
> the system hang here (just read on LCD "init c7ff")
....

> I so come back to palo-1.2 where the pb don't occure:
> Command line for kernel: 'root=/dev/scsi/host1/bus0/target5/lun0/part5
HOME=
>
> console=ttyS0 TERM=vt102 palo_kernel=3/vmlinux-2.4.21-rc8-pa35-devfs'
>
> Selected kernel: /vmlinux-2.4.21-rc8-pa35-devfs from partition 3
> ELF32 executable
> Entry 00100210 first 00100000 n 6
> Segment 0 load 00100000 size 2101928 mediaptr 0
>1000
> [...]

> well if I got it right you changed disks ?
No I just add a disk on to an additional scsi ctrlr plug into my hp box

[...]
> ... you might simply try re-running
> pal0-1.2patched from command line again and see what happens ?

I could so try also (even if the boot disk do not actually changed)

> And yes Matthew is 101% right that devfs at least on linux is a big
> mess. It took me almost a week to fix some 2.5.xx and get it boot
> from grub on an intel somewhen end of last year. Some weeks later I
> installed FreeBSD 5.0R on that machine and I am happy with it ;-) so I
> do no longer have the notes a hand (apart from backups) I took those
> days about devfs.
Doesn't matter, considering all advises, I will abandon this idea and try
to find another one. Never the less, the problem I encounter stand in ipl
(at this boot stage)
btw, is your pb is solved? eg is this patch could be comit?

Thanks,
    Joel

[btw: is your FreeBsd stand alone on its own disk or beside linux partition?]

---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6263D4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 01:37:36 -0700 (MST)
Date: Wed, 15 Jan 2003 09:36:53 +0100
Message-ID: <3E1AA7C1000015EB@ocpmta7.freegates.net>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] PA-RISC Linux RAID1 Root HOWTO
To: "Martin K. Petersen" <mkp@mkp.net>,
	parisc-linux@lists.parisc-linux.org
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

Martin,

Congratulation, great job.

I already build a raid1 on my b180 but /boot partition and it works fine.=

So I now just have to update palo build the raid1 on this boot slice.

Well just a stupid question:
since now my md devices were:
/dev/md0(sda5+sdb5) /
/dev/md1(sda2+sdb2)  swap
/dev/md2(sda6+sdb6) /home
...
and I would like it becomes:
/dev/md0(sda3+sdb3) /boot
/dev/md1(sda5+sdb5) /
/dev/md2(sda2+sdb2) swap
...

so, finaly, how to remumber md0 into md1 ...?

I would also ask you if you could advise me on the resizing of a md.
My md7 is a raid1 with the last slices sda11 and sdb11 of disks (mounted
on /var). As there are still some free space at the end of each disk, I
would like to increase it. Could you advise me howto do (I try to find do=
c
but no success and my test was not more succesfull and I do not want to
loose the contents of the fs)?

Thanks in advance for your attention.

>-- Original Message --
>To: parisc-linux@lists.parisc-linux.org
>From: "Martin K. Petersen" <mkp@mkp.net>
>Subject: [parisc-linux] PA-RISC Linux RAID1 Root HOWTO
>Date: 14 Jan 2003 14:27:11 -0500
>
>
>
>PA-RISC Linux RAID1 Root HOWTO
>

Very clear :)

Thanks,
    Joel



*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68E87482B
	for <parisc-linux@parisc-linux.org>; Mon, 13 Jan 2003 09:17:13 -0700 (MST)
Date: Mon, 13 Jan 2003 17:16:34 +0100
Message-ID: <3E1AA7C1000010A1@ocpmta7.freegates.net>
In-Reply-To: <001a01c2bab8$29127720$3e73a218@ko>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] Cannot boot after installing kernel!
To: "Marc Eisenbarth" <marc@centraltx.com>,
	"'Matthew Wilcox'" <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
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

>-- Original Message --
>From: "Marc Eisenbarth" <marc@centraltx.com>
>To: "'Matthew Wilcox'" <willy@debian.org>
>Cc: <parisc-linux@parisc-linux.org>
>Subject: RE: [parisc-linux] Cannot boot after installing kernel!
>Date: Sun, 12 Jan 2003 21:59:23 -0600
>
>
>Well, you were right about it taking a while to boot, but it still
>bombed on me... see below. Is there a way I can boot my previous kernel
>up again? 
>
You can always from your install support (cd or netinstall lifimage) whic=
h,
in the install menu (near the end), let you access to a shell.
You can create now a temp dir as /mnt/MYBOOT and mount your sd boot disk.=

If your old kernel still stand in /mnt/MYBOOT[/boot], note its name and
put it in the boot parameter (interupt the boot and answer y to interact
with ipl then 0 in palo bootprompt). After the boot completion you would
certainly have to reinstall old kernel package.

If your old kernel is not any more their, try to make the pkg available
on any ftp server, setup your network interface thanks to the above menti=
oned
"install menu" to access your ftp server. Mount also your boot disk in th=
e
/mnt/MYBOOT copy the kernel pkg into /mnt/MYBOOT/var/tmp (ie somewhere on=

your sd). Now 'chroot /mnt/MYBOOT' and dpkg -i /var/tmp/kernel-....deb.
Do not forget to exit chroot and umount /mnt/MYBOOT to be sure that fs we=
re
sync before reboot.

HTH,
    Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be

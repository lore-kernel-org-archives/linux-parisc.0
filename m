Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B1104832
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jun 2003 07:01:07 -0600 (MDT)
Date: Thu, 12 Jun 2003 15:01:05 +0200
Message-ID: <3ED71F6D00004914@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] palo II (gcc pb)
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

Hi all,

Sorry to answer to myself but I do some more test:
(please forget that is devfs test, I trust that at this boot stage any text
would have the same effect)

> I so come back to palo-1.2 where the pb don't occure:
> Command line for kernel: 'root=/dev/scsi/host1/bus0/target5/lun0/part5
> HOME=/ console=ttyS0 TERM=vt102 palo_kernel=3/vmlinux-2.4.21-rc8-pa35-devfs'
>

I do first replace the kernel name in my palo.conf to vmlinux-2.4.21-rc8-pa35-devfs
and let root=/dev/sda5

so that at reboot I just have to change root=...

then I reduce root=.. since  root=/dev/scsi/host1/bu when it works again

Finaly I chg palo.conf with full root=/dev/scsi/host1/bus0/target5/lun0/part5
run palo and reboot. iplboot also failed at the same place


Now reinstall palo-1.2 and no pb with this last palo.conf

hmm the palo-1.2 is the official debian pkg (size 30728)
the palo-patched is of my own build with gcc-3.3 (size 34816)

Now rebuild palo-patched with gcc-3.0 (size 30720) and it works :-(

What can I do more to help to fix this gcc pb?

Joel

PS: in the mean time I trust (iin accordance with Bjoern) that this patch
can be comited, what do you think?





---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr

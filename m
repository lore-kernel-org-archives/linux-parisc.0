Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA00584
	for <parisc-linux@puffin.external.hp.com>; Mon, 16 Oct 2000 13:18:44 -0600
Message-Id: <200010161924.MAA11998@milano.cup.hp.com>
To: "Thomas Marteau" <marteaut@esiee.fr>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Troubles with read only file system 
In-reply-to: Your message of "Thu, 16 Nov 2000 21:16:22 PST."
             <003d01c0500a$167a9040$a832d793@esiee.fr>
Date: Mon, 16 Oct 2000 12:24:21 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Thomas Marteau" wrote:
> Hi all,
> 
> We have done everything well but the NFSroot and the bootable disk say that
> we have a read only file system ???

Yeah...RO the default behavior.
I have the following entry on my NFS root etc/fstab:

15.8.81.247:/tftpboot/hppa / nfs defaults                       0       0

You can also manually:
	mount -o remount,rw /

This should work for both NFS root and SCSI root disks.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maile.telia.com (maile.telia.com [194.22.190.16])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D62E482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 15:32:29 -0600 (MDT)
Date: Sat, 13 Oct 2001 23:32:16 +0200
From: Daniel Engstrom <5116@telia.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New scsi driver for 53c700 and 53c710 committed
Message-ID: <20011013233216.A24926@zaphod.halden.lillfab.se>
References: <20011008230949.U11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <20011008230949.U11105@linuxcare.com>; from rhirst@linuxcare.com on Tue, Oct 09, 2001 at 00:09:49 +0200
List-ID: <linux-parisc.vger.kernel.org>

Hi, Richard.

On 2001.10.09 00:09 Richard Hirst wrote:
>   I've just added a new scsi driver for 53c700 and 53c710 chips to cvs.

I have some problems with this driver on my 715-50/old installed from the 
0.92 cd.

If I boot multi-user the boot process will stop/hang somewhere between the
"ENtering run level 2" message and "Starting cron"-message. The cont-message
is pretty late in the boot process, infact it is the last message to be printed
before the getty's are supposed to be lanuched.

On the next reboot fsck will consider the filesystem broken enought to put me
in single user mode.

If I boot single-user I can get to the prompt and do some reading and writing 
to the disk,  but if I do some heavy disk I/O (like running bonnie or e2fsck 
on a dirty file system), the system will lock-up.

The lockup I experience is not complete, the box still replies to pings and
anything I type at the (serial) console gets echoed, but I get nowhere with
ctrl-C or wha-tever. 

The old driver still works even with the never kernels.

/Daniel

-- 

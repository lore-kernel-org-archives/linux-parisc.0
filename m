Return-Path: <chihi@email.rnu.tn>
Sender: chihi@email.rnu.tn
Message-Id: <36E6B5D8.60F44E1A@ensi.rnu.tn>
Date: Wed, 10 Mar 1999 18:11:36 +0000
From: Imed Chihi <Imed.Chihi@ensi.rnu.tn>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Bootstrap take 3
References: <199903092345.RAA25911@equator.com>
Content-Type: text/plain; charset=us-ascii
Resent-Message-ID: <"77Jo.0.PZ1.VSgvs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

Hi all,

Here is my experience with the last bootloader. I tried it on an HP 710:

Select from menu: b scsi.5
Trying scsi.5
Boot path initialized
Attempting to load IPL

Hard booted
-----------------------------------------
PARISC/Linux Bootstrap Version 0.1 (non-interactive)
By Jason Eckhardt
Built Tue Mar 9 16:40:43 CST 1999 by jason@bimbo

Reading parameters.. done
Size = 28672 bytes, entry = 0x00001000, location 0x0001B040
Loading kernel.. done.
Transferring control to kernel.

********************
VMLINUX 0.0: Dummy kernel image loaded and executing!

It is now safe to reboot.

It is now safe to reboot.

It is now safe to reboot.

It is now safe to reboot.

It is now safe to reboot.

It is now safe to reboot.
/





-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.

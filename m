Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA25329
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Jul 1999 03:35:43 -0600
From: Ulrich.Strelow@schering.de
To: Davin Petersen <davinp@celltech.com>
cc: parisc-linux@thepuffingroup.com
Message-ID: <C12567A2.0034ABC8.00@BE2314.schering.de>
Date: Fri, 2 Jul 1999 11:35:13 +0200
Subject: Antwort: [parisc-linux] Booting the kernel
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>



I have successfully compiled the 990628 snapshot of the CVS tree on my
715/33. After make vmlinux you get the file /usr/src/linux/vmlinux which is
a "PA-RISC1.1 executable -not stripped". After make Image you get the file
/usr/src/linux/arch/parisc/boot/Image which is a "lif file".  You can copy
vmlinux to /stand and use hpux (the HP-UX secondary system loader) to boot
that file instead of booting via rbootd. I have tried it that way:

1. Switch on the machine.
2. Press the ESC key to stop autoboot.
3. Boot from the primary path and specify to "interact with ISL" to get the
ISL prompt.
4. use hpux to load vmlinux
   hpux disc(2/0/1.6.0;0)/stand/vmlinux
             2/0/1.6.0                   is the hardware path to the boot
disk
                      ;0                 stands for section 0 which means
whole disk or LVM
                        /stand/vmlinux   is the kernel file to boot

Ulrich
---------------------------------------------
Ulrich Strelow
<ulrich.strelow@schering.de or
ulrich_strelow@yahoo.com>
Berlin, Germany







Davin Petersen <davinp@celltech.com> am 02.07.99 00:41:40


An:   parisc-linux@thepuffingroup.com
Kopie:     (Blindkopie: Ulrich Strelow/BE/USR/SHG)


Thema:    [parisc-linux] Booting the kernel





After downloading the goodies available from the FTP site I gather that
rbootd is the way to spit the linux kernel to a HP box.  Am I wrong?  Is
there no way of using the ISL?  I tried using the ISL (on my H60), got
an error message and was dumped back to the ISL prompt.

---------------------------------------------------------------------------
To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.

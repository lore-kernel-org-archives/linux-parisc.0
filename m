Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA21657
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jun 2000 11:46:55 -0600
Received: from unknown (HELO tdear.linuxcare.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 7 Jun 2000 17:47:33 -0000
Received: from linuxcare.com (localhost.localdomain [127.0.0.1])
	by tdear.linuxcare.com (Postfix) with ESMTP id 4D0158805
	for <parisc-linux@thepuffingroup.com>; Wed,  7 Jun 2000 10:49:28 -0700 (PDT)
Sender: tdear@tdear.linuxcare.com
Message-ID: <393E8B27.AE7ECEDB@linuxcare.com>
Date: Wed, 07 Jun 2000 10:49:28 -0700
From: Tara Dear <tdear@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Unable to open console on a 712
List-ID: <linux-parisc.vger.kernel.org>

I am trying to boot a 712/80.

When built with ramdisk20000530-sticon.tgz and specifing sti console in
menuconfig, make dep doesn't run clean

When built with ramdisk2000530-sticon.tgx and NOT specifing sti console
in menusconfig, make dep works but  booting stops after :

        kmem_create: Forcing size work alignment -nfs_fh
        VFS: Mounted root (ext2 filesystem)
        request_irq(538, c01bb030, 0x4000000, serial, c0289794)

At this point certain key strokes create responses
        keyb_at: K_NONE for 125                              //when
pushing page up
or
        keyboard: unrecognized scancode (61) - ignored
//when pushing ctrl

I can ping the 712 but I can't get the console.

Any ideas??

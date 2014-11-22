From: nobody@nowhere.invalid (Unknown)
Subject: (unknown)
Date: Sat, 22 Nov 2014 01:35:53 +0000 (UTC)
Message-ID: <46499.5562601418$1416620153@news.gmane.org>

it seems that the installation dies before or when it tries to `branch
to kernel entry point 0x00100000'

Why might this be?

If I try booting from a serial console, over NFS or using rbootd will I
run into the same problem?

>From the email archive

http://lists.parisc-linux.org/pipermail/parisc-linux/2001-April/012249.html

I see that 710 machines appear to have problems with "interrupt routing
from the scsi and lan chips to the cpu". Could 705's have the same
problems (705's and 710's use the same scsi driver according to the
hardware database, so presumably they use at least very similar scsi
hardware), and is this the cause of my problem?

Any and all help will be gratefully received, on or off list.


Thanks in advance, Derek.

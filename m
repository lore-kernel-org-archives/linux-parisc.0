Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA22608
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 05:56:37 -0600
Received: from user48-134.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.48.134)
  by mailserv2.iuinc.com with SMTP; 3 Oct 2000 11:57:33 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 232E3B005; Tue,  3 Oct 2000 12:55:45 +0100 (BST)
Date: Tue, 3 Oct 2000 12:55:45 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001003125545.B17291@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Kernel modules working for 32 bit kernels
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  Loading/unloading of kernel modules now works for 32 bit kernels.
You need to build modutils from cvs.  I've tested it by loading
core scsi support, scsi disk support, sym53c8xx driver, and ext2 file
system support, and then accessing a file system off the 53c875 on
my A180.

Trying to unload the sym53c8xx module causes a kernel crash as
a result of interupts being disabled on entry to the syscall and the
module not cancelling its timer.

Richard

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA12664
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 19:26:46 -0600
Date: Thu, 22 Jun 2000 21:26:35 -0400 (EDT)
From: Pavel Roskin <proski@gnu.org>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Busybox 0.45 released 
In-Reply-To: <20000623004822.949A537E22@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0006222122450.31601-100000@sunapee.transcept.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Matt,

Just a postscriptum to save you some time.
When compiling Busybox disable

BB_INSMOD (not needed)
BB_FEATURE_MOUNT_LOOP (not compatible with linux-2.4.x)
BB_UMOUNT (uses umount syscall, can be fixed)

Everything else compiles and links. Have fun.

Pavel

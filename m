Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id B95484A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 05:27:18 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA04535;
	Thu, 22 Feb 2001 23:27:15 +1100
Date: Thu, 22 Feb 2001 23:27:14 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
In-Reply-To: <20010222115210.C1129@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0102222256360.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 22 Feb 2001, Richard Hirst wrote:

> Don't think so.  The read is issued at 14:36:08, no data is available,
> so 10 seconds later the alarm goes off, and read returns -512.  Strace
> completes that line of output and reports the SIGALRM.

Ah, thanks for the clarification.  So it comes back to data being mangled
in the pipe or somesuch.

Hmm, strace -f now works with your mods to the kernel, so now I can look
at the other end.  

131   22:37:47 write(5, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 158 <unfinished ...>
132   22:37:47 read(0, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEUUUU\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\367\4\0\0\0\0\0PUU\0\0\0\0\0\0"..., 156) = 558544
132   22:37:47 chdir("/scsi/tmp")       = 0

Bingo.  Look at that read.

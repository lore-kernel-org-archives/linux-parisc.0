Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC28C4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 06:03:13 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9F4A0B005; Thu, 22 Feb 2001 13:03:59 +0000 (GMT)
Date: Thu, 22 Feb 2001 13:03:59 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
Message-ID: <20010222130359.F1129@linuxcare.com>
References: <20010222115210.C1129@linuxcare.com> <Pine.LNX.4.21.0102222256360.14557-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102222256360.14557-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Thu, Feb 22, 2001 at 11:27:14PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 22, 2001 at 11:27:14PM +1100, Alan Modra wrote:
> On Thu, 22 Feb 2001, Richard Hirst wrote:
> 
> > Don't think so.  The read is issued at 14:36:08, no data is available,
> > so 10 seconds later the alarm goes off, and read returns -512.  Strace
> > completes that line of output and reports the SIGALRM.
> 
> Ah, thanks for the clarification.  So it comes back to data being mangled
> in the pipe or somesuch.
> 
> Hmm, strace -f now works with your mods to the kernel, so now I can look
> at the other end.  
> 
> 131   22:37:47 write(5, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 158 <unfinished ...>
> 132   22:37:47 read(0, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEUUUU\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\367\4\0\0\0\0\0PUU\0\0\0\0\0\0"..., 156) = 558544
> 132   22:37:47 chdir("/scsi/tmp")       = 0
> 
> Bingo.  Look at that read.

Nice one!  I wonder if that <unfinished ...> is significant.  You can
tell strace to write each processes trace to a seperate file, which
might show if that write is really blocked or it is just straces way of
handling output, and you can use -tt to get finer grained timestamping.

How do I reproduce this?  Is it as simple as cd <somewhere in a gcc
build tree> && ./fixincludes, or is it more complex?

Richard

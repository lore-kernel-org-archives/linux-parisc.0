Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E7FC4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 04:51:24 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 82F9DB005; Thu, 22 Feb 2001 11:52:10 +0000 (GMT)
Date: Thu, 22 Feb 2001 11:52:10 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
Message-ID: <20010222115210.C1129@linuxcare.com>
References: <20010222110054.A1129@linuxcare.com> <Pine.LNX.4.21.0102222202190.14557-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102222202190.14557-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Thu, Feb 22, 2001 at 10:34:18PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 22, 2001 at 10:34:18PM +1100, Alan Modra wrote:
> On Thu, 22 Feb 2001, Richard Hirst wrote:
> 
> > On Thu, Feb 22, 2001 at 05:37:55PM +1100, Alan Modra wrote:
> > > 
> > > I had another look at the fixincludes problem, and found the following:
> > > 
> > > 14:36:08 write(5, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 158) = 158
> > > 14:36:08 alarm(10)                      = 0
> > > 14:36:08 read(6, "FALSE\n", 4096)       = 6
> > > 14:36:08 alarm(10)                      = 10
> > > 14:36:08 read(6, "FALSE\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = -512
> > > 14:36:18 --- SIGALRM (Alarm clock) ---
> > > 14:36:18 read(6, "FALSE\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = -512
> > > 14:36:28 --- SIGINT (Interrupt) ---
> > > 14:36:28 +++ killed by SIGINT +++

>    This is a different situation.  Notice in my case that the first
> read() returning -512 was before the alarm went off.

Don't think so.  The read is issued at 14:36:08, no data is available,
so 10 seconds later the alarm goes off, and read returns -512.  Strace
completes that line of output and reports the SIGALRM.

Richard

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id B87014A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 04:00:14 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1B8F6B005; Thu, 22 Feb 2001 11:00:55 +0000 (GMT)
Date: Thu, 22 Feb 2001 11:00:54 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
Message-ID: <20010222110054.A1129@linuxcare.com>
References: <Pine.LNX.4.21.0102100106450.27808-100000@front.linuxcare.com.au> <Pine.LNX.4.21.0102221609360.14557-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102221609360.14557-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Thu, Feb 22, 2001 at 05:37:55PM +1100
List-ID: <linux-parisc.vger.kernel.org>

Hi Alan,

On Thu, Feb 22, 2001 at 05:37:55PM +1100, Alan Modra wrote:
> 
> I had another look at the fixincludes problem, and found the following:
> 
> 14:36:08 write(5, "cd /scsi/tmp\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 158) = 158
> 14:36:08 alarm(10)                      = 0
> 14:36:08 read(6, "FALSE\n", 4096)       = 6
> 14:36:08 alarm(10)                      = 10
> 14:36:08 read(6, "FALSE\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = -512
> 14:36:18 --- SIGALRM (Alarm clock) ---
> 14:36:18 read(6, "FALSE\nShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 4096) = -512
> 14:36:28 --- SIGINT (Interrupt) ---
> 14:36:28 +++ killed by SIGINT +++
> 
> fd 5 and 6 are pipes to a /bin/sh.  -512 is ERESTARTSYS.  ERESTARTSYS
> shouldn't happen, and is why fixincludes is bombing.
> 
> Nothing suspicious in previous rt_sigaction calls as far as I could see,
> and putting in a debugging printk in do_sigaction shows sa_flags is being
> set correctly, to 0x40.
> 
> Ideas?

Simple test case:

main()
{
        char buf[10];

        strcpy(buf, "my buffer\n");
        alarm(1);
        read(0, buf, 10);
}


10:50:05 alarm(1)                       = 0
10:50:05 read(0, "my buffer\n", 10)     = -512
10:50:06 --- SIGALRM (Alarm clock) ---
10:50:06 +++ killed by SIGALRM +++


Looks like the primary problem is that your read is blocking for 10 seconds
thinking there is no data available.  Secondary problem is that the kernel
returns the wrong thing when the syscall is interrupted.

I gather there is something receiving the data written to fd 5, processing
it, and writing back up fd 6.  We want to know if that something writes
the missing data or not.

Richard

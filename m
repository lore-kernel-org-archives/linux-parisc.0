Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1603C482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 19:50:02 -0600 (MDT)
Date: Tue, 14 Aug 2001 21:50:30 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Users staying up to date.
Message-ID: <20010814215030.A26703@megatonmonkey.net>
References: <20010814154037.I25258@megatonmonkey.net> <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010815010034.K22144@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Aug 15, 2001 at 01:00:34AM +0100
List-ID: <linux-parisc.vger.kernel.org>

> > I recently found though, that when compiling more complicated
> > MPI programs, cc and ld start dropping SIG11's like there was
> > no tommorow (more on this after I do some testing).
> 
> OK, I'd be interested to see more detail once we're sure you're on
> an uptodate system.
> 
> Run debian installer to completion on one machine
> apt-get dist-upgrade
> apt-get install nis mpich
> tar up / and copy it to all other machines
> 
> If the latest debian installer (never mind what's on the CDs) doesn't
> work, then please report the problems.
>

Thanks for all the feedback.

In general, I don't want to submit a bugreport and have the
list say "That's already fixed in the latest updated package" :)

Which is the reason for my original post.

"How does one stay ontop of a _moving_ target 
 like the PARISC development team?"
- Anonymous Coward :)


I will try out the latest debain intaller and feedback to the list.

I'm currently running apt-get on one of our nodes, and trying
to get it to an updated state.

Hrm. apg-get segfaults randomly. 

If at first you don't succeed, run, run and run again
(until it stops segfaulting).

<Carlos looks at terminal>
Ohhhhh.... it's working!
And traveling through time as tar seems to be reminiscing about how
it's unpacking a file it hasn't made yet, because the obviously correct 
system clock has warned it against time travel :}

Ouch...

--------------
[Nearing the end of apt-get -f dist-update]

Writing passwd-file to /etc/passwd.upwd-write
Replacing "/etc/passwd" with "/etc/passwd.upwd-write"
Writing group-file to /etc/group.upwd-write
Replacing "/etc/group" with "/etc/group.upwd-write"
dpkg: error processing base-passwd (--configure):
 subprocess post-installation script returned error exit status 127
Errors were encountered while processing:
 base-passwd
E: Sub-process /usr/bin/dpkg returned an error code (1)

[So I run it again]

root@node10:/# apt-get -f dist-upgrade
Segmentation faultsts... 43%
root@node10:/# 

[Ouch...]
[With a dump in /var/log/messages]

[dmesg]

do_page_fault() pid=13164 command='apt-get' type=6 address=0x40040dd7
vm_start = 0x3ff13000, vm_end = 0x400a4000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111110000001111
r0-3	 00000000 000002f4 40040dd7 00022350
r4-7	 400c98e0 00022330 faf00948 faf00924
r8-11	 faf00958 00000001 0001dbe5 faf00888
r12-15	 faf00920 00000030 faf008b8 faf008b0
r16-19	 faf00760 faf008a4 faf00748 4030c57c
r20-23	 3ff13000 00000000 00000005 00000001
r24-27	 00000001 00190eb9 00000000 0001d900
r28-31	 3ff13000 00000000 faf00c80 4029fdab
sr0-3	 00000000 000002f4 00000000 000002f4
sr4-7	 000002f4 000002f4 000002f4 000002f4

IASQ: 000002f4 000002f4 IAOQ: 40040dd7 40040ddb
 IIR: 081c0254    ISR: 000002f4  IOR: 404a0004
ORIG_R28: 00190eb9

-------------

We're running a hand rolled:
Linux node10 2.4.0 #37 Tue Jul 17 22:33:26 EDT 2001 parisc unknown

This apt-update was done from a system based on the unstable
baseplus tar.

-------------

[However, I ran it again, like the good robot I am.]
[I kept running it infact, until I get int the following situation:]

root@node10:/# apt-get -f dist-upgrade
Reading Package Lists... Done
Building Dependency Tree... Done
Calculating Upgrade... Done
The following NEW packages will be installed:
  autoconf2.13 autotools-dev groff-base libdb3 
118 packages upgraded, 4 newly installed, 0 to remove and 0  not upgraded.
8 packages not fully installed or removed.
Need to get 1105kB/47.5MB of archives. After unpacking 6158kB will be used.
Do you want to continue? [Y/n] Y
Get:1 http://http.us.debian.org unstable/main dpkg 1.9.16 [1105kB]
Fetched 1105kB in 25s (42.7kB/s)                                                        
debconf: cannot preconfigure packages -- apt-utils is not installed
tar: ./conffiles: time stamp 2001-04-23 18:17:20 is 980225879 s in the future
tar: ./preinst: time stamp 1999-11-24 19:14:54 is 935650533 s in the future
tar: ./prerm: time stamp 1999-11-24 19:14:54 is 935650533 s in the future
tar: ./postinst: time stamp 2000-12-23 15:25:50 is 969764789 s in the future
tar: ./control: time stamp 2001-07-06 14:33:14 is 986606033 s in the future
(Reading database ... 17525 files and directories currently installed.)
Preparing to replace dpkg 1.8.3 (using .../archives/dpkg_1.9.16_hppa.deb) ...
Unpacking replacement dpkg ...
dpkg: error processing /var/cache/apt/archives/dpkg_1.9.16_hppa.deb (--unpack):
 trying to overwrite directory `/usr/share/locale/cs' in package texinfo with nondirectory
dpkg-deb: subprocess paste killed by signal (Broken pipe)
Errors were encountered while processing:
 /var/cache/apt/archives/dpkg_1.9.16_hppa.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)
root@node10:/# 

--------------


In light of these problems.

I think I'm going to:

- Build a newer kernel.
- Try the latest debian installer.
- Give apt another shot at upgrading the system.

--------------

[Musing]

I wonder if running the 715/50's as diskless nodes is as bad an
idea as I originally thought. Would 10Mbit switched be faster than
the 1gig SCSI drive? (HP C2247M1 0BW4)... probably not.

However, it would give us many more active nodes, since many of
our systems are just missing drives :}

Cheers,
Carlos.
-------------------------
Baldric Project
http://www.baldric.uwo.ca
-------------------------

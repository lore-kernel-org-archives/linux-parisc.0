Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9304E4842
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 08:36:11 -0600 (MDT)
Date: Thu, 27 Sep 2001 14:35:56 +0000
From: Richard Allen <ra@hp.is>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] More strange problems
Message-ID: <20010927143556.K16693@hp.is>
References: <20010927113453.F16693@hp.is> <20010927142943.A16096@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010927142943.A16096@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Thu, Sep 27, 2001 at 02:29:43PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 27, 2001 at 02:29:43PM +0100, Matthew Wilcox wrote:
> On Thu, Sep 27, 2001 at 11:34:53AM +0000, Richard Allen wrote:
> > While creating a diff from the glibc 2.2.3 sources in your CVS against
> > prestine glibc 2.2.3 sources, I notice that there is a subfolder in
> > there called linuxthreads.   Are threads handled differently on
> > parisc than on other platforms ?   Or is this folder just something
> > left over from older times ?
> 
> linuxthreads is distributed as an add-on package for glibc; see the
> glibc documentation.

Ah :)   Thanks :)


Is there any way for a non kernel guru like myself to get any info out
of those errors in dmesg ?

do_page_fault() pid=2132 command='rpm' type=15 address=0x00000024

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 00000008 0007c7b7 bff00938
r4-7     001b8000 00000009 00207510 0020758c
r8-11    00002001 00205fe0 bff007f4 001ffa10
r12-15   001de270 00000000 bff004c4 00000102
r16-19   00000000 001f65e0 00205fe0 001b8000
r20-23   01010101 00205fdc 80808080 00000006
r24-27   bff00938 00000009 00000000 001dca70
r28-31   001e3238 00000000 bff009f0 00059457
sr0-3    00000014 00000014 00000000 00000014
sr4-7    00000014 00000014 00000014 00000014

IASQ: 00000014 00000014 IAOQ: 0007c7c3 0007c7c7
 IIR: 48340038    ISR: 00000014  IOR: 00000024
 CPU:        0   CR30: 29164000 CR31: 10350000
 ORIG_R28: 00206000



For example, is this a problem with the command Im running (RPM) or is
it a problem in the kernel ?



-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 804A049E4
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 08:02:29 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 90AB9B00C; Fri,  5 Oct 2001 15:04:02 +0100 (BST)
Date: Fri, 5 Oct 2001 15:04:02 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] HP-UX binary compatibility
Message-ID: <20011005150402.P11105@linuxcare.com>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D865@umr-mail03.cc.umr.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D865@umr-mail03.cc.umr.edu>; from nneul@umr.edu on Thu, Oct 04, 2001 at 04:16:52PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 04, 2001 at 04:16:52PM -0500, Neulinger, Nathan wrote:
> Got a question of how best to do something - flexlm does the lanscan style
> open of /dev/lan, /dev/lan0...15 to try and figure out the local hardware
> address of the machine:
> 
> 24240: open("/dev/lan", O_RDONLY) = -1 ENOENT (No such file or directory)
> 24240: open("/dev/lan", O_RDONLY) = -1 ENOENT (No such file or directory)
> 24240: open("/dev/lan0", O_RDONLY) = 9
> 24240: ioctl(9 [/dev/lan0], NETSTAT, 0x7b03bc28) = 0
> 24240: sigprocmask(2, 0x7b038a80, 0x7b03cf28) = 0
> 24240: sigprocmask(2, 0x7b03cf28, 0) = 0
> 24240: close(9 [/dev/lan0]) = 0
> 24240: time(0) = 0x3bbcd084
> 24240: write(1 [fluent.log], 0x7b028000, 66) = 66
> 
> What do y'all think is the best way of dealing with this? I could add the
> wrapper that traps the open system call, and then special case handle an
> open of /dev/lan*, and somehow keep track of that file descriptor in a
> global var of some sort, and then test for that fd in a wrapped ioctl
> handler? 
> 
> Or would there be some nicer way of dealing with this?
> 
> Then again, I suppose I could also just return legit info on any NETSTAT
> ioctl on any open fd and just have the open of /dev/lan really open
> /dev/null. That might be the simplest way to get it working. 

One alternative approach might be to load a kernel module that provides
a driver for /dev/lan.

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA31012
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 16:50:02 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id NAA10461
	for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 13:49:23 -0800 (PST)
Received: from netscape.com ([205.217.243.67]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F8T8ME00.85R for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar
          1999 13:49:26 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36F1754D.17EA4048@netscape.com>
Date: Thu, 18 Mar 1999 16:51:09 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Gateway instructions
References: <199903181840.KAA25312@cllmail.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Cary Coutant wrote:
> When a page's access rights are 4, 5, 6, or 7, a gateway instruction on
> that page causes the privilege promotion. Most HP-UX system calls are
> branches to a common gateway instruction on a gateway page in the fourth
> quadrant. This gateway instruction then branches to a common syscall
> entry sequence that ultimately switches on the syscall number passed in a
> GR. Some "lightweight" syscalls may be implemented with their own
> gateways.

OK, so you don't have a spot on the page for each syscall?  I was
thinking that we'd want to do that, since we're going to use the whole
page anyway and it would make things a little quicker by eliminating the
later dispatch-by-syscall step.

I presume that the syscall gateway page layout is part of the HP-UX
kernel/user ABI though, so we'll be following your lead for SOM/HP-ELF
binaries anyway.

> The B bit is not a problem as long as the delay slot of the branch to the
> gateway is either nullified or filled in with a non-branch instruction.
> For example,
> 
>     LDIL L'GATEWAY,%r1
>     BLE  R'GATEWAY(%sr7,%r1)
>     LDO  sycallnum,%r22

Someday (maybe today, if I get all my work done =) ), I'll learn to read
that.

Mike

-- 
368177.00 314980.91

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA28572
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 16:08:11 -0500
Received: from tintin.mcom.com (tintin.mcom.com [205.217.233.42])
	by netscape.com (8.8.5/8.8.5) with ESMTP id NAA26736
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 13:07:34 -0800 (PST)
Received: from netscape.com ([205.217.243.139]) by
          tintin.mcom.com (Netscape Messaging Server 4.03) with ESMTP id
          F965CT00.2E2 for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar
          1999 13:07:41 -0800
Sender: shaver@netscape.com (Mike Shaver)
Message-ID: <36FAA595.DB56B012@netscape.com>
Date: Thu, 25 Mar 1999 16:07:33 -0500
From: Mike Shaver <shaver@netscape.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] syscall work
References: <199903252046.OAA08061@helgaaspc.rsn.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Bjorn Helgaas wrote:
> If Linux uses a different gateway page address than HP-UX (which I
> think is a good idea), why not use a strategy like that used for
> 64-bit HP-UX apps, where the kernel supplies the address in a
> register at application startup?

OK, I'm convinced.  I've changed unistd.h to use 0xC0000404 (on the next
page) for the syscall gateway, although we can easily change it back.

The ``Assembly Language Reference Manual'' I have says:
  Refer to the /HP-UX Reference/ manual for more information on HP-UX
system
  calls.

Anyone know what manual they're talking about?  I'd like to find out
what to do for syscalls that take more than 4 arguments, like mmap and
recvfrom and sendto.

Mike

-- 
81996.85 73813.97

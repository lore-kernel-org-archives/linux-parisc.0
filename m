Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id UAA03393
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 20:35:30 -0500
Received: from cllmail.cup.hp.com (cllmail.cup.hp.com [15.28.98.139])
	by atlrel2.hp.com (8.8.6 (PHNE_14041)/8.8.5tis) with ESMTP id UAA24155
	for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 20:34:57 -0500 (EST)
Received: from [15.0.97.82] (cc757591.cup.hp.com [15.0.97.82]) by cllmail.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id RAA15176 for <hppa-linux@thepuffingroup.com>; Thu, 18 Mar 1999 17:35:09 -0800 (PST)
Message-Id: <199903190135.RAA15176@cllmail.cup.hp.com>
Subject: Re: [hppa-linux] Gateway instructions
Date: Thu, 18 Mar 1999 17:38:28 -0800
From: Cary Coutant <cary@cup.hp.com>
To: <hppa-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>OK, so you don't have a spot on the page for each syscall?  I was
>thinking that we'd want to do that, since we're going to use the whole
>page anyway and it would make things a little quicker by eliminating the
>later dispatch-by-syscall step.

There's a fair amount of setup code common to all syscalls before the 
dispatch to individual kernel entry points, and there are a lot of 
syscalls in HP-UX, so we use a single gateway.

For the 64-bit ABI, the gateway address is not hardcoded; when the 
program is loaded, the kernel passes it the address of a syscall vector 
table, which has one pointer per syscall. Most of the syscalls still 
vector to the one common gateway, but the lightweight syscalls can now be 
vectored off to a special gateway that has less overhead.

The 32-bit syscall convention is documented in (of all places) the 
Assembler manual; the 64-bit convention is documented in the PA-64 
runtime supplement (program startup chapter). These documents are 
available from

    http://www.software.hp.com/STK


Cary Coutant
Hewlett-Packard Co.
Application Delivery Lab

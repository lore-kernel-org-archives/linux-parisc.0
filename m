Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Vlad Markov <markov@monmouth.com>
Cc: debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Vlad Markov <markov@monmouth.com>
   of "Wed, 23 Jan 2002 21:00:15 EST." <200201240200.VAA00858@monmouth.com>
References: <200201240200.VAA00858@monmouth.com> 
Date: Thu, 24 Jan 2002 23:55:01 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020125065501.A6537482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: tag starvation
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Follow up to parisc-linux@lists.parisc-linux.org only please.
(ie this isn't a debian linux issue)

Vlad Markov wrote:
> I get the following message when I boot up on a 735/99:
> Jan 22 19:12:41 grumpy kernel: scsi0 (1:0) Target is suffering from tag
>	starvation.

Seems only 53c700.c prints this msg. Is this the right driver?

Normally you shouldn't see this *if* the device supports tagged commands.
I can never remember the SCSI driver options (the parisc-linux FAQ has 
the URL to them) but one of them will either disable or limit 
"queue depth" for Queue Tags and that should take care of it.

BTW, normally you want to post the /proc/scsi/scsi info for
the devices in question.

> The kernel Iam using is:
> Jan 22 19:12:41 grumpy kernel: Linux version 2.4.16-32 (root@paer) (gcc versi
>   on

> 3.0.3) #1 Sat Dec 29 01:28:13 MST 2001
> 
> I suspect this is not a good message - should I worry? 

Panic would be worse ;^)

grant

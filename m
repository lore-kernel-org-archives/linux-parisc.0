Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id BFD95482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 21 Aug 2001 07:09:08 -0600 (MDT)
Received: from mcnbru01 (unverified) by epirel991.europay.com
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <Tac10592d5582136be6@epirel991.europay.com> for <parisc-linux@lists.parisc-linux.org>;
 Tue, 21 Aug 2001 15:08:51 +0200
Subject: Re: [parisc-linux] Kernel 2.4.9-pa2?
To: "Helge Deller <deller" <deller%gmx.de%SMTP%EUROPAY@mastercard.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <OFB2DF2637.A5A7FCF6-ONC1256AAF.004781A8@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Tue, 21 Aug 2001 15:12:01 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge,

Sorry to have not enough knowlegde to help the debuging.

Regarding IA box I do not yet have the opportunity to recompile a recent
kernel 2.4 but I will try asap.

Kind regards,
     Joel



                                                                           =
                                       =20
                    Helge Deller                                           =
                                       =20
                    <deller@gmx.d        To:     Jo=EBl Soete/BRU/MASTERCAR=
D@MASTERCARD                             =20
                    e>                   cc:     parisc-linux@lists.parisc-=
linux.org@SMTP@EUROPAY                 =20
                                         Subject:     Re: [parisc-linux] Ke=
rnel 2.4.9-pa2?                        =20
                    21-08-01                                               =
                                       =20
                    08:36 AM                                               =
                                       =20
                                                                           =
                                       =20
                                                                           =
                                       =20



On Monday 20 August 2001 23:17, Helge Deller wrote:
> > > Is it nornal that process ksoftirq_CPU0 consume about 95% of cpu
> > > resources?
>
> Hi Jo=EBl,
>
> sorry, but I can't verify that with my 715/64, kernel -pa3 (same as -pa2
> with just a few minor and for this problem irrelevant changes in the
> harmony sound driver).
>
> pa64:~# uname -a
> Linux pa64 2.4.9-pa3 #6 Son Aug 19 20:16:30 CEST 2001 parisc unknown
>
> pa64:~# top
>
> 44 processes: 43 sleeping, 1 running, 0 zombie, 0 stopped
> CPU states:   2.3% user,   2.8% system,   0.0% nice,  94.9% idle
> PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
>    3 root      19  19     0    0     0 SWN   0.0  0.0   0:00
ksoftirqd_CPU0
>
> Helge

Oops, I think you found a bug in the kernel. Don't know yet if it's only
pa-risc specific
or a general linux-kernel issue.

c3000:~# uname -a
Linux c3000 2.4.9-pa3 #6 Son Aug 19 20:16:30 CEST 2001 parisc unknown

c3000:~# uptime
 08:36:15 up  9:28,  2 users,  load average: 1.00, 1.00, 1.00

c3000:~# top
49 processes: 46 sleeping, 3 running, 0 zombie, 0 stopped
CPU states:   0.6% user,  99.4% system,   0.0% nice,   0.0% idle
  PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
    3 root      20  19     0    0     0 RWN  99.2  0.0 445:09
ksoftirqd_CPU0

Greetings,
Helge





**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86D5A4830
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 06:33:19 -0600 (MDT)
Message-ID: <3F378CFE.2A12407@india.hp.com>
Date: Mon, 11 Aug 2003 18:03:03 +0530
From: Naresh <knaresh@india.hp.com>
Reply-To: knaresh@india.hp.com
MIME-Version: 1.0
To: Thibaut VARENE <varenet@esiee.fr>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Affined IRQs.
References: <3F373D92.C287B6B4@india.hp.com> <20030811094324.17ed7a86.varenet@esiee.fr>
Content-Type: text/plain; charset=us-ascii
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

A couple of questions:
1. Do does this mean interrupts can go to any CPU?
2. If a CPU on an SMP system is stopped or its interrupts are blocked, will
its interrupts automatically be serviced on another online CPU, due to their
non-affining nature?
Regards,
Naresh.

Thibaut VARENE wrote:

> > Hi,
> > The IA-64 Linux kernel has a concept of affined IRQs, wherein IRQs can
> > be bound/affined to particular CPUs. The affinity information shows up
> > in '/proc/irq/#/smp_affinity'. I cannot see any affinity of IRQs to CPUs
> > in PA ( iosapic.c and irq.c).. Is my understanding correct?
> > Regards,
> > Naresh.
>
> This has to be implemented for parisc and is on my todo list ;)
>
> (BTW, on vacation till Aug 25th.)
>
> Thibaut VARENE
> The PA/Linux ESIEE Team
> http://pateam.esiee.fr/
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

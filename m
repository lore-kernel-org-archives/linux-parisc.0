Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (d108.dhcp212-198-139.noos.fr [212.198.139.108])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88A624874
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 01:47:32 -0600 (MDT)
Date: Mon, 11 Aug 2003 09:43:24 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: knaresh@india.hp.com
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Affined IRQs.
Message-Id: <20030811094324.17ed7a86.varenet@esiee.fr>
In-Reply-To: <3F373D92.C287B6B4@india.hp.com>
References: <3F373D92.C287B6B4@india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 11 Aug 2003 12:24:10 +0530
Naresh <knaresh@india.hp.com> wrote:

> Hi,
> The IA-64 Linux kernel has a concept of affined IRQs, wherein IRQs can
> be bound/affined to particular CPUs. The affinity information shows up
> in '/proc/irq/#/smp_affinity'. I cannot see any affinity of IRQs to CPUs
> in PA ( iosapic.c and irq.c).. Is my understanding correct?
> Regards,
> Naresh.

This has to be implemented for parisc and is on my todo list ;)

(BTW, on vacation till Aug 25th.)


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

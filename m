Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: phi <phi@hpfrcu81.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] boot (micro) hang 
In-Reply-To: Message from phi <phi@hpfrcu81.france.hp.com>
   of "Tue, 08 Oct 2002 15:49:47 +0200." <3DA2E27B.5708975E@hpfrcu81.france.hp.com>
References: <3DA2945D.7010301@visoel.de>  <3DA2E27B.5708975E@hpfrcu81.france.hp.com> 
Date: Tue, 08 Oct 2002 11:01:52 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021008170152.AD42D4839@dsl2.external.hp.com>
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

phi wrote:
> Thomas helped to turn on verbosity during boot and remove LED display code,
> but yet it fail to boot 'normally' and I still get the micro hang (15 minute).

The long delay happens during device discovery.
You could enable EARLY_BOOTUP_DEBUG in arch/parisc/kernel/pdc_cons.c
and add some printk's to the loop in system_map_inventory().

Only two pieces of code really get executed during that time.
One is the PDC calls - verify your firmware is the latest and if it
isn't, please update.  The other might be GSC buswalk code. I thought
the bus's under U2 are walked to detect devices not listed by PDC.
But I don't know exactly when that occurs in the boot sequence.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id C10E2482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 07:44:04 -0600 (MDT)
Date: Mon, 11 Aug 2003 15:44:02 +0200
Subject: Re: [parisc-linux] Affined IRQs.
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
To: knaresh@india.hp.com
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <3F378CFE.2A12407@india.hp.com>
Message-Id: <DE031C48-CC01-11D7-94DE-0030656F07A2@esiee.fr>
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

Le lundi, 11 ao=FB 2003, =E0 14:33 Europe/Paris, Naresh a =E9crit :

> A couple of questions:
> 1. Do does this mean interrupts can go to any CPU?

there are several cases, depending on the hardware.
For instance, on A500, IRQs are distributed to both CPUs, on J5000,=20
only one of the two CPUs gets all IRQs.
This is IOSAPIC programmation that has to be reviewed:

on J5000:
[varenet@k2000 ~]$ uname -a
Linux k2000 2.4.20-pa18 #1 SMP Sun Jan 12 02:41:51 CET 2003 parisc64=20
GNU/Linux
[varenet@k2000 ~]$ cat /proc/interrupts
           CPU00      CPU01
  64: 1053803311 1053803113      PARISC-CPU  timer
  65:    2598316   12633504      PARISC-CPU  IPI
  66:   68320843          0      PARISC-CPU  IO-SAPIC00-L2
  67:          0          0      PARISC-CPU  IO-SAPIC00-L3
  68:        326          0      PARISC-CPU  IO-SAPIC00-L0
  69:          0          0      PARISC-CPU  IO-SAPIC00-L1
  70:    6616979          0      PARISC-CPU  IO-SAPIC00-L1
128:        326          0      IO-SAPIC00  SuperIO
129:    6616979          0      IO-SAPIC00  sym53c8xx, sym53c8xx
130:   68320843          0      IO-SAPIC00  eth0
195:        323          0         SuperIO  serial
199:          3          0         SuperIO  ide0

on A500:
[varenet@mkhppa3 ~]$ uname -a
Linux mkhppa3 2.4.20-pa28 #1 SMP Sun Mar 9 23:56:53 CET 2003 parisc64=20
GNU/Linux
[varenet@mkhppa3 ~]$ cat /proc/interrupts
           CPU00      CPU01
  64:  727337429  727336565      PARISC-CPU  timer
  65:   31826972   39174091      PARISC-CPU  IPI
  66:   42581516          0      PARISC-CPU  IO-SAPIC00-L0
  67:          0         30      PARISC-CPU  IO-SAPIC00-L1
  68:          0          0      PARISC-CPU  IO-SAPIC00-L2
  69:          0     696338      PARISC-CPU  IO-SAPIC00-L2
  70:    3672511          0      PARISC-CPU  IO-SAPIC00-L3
  71:          0        209      PARISC-CPU  IO-SAPIC00-L4
  72:          0          0      PARISC-CPU  IO-SAPIC00-L5
128:   42581516          0      IO-SAPIC00  eth0
129:          0         30      IO-SAPIC00  sym53c8xx
130:          0     696338      IO-SAPIC00  sym53c8xx, sym53c8xx
131:    3672511          0      IO-SAPIC00  sym53c8xx
132:          0        209      IO-SAPIC00  serial


> 2. If a CPU on an SMP system is stopped or its interrupts are blocked,=20=

> will
> its interrupts automatically be serviced on another online CPU, due to=20=

> their
> non-affining nature?

CPU deconfiguration is also on my todo list ;)
So you can't stop a CPU on a PARISC SMP system atm.
the second part of the question is an iodood (Grant Grundler ;)=20
question, but to my understanding IRQs won't probably be serviced by=20
another CPU unless the IOSAPIC is reprogrammed to do so.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

> Regards,
> Naresh.
>
> Thibaut VARENE wrote:
>
>>> Hi,
>>> The IA-64 Linux kernel has a concept of affined IRQs, wherein IRQs=20=

>>> can
>>> be bound/affined to particular CPUs. The affinity information shows=20=

>>> up
>>> in '/proc/irq/#/smp_affinity'. I cannot see any affinity of IRQs to=20=

>>> CPUs
>>> in PA ( iosapic.c and irq.c).. Is my understanding correct?
>>> Regards,
>>> Naresh.
>>
>> This has to be implemented for parisc and is on my todo list ;)
>>
>> (BTW, on vacation till Aug 25th.)
>>
>> Thibaut VARENE
>> The PA/Linux ESIEE Team
>> http://pateam.esiee.fr/
>> _______________________________________________
>> parisc-linux mailing list
>> parisc-linux@lists.parisc-linux.org
>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
>

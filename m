Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E2AA4853
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 03:42:29 -0700 (MST)
Date: Mon, 25 Mar 2002 11:42:14 +0100
Subject: Re: [parisc-linux] Re: Kernel 2.4.17-32-smp problem 
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v481)
Cc: Jeremy Drake <jeremyd@apptechsys.com>,
	parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@dsl2.external.hp.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20020325035848.477324855@dsl2.external.hp.com>
Message-Id: <F8418E18-3FDC-11D6-80EC-0030656F07A2@esiee.fr>
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

Le lundi 25 mars 2002, =E0 04:58 , Grant Grundler a =E9crit :

> Jeremy Drake wrote:
>> I was running 2.4.17-32-smp before.  It just updated a debian package=20=

>> of
>> the same kernel version.  I had no problems with the old one, other=20=

>> than
>> the fact that it seems to ignore cpu0.  All processor time goes to =
cpu1
>> and cpu0 gets a ton of idle.
>
> hmm..that fits with the "top" report of 50% idle that I've seen.
> We've already got a bug report on this, iirc.
We're running a 2.4.17-pa17 SMP for over 12 days now on our A500;
The top also shows us a 50% idle.
The slmon utility shows that only one processor is being used (CPU1),=20
but the experience told us it wasn't true (see bellow).
>
> Your observation suggest something wrong with either process =
scheduling
> or process accounting.
>
> And I hope CPU0 isn't completely idle, look at /proc/interrupts.
> I know interrupt distribution works.
We are running two instances of setiathome ;o) on this machine with this=20=

kernel,
both units are completed in the same time, I mean that the box does two=20=

units in the time it needs to do one in non-SMP mode. Therefore I think=20=

that both processors are functioning properly ;o)
We have noticed that the load average seems to reflect the real load on=20=

the machine: it goes up to 2.00 when 2 setis are running, even though=20
only one seems to be "on processor" according to the top.

We suspect that something goes wrong with the proc.
Here's our /proc/interrupts:
[varenet@mkhppa3 ~]$ cat /proc/interrupts
  IRQ      count         Region    ISR
  64:  218592808    8402371       PA-CPU-00  timer
  65:    7219789          0       PA-CPU-00  IPI
  66:    8402371         30       PA-CPU-00  IO-SAPIC00-L0
  67:          0     239155       PA-CPU-00  IO-SAPIC00-L1
  68:          0       2284       PA-CPU-00  IO-SAPIC00-L2
  69:         30          0       PA-CPU-00  IO-SAPIC00-L2
  70:     239155          0       PA-CPU-00  IO-SAPIC00-L3
  71:       2284          0       PA-CPU-00  IO-SAPIC00-L4
  72:          0          0       PA-CPU-00  IO-SAPIC00-L5
128:    8402371          0      IO-SAPIC00  eth0
130:         30          0      IO-SAPIC00  sym53c8xx
131:     239155          0      IO-SAPIC00  sym53c8xx
132:       2284          0      IO-SAPIC00  serial
>
>
Thibaut VARENE
PA/Linux ESIEE Team
http://www.esiee.fr/puffin

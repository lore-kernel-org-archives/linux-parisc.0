Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE39E482F
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 10:00:16 -0700 (MST)
Date: Mon, 25 Mar 2002 09:00:10 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	<parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Re: Kernel 2.4.17-32-smp problem 
In-Reply-To: <F8418E18-3FDC-11D6-80EC-0030656F07A2@esiee.fr>
Message-ID: <Pine.LNX.4.33L2.0203250836270.13376-100000@eiger.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 25 Mar 2002, Thibaut VARENE wrote:

> We're running a 2.4.17-pa17 SMP for over 12 days now on our A500;
> The top also shows us a 50% idle.
> The slmon utility shows that only one processor is being used (CPU1),
> but the experience told us it wasn't true (see bellow).
> >
> > Your observation suggest something wrong with either process scheduling
> > or process accounting.
> >
> > And I hope CPU0 isn't completely idle, look at /proc/interrupts.
> > I know interrupt distribution works.
> We are running two instances of setiathome ;o) on this machine with this
> kernel,
> both units are completed in the same time, I mean that the box does two
> units in the time it needs to do one in non-SMP mode. Therefore I think
> that both processors are functioning properly ;o)
> We have noticed that the load average seems to reflect the real load on
> the machine: it goes up to 2.00 when 2 setis are running, even though
> only one seems to be "on processor" according to the top.

When I tried to run 2 seti's, one hung.  When I look at per-process stats,
they all have 0 time on cpu0.

>
> We suspect that something goes wrong with the proc.
> Here's our /proc/interrupts:
> [varenet@mkhppa3 ~]$ cat /proc/interrupts
>   IRQ      count         Region    ISR
>   64:  218592808    8402371       PA-CPU-00  timer
>   65:    7219789          0       PA-CPU-00  IPI
>   66:    8402371         30       PA-CPU-00  IO-SAPIC00-L0
>   67:          0     239155       PA-CPU-00  IO-SAPIC00-L1
>   68:          0       2284       PA-CPU-00  IO-SAPIC00-L2
>   69:         30          0       PA-CPU-00  IO-SAPIC00-L2
>   70:     239155          0       PA-CPU-00  IO-SAPIC00-L3
>   71:       2284          0       PA-CPU-00  IO-SAPIC00-L4
>   72:          0          0       PA-CPU-00  IO-SAPIC00-L5
> 128:    8402371          0      IO-SAPIC00  eth0
> 130:         30          0      IO-SAPIC00  sym53c8xx
> 131:     239155          0      IO-SAPIC00  sym53c8xx
> 132:       2284          0      IO-SAPIC00  serial
> >
> >
> Thibaut VARENE
> PA/Linux ESIEE Team
> http://www.esiee.fr/puffin
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

-- 
Truthful, adj.:
	Dumb and illiterate.
		-- Ambrose Bierce, "The Devil's Dictionary"

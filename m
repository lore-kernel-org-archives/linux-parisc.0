Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: Stephan Trajkoff <stephan@itp.bg>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 9000/819/K210 
In-Reply-To: Message from Thibaut VARENE <varenet@esiee.fr>
   of "Mon, 08 Jul 2002 20:14:06 +0200." <7D78C29C-929E-11D6-9EA1-0030656F07A2@esiee.fr>
References: <7D78C29C-929E-11D6-9EA1-0030656F07A2@esiee.fr> 
Date: Mon, 08 Jul 2002 14:27:32 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020708202732.A04844835@dsl2.external.hp.com>
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

Thibaut VARENE wrote:
> pa52 ? Well, if you're one step further than everyone, that's kinda=20
> cheating :^)

yeah...I was going to test/commit the lvm10 patch but didn't have extra disks
to trash on that box...

> > since yesterday. Both w and ps ax still work. Something else must be
> > triggering the problem.
> Do you mean that the hangs Ryan and I are studying should be solved by=20=
> your changes ?

no. Just providing another data point...

> Anyway, I have noticed that on J5k and A500, using the 'normal IO' mode=20=
> for the SYM53C8XX driver seems to decrease risk of such hangs (running
> 2 setis on both machines and building ISOs on the A500 for about 4 days,
> pa46 on both, without hangs,

Did you stop the machine at this point or did it hang?
ie has anyone seen a hang when sym53c8xx driver was using IO port space?

> where the A500 could only run for about
> 3 hours is the same conditions with the MMIO mode, 1 day in the best=20
> case.)

This really suggests the problem is with disk IO and not compilation.
And it stinks like a "PCI Posted Write" problem.

Have you been able to get a TOC dump and decode where it was hung?

> But I had not enough time to investigate further, so it should only be=20=
> considered as a *interesting coincidence* :)

ok.

> I have now installed pa51 on these boxes, so I'll keep checking for=20
> hangs.

Finding the address of where the CPUs are spinning or hung would be good.
BTW, this is with SMP or non-SMP kernels?

grant

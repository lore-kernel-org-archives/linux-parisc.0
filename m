Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D23A2483B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 15:03:35 -0600 (MDT)
Date: Mon, 8 Jul 2002 23:03:32 +0200
Subject: Re: [parisc-linux] 9000/819/K210 
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: Stephan Trajkoff <stephan@itp.bg>,
	parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@dsl2.external.hp.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20020708202732.A04844835@dsl2.external.hp.com>
Message-Id: <294EE282-92B6-11D6-9EA1-0030656F07A2@esiee.fr>
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

Le lundi 8 juillet 2002, =E0 10:27 , Grant Grundler a =E9crit :
>
>> Anyway, I have noticed that on J5k and A500, using the 'normal IO'=20
>> mode=3D20=3D
>> for the SYM53C8XX driver seems to decrease risk of such hangs =
(running
>> 2 setis on both machines and building ISOs on the A500 for about 4=20
>> days,
>> pa46 on both, without hangs,
>
> Did you stop the machine at this point or did it hang?
> ie has anyone seen a hang when sym53c8xx driver was using IO port =
space?
I had to stop the box, no hang, just some kernel upgrade needed...
>
>> where the A500 could only run for about
>> 3 hours is the same conditions with the MMIO mode, 1 day in the =
best=3D20
>> case.)
>
> This really suggests the problem is with disk IO and not compilation.
> And it stinks like a "PCI Posted Write" problem.
yup, also what I thought, though no big knowledge on that topic...
Anyway I'm pretty convinced this is a I/O pb, which seems to be =
confirmed
by the observations Ryan and I made:
all stuck processes are always in 'down_read' or 'down_write' state when
hanging...
>
> Have you been able to get a TOC dump and decode where it was hung?
No, I have just got some 't' SysRq dump (special 't', from Ryan's patch)
Anyway next time it will hang i'll try to dump.
The fact is that hangs i got till now aren't 'deadly' ones in the =
meaning
that I've always been able to reboot the box more or less gently (i.e.
most of the time via 'S.U.B.' SysRqs), that's why I didn't think about=20=

TOC,
because the box wasn't technically *dead*, and I tried to avoid data=20
corruption :)
>
>> I have now installed pa51 on these boxes, so I'll keep checking =
for=3D20
>> hangs.
>
> Finding the address of where the CPUs are spinning or hung would be=20
> good.
Sure. I'm supposed to find this in PDC after a TOC, right ?

> BTW, this is with SMP or non-SMP kernels?
All problems are coming on SMP kernels. I've never seen such hangs on UP
systems (thank God, it would be awful to restart our webserver every=20
day!)

I'm currently stressing a bit a B2000 to confirm that (seti+kernel=20
builds...)


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/

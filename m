Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 434F74830
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 12:14:08 -0600 (MDT)
Date: Mon, 8 Jul 2002 20:14:06 +0200
Subject: Re: [parisc-linux] 9000/819/K210 
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: Stephan Trajkoff <stephan@itp.bg>,
	parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@dsl2.external.hp.com>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20020708163212.4EB2E482B@dsl2.external.hp.com>
Message-Id: <7D78C29C-929E-11D6-9EA1-0030656F07A2@esiee.fr>
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

Le lundi 8 juillet 2002, =E0 06:32 , Grant Grundler a =E9crit :

> Stephan Trajkoff wrote:
>> Hello,
>> TEAM from esiee.fr told me that it is common SMP problem...
>> after heavy compilation, 'w' and 'ps ax' don't work
>
> My a500 has been running -pa52 and iteratively built 88 linux kernels
pa52 ? Well, if you're one step further than everyone, that's kinda=20
cheating :^)
> since yesterday. Both w and ps ax still work. Something else must be
> triggering the problem.
Do you mean that the hangs Ryan and I are studying should be solved by=20=

your changes ?
Anyway, I have noticed that on J5k and A500, using the 'normal IO' mode=20=

for the SYM53C8XX driver
seems to decrease risk of such hangs (running 2 setis on both machines=20=

and building ISOs on the
A500 for about 4 days, pa46 on both, without hangs, where the A500 could=20=

only run for about
3 hours is the same conditions with the MMIO mode, 1 day in the best=20
case.)

But I had not enough time to investigate further, so it should only be=20=

considered as a
*interesting coincidence* :)

I have now installed pa51 on these boxes, so I'll keep checking for=20
hangs.


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/

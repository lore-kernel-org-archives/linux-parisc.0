Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 012D24830
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 12:51:19 -0600 (MDT)
Date: Tue, 2 Jul 2002 20:51:17 +0200
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: parisc-linux@lists.parisc-linux.org
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20020702183558.GO25586@charite.de>
Message-Id: <B1225F09-8DEC-11D6-A95C-0030656F07A2@esiee.fr>
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

Le mardi 2 juillet 2002, =E0 08:35 , Ralf Hildebrandt a =E9crit :

> ok, I checked my kern.log:
>
> The last time the "Gecko-style soft power enabled" turns up in the log
> is today.
>
> But it doesn't work anymore!
> I can "turn off" the machine, but it doesn't halt itself or go down.
I had the same problem on a 712 and a B132.
Though I hadn't time to try again with 712, the simple fact of rebooting=20=

the B132 again made it work.

On another one it work at first shot...

This is quite weird...
>
> I'm running 2.4.18-pa46, it wasn't working with pa42 either, IMHO pa40
> was still working. In pa35 it was definitely still working!
tried -pa45, but no change was made between pa45 and pa46 on that part.
pa42 didn't work either...

It seems that it is related to the changes Helge did in pa42... :)



Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C6F74829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Dec 2002 01:36:37 -0700 (MST)
Date: Thu, 12 Dec 2002 09:36:24 +0100
Subject: Re: [parisc-linux] Re: Solved: Kernel crash when loggin in via ssh
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v548)
Cc: "M. Grabert" <xam@cs.ucc.ie>,
	Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20021212000511.GH19331@tausq.org>
Message-Id: <CC14759C-0DAC-11D7-B504-0030656F07A2@esiee.fr>
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

Le jeudi, 12 d=E9c 2002, =E0 01:05 Europe/Paris, Randolph Chung a =E9crit =
:

>> gcc-3.0_3.0.4-13 produces a working kernel, gcc-3.2-3.2.2-0pre0=20
>> produces
>> a miscompiled kernel (faulty networking, causes kernel crash).
>
> Just to reiterate Dave's point, this is not necessarily a compiler
> problem.
I'm pretty interested to help finding out whether it is or not a=20
compiler problem.

I had the exact same problem that what was mentioned here, a couple of=20=

months ago, with both native and cross compiler (gcc-3.2).
Any attempt to login on the box via network led to a kernel crash.

I'll try to reproduce it to track down where the kernel crashed, since=20=

I don't remember it off hand.

Anyway, I'd be interested in learning what you guys may suspect as=20
other possible cause for this _weird_ behaviour...

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=

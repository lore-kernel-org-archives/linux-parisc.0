Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31ADC486B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Jul 2002 05:02:41 -0600 (MDT)
Date: Wed, 10 Jul 2002 13:02:39 +0200
Subject: Re: [parisc-linux] SMP (in)stability
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: Jeremy Drake <jeremyd@apptechsys.com>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
To: tsbogend@alpha.franken.de
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20020710092420.GA11862@elvis.franken.de>
Message-Id: <8CE455AF-93F4-11D6-BEE2-0030656F07A2@esiee.fr>
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

Le mercredi 10 juillet 2002, =E0 11:24 , Thomas Bogendoerfer a =E9crit :

> On Wed, Jul 10, 2002 at 10:51:09AM +0200, Thibaut VARENE wrote:
>> It also seems to me (though i cannot confirm atm) that the 'PIO mode'=20=

>> in
>> SYM53C8XX driver improves stability.
>
> I always use sym-2 now, because I had this strange harddisk slow down=20=

> problem
> with the old sym driver. That might be worth a try, too.
Well, we were using sym-2 on A500 before switching to sym-1, and at that=20=

time it
used to hang very often...

By the way, if you want to take a look at what I reported to Ryan when=20=

hangs
occured (SysRq 't', Ryan modified), take a look at:
http://pateam.esiee.fr/archive/mails/

and read the *SMPHangReport* files...

HTH,


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/

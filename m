Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id F28A7483E
	for <parisc-linux@parisc-linux.org>; Mon,  3 Nov 2003 10:00:02 -0700 (MST)
Message-ID: <3FA68990.4030803@gmx.at>
Date: Mon, 03 Nov 2003 18:00:00 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Jean-marc Harang <jean-marc.harang@laposte.net>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Console on HP 9000 E55
References: <20031101200941.5c474aba.jean-marc.harang@laposte.net>	<200311011959.hA1Jxxi29314@opus.allegro.com> <20031101223409.44119ba9.jean-marc.harang@laposte.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hello,

I think, you miss an important thing !

I also have an E55 with an MDP panel, the thing having 8xDB25 ports
(8x RS232). This MDP panel has a 9-pin connector as connection to the
E55. So this 9-pin connector seems to be a "high"-speed bus for all
8 serial ports !

So you really need a MDP or DDP panel to connect the up to 16 serial
ports.

I do not know another way ....

BTW, how do you boot the HP-UX ?
Blind ?
Only use is per telnet/rsh after it is up ?

Christoph Plattner



Jean-marc Harang wrote:
> Le Sat, 1 Nov 2003 11:59:59 -0800 (PST)
> Stan Sieler <sieler@allegro.com> a écrit:
> 
> 
>>Hi,
>>
>>What card on the HP 9000/E35 are you trying to use with a console port?
>>(And, which connector (and: male/female, round or 9 pin or 25 pin or ?))
>>
>>(I know the questions may be obvious to you, but there are several 
>>possibilities ... knowing which you're trying to do may help me answer you.)
>>
>>
>>>Up to now, the server successfully boots on the original HP-UX. But we have
>>>no access to any console on MDP 9-pin DB9. The other connector called DDP is
>>>not equiped with the patch panel :/. 
>>
>>Yes, I've got an E35 here (running HP-UX).
>>
> 
> 
> I use the APMUX port (the only one on the E55 I/O board), with the cable ref
> A1703-63009. At one end with high-density connector for APMUX and at the other
> ends one DB9 called MDP and something like big centronics called DDP (for the
> patch panel i don't own). So i try the MDP port without result.
> 
> Thanks
> 
> A+
> jm. Harang
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 



-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel11.hp.com (palrel11.hp.com [156.153.255.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B7C04855
	for <parisc-linux@lists.parisc-linux.org>; Sun,  7 Jul 2002 20:52:33 -0600 (MDT)
To: Giles Gamon <giles@High-Availability.com>
Cc: icab@High-Availability.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: Your message of "Wed, 03 Jul 2002 20:09:36 -0000."
             <5.1.0.14.2.20020703193823.04487c80@mail.AlphaStack.com>
References: <5.1.0.14.2.20020703193823.04487c80@mail.AlphaStack.com> 
Date: Sun, 07 Jul 2002 19:52:28 -0700
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <20020708025228.4822012C73@debian.cup.hp.com>
Subject: [parisc-linux] Re: HP SCSI Multi-Initator issue
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

Giles Gamon wrote:
...
> I read your posting (including source code with great interest);
> http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2002-January/030292.
>   html
...

> HP have (probably for commercial reasons) removed the easy way of changing 
> the host adapters SCSI ID.

No. You can change it from firmware prompt on most parisc machines.
interrupt the boot process and on newer machines one can enter "co" to
get to the configuration menu.

> The SCSI INITIATOR ID is stored in a motherboard NVRAM (or similar) and 
> loaded by the motherboard BIOS, the OS then loads and uses it but has no 
> way of changing it.

That's correct.
Firmware folks don't like OS writing stuff in their space.

> Are you aware of any potential dangers if we should want to switch back to 
> running HP-UX, i.e. would need changing back or checksums on the memory?

PDC doesn't care which OS is running.
You should be able to just install HPUX and everything
should work normally. AFAIK, Installing HPUX will only change the
primary boot path that is stored NVRAM (using PDC calls, not by
directly writing it).

grant

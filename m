Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B4B5482D
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 23:24:17 -0600 (MDT)
Received: from postamt1.charite.de (postamt1.charite.de [193.175.66.246])
	by hauptpostamt.charite.de (Postfix) with ESMTP id 282F015C01E
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Jul 2002 07:24:16 +0200 (CEST)
Date: Wed, 3 Jul 2002 07:24:15 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore
Message-ID: <20020703052415.GB32490@charite.de>
References: <20020702183558.GO25586@charite.de> <B1225F09-8DEC-11D6-A95C-0030656F07A2@esiee.fr> <20020702185708.GP25586@charite.de> <20020702190606.GA3678@systemhalted> <20020702190842.GR25586@charite.de> <20020702192147.GC3678@systemhalted> <20020702193116.GU25586@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020702193116.GU25586@charite.de>
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

Am 02.07.2002 um 21:31:16 +0200 schrieb Ralf Hildebrandt folgendes:

> > # gcc -v
> 
> 3.0.4
> 
> > # ld -v
> 
> 2.12.90.0.9 20020526 
> 
> > --- ./arch/parisc/kernel/power.c     Tue Jul  2 15:17:59 2002
> > +++ ./arch/parisc/kernel/power.c     Tue Jul  2 15:18:12 2002
> 
> Rebuilding now. Yawn.

I rebooted that kernel. No output if I press the power switch.
I checked /proc/sys/kernel/power, it's set to 1

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Stupid idea: Putting diesel fuel in a gasoline car.
             Substituting corn oil for milk in recipes.
             Attempting to secure a Windows system.

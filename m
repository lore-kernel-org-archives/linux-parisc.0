Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8CBAD4872
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Jul 2002 01:54:02 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore
Date: Wed, 3 Jul 2002 09:52:55 +0200
References: <20020702183558.GO25586@charite.de> <20020702193116.GU25586@charite.de> <20020703052415.GB32490@charite.de>
In-Reply-To: <20020703052415.GB32490@charite.de>
MIME-Version: 1.0
Message-Id: <200207030952.55185.helge.deller@sap.com>
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

On Wednesday 03 July 2002 07:24, Ralf Hildebrandt wrote:
> Am 02.07.2002 um 21:31:16 +0200 schrieb Ralf Hildebrandt folgendes:
> > > # gcc -v
> >
> > 3.0.4
> >
> > > # ld -v
> >
> > 2.12.90.0.9 20020526
> >
> > > --- ./arch/parisc/kernel/power.c     Tue Jul  2 15:17:59 2002
> > > +++ ./arch/parisc/kernel/power.c     Tue Jul  2 15:18:12 2002
> >
> > Rebuilding now. Yawn.
>
> I rebooted that kernel. No output if I press the power switch.
> I checked /proc/sys/kernel/power, it's set to 1

Hi Ralf,

are you really using the new kernel ?
The one from CVS, built with "make palo" ?
What does "uname -a" says ?

I have no problems on my 715/64 (which also uses the gecko-style mode)
and c3000, so I really wonder why you suddenly get problems.

Greetings,
Helge

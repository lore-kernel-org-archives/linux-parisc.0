Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D8FE482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Nov 2001 10:10:45 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "Pedot, Wolfgang" <wpedot@harris.com>
Subject: Re: [parisc-linux] 2.4.14 and ISA-NE2000 StackDump
Date: Tue, 20 Nov 2001 18:10:41 +0100
Cc: "'Parisc Linux Mailinglist'" <parisc-linux@lists.parisc-linux.org>
References: <8D4C69676E66D511A1CB00508BBBB1921627EE@ranmx1.ran.harris.com>
In-Reply-To: <8D4C69676E66D511A1CB00508BBBB1921627EE@ranmx1.ran.harris.com>
MIME-Version: 1.0
Message-Id: <E166EPy-0004Bn-00@linuxlab.wdf.sap-ag.de>
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

Hi Wolfgang,

No, the 715/64 has a PA7100LC processor and thus is 32bit only machine.
I'm running a 32bit kernel too, but maybe 715/old (as yours) and 715/new
machines (as mine) work different. IIRC the 715/old has an ASP and the
715/new have a LASI chip. Maybe you could send me your whole dmsg
and I'll take a look again.

Greetings,
Helge

On Tuesday 20 November 2001 17:57, Pedot, Wolfgang wrote:
> Well, you´ve got a 64Bit-Kernel and i run a 32bit Kernel on my 715/75.
>
> I just tested with 2.4.4-pa7 and got the same effect...
>
> greetings
> Wolfgang
>
> > -----Original Message-----
> > From:	Helge Deller [SMTP:deller@gmx.de]
> > Sent:	Monday, November 19, 2001 7:52 PM
> > To:	Pedot, Wolfgang; 'Parisc Linux Mailinglist'
> > Subject:	Re: [parisc-linux] 2.4.14 and ISA-NE2000 StackDump
> >
> > Hi Wolfgang,
> >
> > I've no problems here with my ISA NE2000 and kernel 2.4.14-pa7:
> >
> > NE*000 ethercard probe at 0x340: 08 00 00 50 11 13
> > eth0: NE2000 found at 0x340, using IRQ 10.
> >
> > pa64:~# uname -a
> > Linux pa64 2.4.14-pa7 #2 Mon Nov 19 19:43:37 CET 2001 parisc unknown
> >
> > pa64:~# cat /proc/interrupts
> >  IRQ      count         Region    ISR
> >  10:       2346            EISA  NE2000
> >
> > Sadly I've no idea why it doesn't work for you...
> >
> > Greetings,
> > Helge
> >
> > On Monday 19 November 2001 15:16, Pedot, Wolfgang wrote:
> > > Hi,
> > >
> > > I just tried to update to 2.4.14-pa6 and noticed a stackdump during
> > > initialisation of my old NE2000 ISA-Nic which works fine using the last
> > > 2.4.9 Kernel. After this stackdump i booted (reset used) 2.4.9 again
> > > and the machine hung without any message druring initialistaion of the
> > > NE2000 (right after "NE*000 ethercard probe at 0x300:"). I had to
> > > power-cycle the machine to make it work again.
> > >
> > > Heres the log-message:
> > >
> > > Last modified Nov 1, 2000 by Paul Gortmaker
> > > NE*000 ethercard probe at 0x300:WARNING! Stack pointer and cr30 do not
> > > correspond!
> > >
> > > Bad Address (null pointer deref?): Code=6 regs=100fe380 (Addr=50412d43)
> > >
> > > any hints?
> > > Are there any guys arround here which made their ne2000 work with
> > > 2.4.14? greetings
> > >
> > > Wolfgang Pedot

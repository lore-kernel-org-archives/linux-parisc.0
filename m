Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id D03DF4829
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 01:26:18 -0600 (MDT)
Date: Wed, 28 Apr 2004 08:26:09 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Linux-2.6.6-rc1-pa3 and Linux-2.6.6-rc2
In-Reply-To: <Pine.LNX.4.58.0404270915440.4406@sal.ucc.ie>
Message-ID: <Pine.LNX.4.58.0404280814210.7455@sal.ucc.ie>
References: <408D436000000590@ocpmta1.freegates.net>
	<Pine.LNX.4.58.0404270915440.4406@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 27 Apr 2004, M. Grabert wrote:

> On Tue, 27 Apr 2004, Joel Soete wrote:
>
> > > and also the same symptoms as before (network is working normal, USB
> > > keyboard/mouse don't work). If you respond fast what commands I should
> > > run, I can give you more info ...
> >
> > hmm usb and ide seems to be on the same superio.

I found a (temporary) solution to my problem. At least I haven't
experienced any problems with the serial console lately.

BTW, the same happened also with a 2.4.26 kernel, so it's not only 2.6
related.

It appears that superio gets confused by my additional USB(2.0) PCI card
in my C3000. Whenever keyboard/mouse was plugged into the onboard USB
ports, simultaneous access to the IDE drive, keyboard and mouse could
cause a lock (and therefore neither USB, IDE and serial console were
working).

I resolved the issue by simply attaching the USB keyboard/mouse to my
USB PCI card. So far I hadn't any problems ....


BTW, using a Voodoo2 and a 2.6 kernel is not as stable as with 2.4.
Some XF86Config options can cause a crash (e.g "DontVTSwitch=true")
on 2.6.6-rc1-pa3, but not on 2.4.26-pa1 ...


greettings,
  Max

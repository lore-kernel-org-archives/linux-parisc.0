Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 90BA5482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Jul 2003 14:13:27 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] stifb
Date: Wed, 2 Jul 2003 22:13:57 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <3ED70CF10000CBA7@ocpmta2.freegates.net>
In-Reply-To: <3ED70CF10000CBA7@ocpmta2.freegates.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200307022213.58129.deller@gmx.de>
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

On Wednesday 02 July 2003 08:45, Joel Soete wrote:
> Hi Helge,
>
> > > I notice some improvement of your stifb in 2.5 (module support). Do you
> > > think feasible the backport to 2.4?
> >
> > OTOMH I think it doesn't make sense to backport them.
>
> Because 2.6 will be release soon?

No.
The console code in 2.5.x has a lot of changes which
make modularization possible. This is mostly not available in 2.4.x,
thus backporting makes not that much sense.

> > Anyway, I'll take a look at it soon again.
>
> Thanks but don't spend too much time on this (I would simply know if,
> according your opinion, it exists some major issue which avoid to do it).

Ok.

Helge

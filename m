Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0860482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Dec 2001 11:32:59 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Newbie to risc 
In-Reply-To: Message from Jan-Benedict Glaw <jbglaw@lug-owl.de>
   of "Tue, 18 Dec 2001 12:37:46 +0100." <20011218123746.E2461@lug-owl.de>
References: <1008674922.25986.4.camel@rotapile>  <20011218123746.E2461@lug-owl.de> 
Date: Tue, 18 Dec 2001 11:32:59 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011218183259.E0860482A@dsl2.external.hp.com>
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

Jan-Benedict Glaw wrote:
> On Tue, 2001-12-18 21:28:42 +1000, robert stanford <rob@rotapile.com>
> wrote in message <1008674922.25986.4.camel@rotapile>:
> > Hi everybody,
> >         Just got a HP K class 9000 series  with dual 240Mhz PA-RISC 8200
> > processors,32 serial ports, 24 scsi drives, 6 ups's, dat drive  and fast
> > wide diff scsi tape drive  in a 2 m case. Electrician comes over
> 
> *plonk*

Jan,
If that was you falling over, that's about right.
But dropping a K-class would be a bit louder ;^)

Robert,
K-class is only partially supported.
serial ports you probably can forget.
Anything connected via HP-PB slot (aka NIO) doesn't work either.
Search the mail archives (lists.parisc-linux.org) for "K-class"
for hints on getting a K-class booted.

grant

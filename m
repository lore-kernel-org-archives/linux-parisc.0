Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA02848
	for <parisc-linux@puffin.external.hp.com>; Tue, 18 Jul 2000 07:10:32 -0600
Received: from ottawa.linuxcare.com (HELO vodka.thepuffingroup.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 18 Jul 2000 13:12:13 -0000
Date: Tue, 18 Jul 2000 08:06:51 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Ville Herva <vherva@mail.niksula.cs.hut.fi>
Cc: linux-kernel@vger.rutgers.edu, parisc-linux@thepuffingroup.com
Subject: Re: Help Apollo serie 700
Message-ID: <20000718080651.C3150@vodka.thepuffingroup.com>
References: <39733B8F.9311D5C3@prescom.fr> <20000717163745.A3150@vodka.thepuffingroup.com> <20000718085033.E800@niksula.cs.hut.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000718085033.E800@niksula.cs.hut.fi>; from Ville Herva on Tue, Jul 18, 2000 at 08:50:33AM +0300
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 18, 2000 at 08:50:33AM +0300, Ville Herva wrote:
> On Mon, Jul 17, 2000 at 04:37:45PM -0400, you [Matthew Wilcox] claimed:
> > On Mon, Jul 17, 2000 at 06:59:59PM +0200, fbarthe@prescom.fr wrote:
> > 
> > > Any distribution including thid version of kernel ?
> > 
> > not yet.  we're working towards having debian/parisc available as soon as
> > possible.
> 
> How far is that anyway? What short of expertice would you say is needed to
> play with linux/pa-risc today? The Puffin Group status page wasn't too
> verbose when I last cheched. (A friend of mine has a couple of 7xx's that
> are currently doing nothing useful...)

we have a cross toolchain working; most of the fileutils, textutils,
shellutils packages, fdisk, e2fsprogs, mount, and probably a few other
random programs.  yesterday, we found out why native gcc was crashing
the kernel; today we're trying to figure out why it still doesn't work
now that this bug is kludged around.

you need to be confident at compiling things and be able to track down
what's gone wrong when things don't compile in order to be useful at
this time.

i'm fiddling with the website right now and i'll see what i can do in
the way of clarity.  constructive criticism welcomed.

-- 
The Sex Pistols were revolutionaries.  The Bay City Rollers weren't.

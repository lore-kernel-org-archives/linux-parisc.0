Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 679BB4843
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 May 2002 16:43:50 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Zibing Yang <email2bing@yahoo.com>,
	Jeremy Drake <jeremyd@apptechsys.com>
Subject: Re: [parisc-linux] Can I run popular Linux software on parisc-linux?
Date: Tue, 28 May 2002 00:43:09 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <20020527215905.77842.qmail@web21201.mail.yahoo.com>
In-Reply-To: <20020527215905.77842.qmail@web21201.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200205280043.09939.deller@gmx.de>
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

On Monday 27 May 2002 23:59, Zibing Yang wrote:
> --- Jeremy Drake <jeremyd@apptechsys.com> wrote:
> > On Mon, 27 May 2002, Zibing Yang wrote:
> > > > > I'm not aware of anyone trying to run an IA32
> > > >
> > > > emulator on parisc-linux.
> > > >
> > > > fyi, bochs compiled from CVS sources (with small
> > > > modifications) worked
> > > > for me.
> > >
> > > Helge, can you provide more information about your
> > > computer running Bochs? Are you able to run, for
> > > example, windows 98, install stardard
> >
> > windows-based
> >
> > > softwares? How's the speed compared to the same
> > > software run on PC+windows? Why didn't use wine?
> > > I am still heavily relying on windows-based
> >
> > software
> >
> > > everyday, so would love to install a
> >
> > windows-emulator
> >
> > > on my hp workstation.
> > > Thanks a lot.
> > > zibing
> >
> > I also tried bochs on my parisc machine.  It works
> > ok, although slow.  I
> > installed NT 4 in it.  I had a few problems, but I
> > was able to work around
> > them.
> >
> > The reason that wine won't work is that wine is just
> > a windows system call
> > emulator.  The program executes on the cpu, and I'm
> > sure that none of your
> > windows programs will run on a parisc cpu :)
>
> How about plex86? 

Quote from the plex86 homepage (http://savannah.gnu.org/projects/plex86):
"Note:If you want to run IA-32 on a non-IA-32 architecture, then bochs is the project that you want to checkout--look for them over at SourceForge."

> Plex 86, bochs and wine are all listed on
> http://packages.debian.org/testing/allpackages.html.
> I am confused because I thought all packages listed
> there ought to work with parisc.

No, it's just a collection of _all_ source packages available.
Not all will run on any platform, e.g. there's normally no reason to get lilo for PA-RISC,
where you have to use the palo bootloader.

Last time I tried bochs was ~ 4 months back. I used it on a C3000 (400 MHz PA 2.0 CPU, UP)
and if it's speed was comparable as an 486 class CPU -iirc.

Greetings,
Helge

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viemta06.chello.at (viemta06.chello.at [195.34.133.56])
	by dsl2.external.hp.com (Postfix) with ESMTP id 234F1482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 15:12:54 -0600 (MDT)
Sender: chris@dsl2.external.hp.com
Message-ID: <3AD225CF.1AF048F1@dot.at>
Date: Mon, 09 Apr 2001 23:12:47 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Many experience done on 720, but `init' fails !!
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com>
	 <3AC973D3.F1453A4C@alcatel.at> <20010403223441.A11435@parcelfarce.linux.theplanet.co.uk> <3ACAC867.25327463@alcatel.at> <20010404180518.C11435@parcelfarce.linux.theplanet.co.uk>  <3AD09AFB.EBDFF975@dot.at> <20010409205209.2FF0437CDB@carmen.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hello !

Matt Taggart wrote:
> 
> Christoph Plattner writes...
> 
> > SO I build sash, a also build a bash (shared and static !), I build
> > fileutils, text-utils, shell-utils, etc, etc.....
> > The system boots with bash and I can mount, run programs, etc....
> 
> Good.
> 
> > The I build "my own" startup stuff. A /sbin/init.d/xxx , etc/rc.d/xxx
> > and so on. I also build a sysvinit-2.78 (and 2.77 before), but the
> > `init' has it's problems. The error message is:
> 
> Make sure you don't have multiple init's. The kernel will look in several
> places and I don't remember what order it looks in. If you only have one then
> that's the only one it can find :)

I have only one init. But this is not a problem haveing more than one.
In the linux kernel it is very simply to have a "source look"
(init/main.c
bottom of the file). The kernel tries to exec /sbin/init. Only if the
exec fails
(cannot open, load, execute) then the next thing is tried. But if the
init has
a problem later on (faults, execptions, etc)the kernel does not try
other entries.

My problem is in another point. The `init' is also responsible to start
kernel
built-in processes (like kernel threads). They are AFAIK compiled in the
kernel,
the init process only starts and supervise (or only starts) them. With
the command
`ps' those processes are named with `[', `]', like the NFS daemon
`[nfsd]'.
Those procresses have very low pids (2,3,....). So I have to analyse the
code,
what pid=9 will become ? The break happens here !

> 
> Are you still having problems with the init in the base tarball? Is it
> important to you to build your own init? If it is reply privately and maybe I
> can help.

I read from this tarball in thr mailing list.
Is this a new root file system ?
How can I use it.
I have no debian experence, up to now I only had Redhat and formerly
Suse.
Do I need special knowledge ?

It is a hobby of mine, to build everything myself. I `dream' from a
source
directory, where I can say `make install' and a whole Linux is the
result,
of course for very small distribution of embeded Linux or firewall
stuff.
In my private sparetime, "small & embedded" Linux is my hobby and the HP
stuff and HP workstation is for me a perfect
cross-build-lerning-equipment.

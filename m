Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] dump driver for parisc-linux: patch vs CVS 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Tue, 05 Feb 2002 08:53:34 +0100." <3C5F8F7E.D1956DF0@admin.france.hp.com>
References: <3C5E768A.573CC5A2@admin.france.hp.com> <20020204174039.DAF3B482A@dsl2.external.hp.com>  <3C5F8F7E.D1956DF0@admin.france.hp.com> 
Date: Wed, 06 Feb 2002 00:32:06 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020206073206.153B1482A@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> 	Hi.
> So my work for the next few days will to create a patch
> of all my modification for the latest CVS bits (so you will
> have only the modifications). But I'll send it to which people ?

1) Send "cvs diff" output to this list
2) Use ".cvsrc" from build-tools/ repository
  ("diff -uNp" is key here)
3) If the diff is more than 100-200 lines, post a URL instead

I think I, tausq, ESIEE, willy should review/try it.

> Grant Grundler wrote:
> > As Randolph noted, we need to see the diff and what was changed
> > in the generic kernel. Is the kernel and user space code GPL?
> 
> Everything is under GPL, even the code coming from SGI. I leave
> all informations about the SGI code and the header of all their files.

Ok. You might also want to put a URL of your tarball of programs...perhaps
some debian types on debian-hppa would be interested in creating
a debian package of those.

> But I've modified the code to handle specific needs for p4.
> I'm
> also currently added code to handle multiple dump device. And I've also
> the project to dump only kernel space and not user space.

Cool! if you could keep those changes seperate for now...that
might make life easier in case we want to send those changes
back "upstream" (to SGI I assume).

> > > ./init/main.c
> > > ./kernel/ksyms.c
> > > ./kernel/panic.c
> > > ./kernel/sched.c
> > 
> > The last four might cause trouble....

> I know, I can try to put kernel/ksyms.c to arch/parisc/kernel/parisc_ksyms.c
> but it can break the code for ia64 and other architecture. but for the other
> it is not possible: panic (call to dump), sched.c (another call to dump), 
> main.c (init of dump). I've also an IA64 box where I can do test, so I've als
>   o
> the project to do it working on it (lots of project :-).

heh...if you know it will break another arch, leave it alone.

> I defenitly think that it is a really needed feature (I'm working perhaps 
> since a too long time in support center :-).

Even folks outside the support center think it's a good idea.

...
> My main probleme is to have a up to date code, because I have to follow
> each modification and redo the merge each time I want to update my CVS.
> I agree that I need to add comments in my code, but before going further
> I prefer to know if this code will stay a "patch" or not.

I can't promise anything. You know what I want.
Comments/guidance from Alan Cox and/or Matthew Wilcox would be good here.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] dump driver for parisc-linux: patch vs CVS 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Mon, 04 Feb 2002 12:54:50 +0100." <3C5E768A.573CC5A2@admin.france.hp.com>
References: <3C5E768A.573CC5A2@admin.france.hp.com> 
Date: Mon, 04 Feb 2002 10:40:39 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020204174039.DAF3B482A@dsl2.external.hp.com>
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
> I've a dump driver available for 2.4.17-pa3 and I'll
> upgrade my source to latest CVS bits and redo the 
> modifications. But do you think it is possible to
> put in the CVS these modifications ? 


As Randolph noted, we need to see the diff and what was changed
in the generic kernel. Is the kernel and user space code GPL?

> I have modified:
> ./Makefile 
> ./arch/parisc/config.in
> ./arch/parisc/kernel/traps.c
> ./arch/parisc/mm/init.c
> ./drivers/Makefile 
> ./drivers/char/sysrq.c
> ./init/main.c
> ./kernel/ksyms.c
> ./kernel/panic.c
> ./kernel/sched.c

The last four might cause trouble....

> 
> And I've added:
> ./include/linux/dump.h 
> ./drivers/dump/Makefile
> ./drivers/dump/dump_base.c
> ./drivers/dump/dump_rle.c
> ./drivers/dump/dump_parisc.c

and we need to ask 2.4 maintainer if this can be added upstream too...

> So my question: 
> -Do you think it is a good idea to have a dump driver available 
> in the standart kernel ?

I do. But it's really up to linus/et al to decide that.
I can choose to commit this code to *our* tree (parisc-linux) only.
(and that's really not just my decision - need some consensus)

> -If yes, who is able to do the code review, and put this dump 
> module in the CVS ?

Ideally, I'd like to see outstanding non-arch code changes merged
upstream first..  Otherwise, I don't mind maintaining that code in our tree.

thanks!
grant

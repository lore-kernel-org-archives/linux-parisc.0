Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] HPMC while doing iodc INIT_MOD 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Thu, 10 Oct 2002 17:29:34 +0200." <3DA59CDE.AA99ACE1@admin.france.hp.com>
References: <3DA59CDE.AA99ACE1@admin.france.hp.com> 
Date: Thu, 10 Oct 2002 09:52:12 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021010155212.E5F2D4829@dsl2.external.hp.com>
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
> I've read that while doing iodc INIT it can produce interrupt.
> but interruption are not disable in my case, so do you think I need to
> disable all interruption, and how ?

While IODC doesn't *use* interrupts (it polls), I guess IODC could
generate interrupts.  Normally I'd expect the IO_RESET_AND_CLEAR to
reset all IOSAPICs and thus disable IO interrupts.

I'm also wondering how this would work on an SMP machine. We would
need to "capture" all the CPUs and set the EIEM in each one.

You probably want to see how HPUX is handling this instead of
"re-inventing" it.

Can you make a patch available that we can review?
I'm happy to host that on gsyprf10 thought ftp.p-l.o/patches
would be the "right" place.

thanks,
grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep04-mail.bloor.is.net.cable.rogers.com (fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6157B4868
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Apr 2003 18:30:13 -0600 (MDT)
Date: Tue, 29 Apr 2003 20:31:06 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: "Boehm, Hans" <hans_boehm@hp.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
Message-ID: <20030430003106.GC12492@systemhalted>
References: <75A9FEBA25015040A761C1F74975667D01442066@hplex4.hpl.hp.com> <20030429213027.GB12492@systemhalted> <20030429221357.GD17313@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030429221357.GD17313@dsl2.external.hp.com>
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

g,

> no - he's using:
> grundler@debian:~$ uname -a
> Linux debian 2.4.20-pa28 #39 Wed Mar 12 19:24:25 PST 2003 parisc unknown
> unknown GNU/Linux

Perfect.
 
> It's possible the kernel-headers he's using aren't clean.
> Just in case, can you tell me which ones he should be using?

/usr/inlcude/asm/sigcontext.h should define it to be:

/* We will add more stuff here as it becomes necessary, until we know
   it works. */
struct sigcontext {
        unsigned long sc_flags;
        unsigned long sc_gr[32]; /* PSW in sc_gr[0] */
        unsigned long long sc_fr[32]; /* FIXME, do we need other state info? */
        unsigned long sc_iasq[2];
        unsigned long sc_iaoq[2];
        unsigned long sc_sar; /* cr11 */
};

Which is used to define an identical mcontext.

> ii  libc6          2.3.1-16       GNU C Library: Shared libraries and Timezone
> ii  libc6-dev      2.3.1-16       GNU C Library: Development Libraries and Hea

Perfect.

> I'm ok with updating to -17 if you promise it won't do evil things
> to my box. ;^)

Don't touch -17, the _Unwind_Find_FDE code broke and it's doing damage
to things like 'vi' ... *sigh* I haven't even looked into this (looks
like gcc/glibc clashes again).

c.

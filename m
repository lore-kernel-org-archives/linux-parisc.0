Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18214486C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Apr 2003 18:52:24 -0600 (MDT)
Message-ID: <75A9FEBA25015040A761C1F74975667D0144206A@hplex4.hpl.hp.com>
From: "Boehm, Hans" <hans_boehm@hp.com>
To: "'Carlos O'Donell'" <carlos@baldric.uwo.ca>,
	Grant Grundler <grundler@parisc-linux.org>
Cc: "Boehm, Hans" <hans_boehm@hp.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Program counter from sigcontext, constructurs
	and -fPIC
Date: Tue, 29 Apr 2003 17:52:14 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

The struct sigcontext seems to match the declarations I'm seeing and what dbx is seeing.

I think you should be able to reproduce the problem fairly simply by:

1) Downloading http://www.hpl.hp.com/personal/Hans_Boehm/qprof/qprof-0.2.tar.gz
2) Unpacking
3) "make qprof_test" with a recent gcc; this should only take a few seconds.  This doesn't use much of the source code, or uses it in only trivial ways.
4) gdb ./qprof_test
5) break PROF_pc_sample_list_handler; run
6) Look at the handler arguments, particularly the third one.

The corresponding sigaction call is also in prof_utils.c, the same file that contains the above function.  All of the relevant code is either in prof_utils.c and prof_main.c.

(If everything worked, this would report PC samples that are off by 3, since it doesn't contain the privilege level fix.)

Hans

> -----Original Message-----
> From: Carlos O'Donell [mailto:carlos@baldric.uwo.ca]
> Sent: Tuesday, April 29, 2003 5:31 PM
> To: Grant Grundler
> Cc: Boehm, Hans; 'parisc-linux@lists.parisc-linux.org'
> Subject: Re: [parisc-linux] Program counter from sigcontext,
> constructurs and -fPIC
> 
> 
> 
> g,
> 
> > no - he's using:
> > grundler@debian:~$ uname -a
> > Linux debian 2.4.20-pa28 #39 Wed Mar 12 19:24:25 PST 2003 
> parisc unknown
> > unknown GNU/Linux
> 
> Perfect.
>  
> > It's possible the kernel-headers he's using aren't clean.
> > Just in case, can you tell me which ones he should be using?
> 
> /usr/inlcude/asm/sigcontext.h should define it to be:
> 
> /* We will add more stuff here as it becomes necessary, until we know
>    it works. */
> struct sigcontext {
>         unsigned long sc_flags;
>         unsigned long sc_gr[32]; /* PSW in sc_gr[0] */
>         unsigned long long sc_fr[32]; /* FIXME, do we need 
> other state info? */
>         unsigned long sc_iasq[2];
>         unsigned long sc_iaoq[2];
>         unsigned long sc_sar; /* cr11 */
> };
> 
> Which is used to define an identical mcontext.
> 
> > ii  libc6          2.3.1-16       GNU C Library: Shared 
> libraries and Timezone
> > ii  libc6-dev      2.3.1-16       GNU C Library: 
> Development Libraries and Hea
> 
> Perfect.
> 
> > I'm ok with updating to -17 if you promise it won't do evil things
> > to my box. ;^)
> 
> Don't touch -17, the _Unwind_Find_FDE code broke and it's doing damage
> to things like 'vi' ... *sigh* I haven't even looked into this (looks
> like gcc/glibc clashes again).
> 
> c.
> 

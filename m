Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: H_Aue@t-online.de (Hinrich Aue)
Cc: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe 
In-Reply-To: Message from H_Aue@t-online.de (Hinrich Aue)
   of "Sat, 29 Dec 2001 13:23:44 +0100." <16KITV-0dMC0GC@fwd05.sul.t-online.com>
References: <20011228124334.96741.qmail@web21207.mail.yahoo.com> <20011229050103.54069482A@dsl2.external.hp.com>  <16KITV-0dMC0GC@fwd05.sul.t-online.com> 
Date: Sat, 29 Dec 2001 14:31:47 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011229213147.EA050482A@dsl2.external.hp.com>
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

Hinrich Aue wrote:
> Yes, I found no logging in syslog. I'm not used to kernel stuff, (2. 
> semester) but the stackdump looked familiar. And after all, it happens when I
> start pppd with async ppp. If I don't activate async ppp It don't crashes, 
> but it don't work.  That was a problem first when I tried to use DSL. After I 
> activated async ppp the machine crashes at the start of pppd.

Ok. That sounds similar.

> I also tried the latest CVS kernel Verison (pa27).
> I would like to dig in that stuff, but I don't know where to start and have 
> too little experience.

There must be some kernel beginners guid some place...perhaps this
is the start of one for parisc:
1) collect console output from a serial console. Or type in by hand
   panic/crash reason, GR02, IOAQ, and IIR registers for starters.
   Note machine model, PDC firmware rev too.

2) get "a.c" and "astk" from CVS
	http://cvs.parisc-linux.org/~checkout~/build-tools/

3) use "a" to lookup up symbols names in your matching System.map.
   Feed the stack dump to "astk" to get a rough idea of what was
   on the stack. parisc stack grows upward - higher addresses are the
   "top" of the stack - some of the addresses are residual junk.
   Look at the source code to see which functions are really being called.

4) keep notes!
   which kernel versionso, which symtoms, local changes you've made.

5) search the parisc-linux mail archive for "stack dump" or "trap 15"
   (or whatever the panic output is or kernel symbols associated
   with it).

6) post questions to parisc-linux when you get stuck.

hth,
grant

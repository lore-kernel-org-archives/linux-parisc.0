Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32E4D486A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 13:21:46 -0600 (MDT)
Date: Tue, 2 Jul 2002 15:21:47 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: Thibaut VARENE <varenet@esiee.fr>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore
Message-ID: <20020702192147.GC3678@systemhalted>
References: <20020702183558.GO25586@charite.de> <B1225F09-8DEC-11D6-A95C-0030656F07A2@esiee.fr> <20020702185708.GP25586@charite.de> <20020702190606.GA3678@systemhalted> <20020702190842.GR25586@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020702190842.GR25586@charite.de>
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

> > Okie. Time to ask questions.
> > What toolchain did you use to build your kernel?
> 
> Toolchain?
> I'm running Debian unstable on the box and built it directly on the
> box, using make-kpkg (as usual)
> 

Excellent. This means you are using the toolchain provided
by debian (and not rolling your own... some of us are doing this
and I wanted to clarify your position).

I'm not running any PARISC boxes in unstable (although I'm going
to so I can test stuff like this)... so could you tell me the 
version of your compilier and linker?

# gcc -v
# ld -v

Things can and will go wrong... but debugging info always helps :)
Trying to segregate toolchain issues is going to be my new quest.

As Willy said "I'm so happy to see someone interested in toolchain
work!" ;)

If you could apply the following patch and test your power button
again:

--- ./arch/parisc/kernel/power.c     Tue Jul  2 15:17:59 2002
+++ ./arch/parisc/kernel/power.c     Tue Jul  2 15:18:12 2002
@@ -55,6 +55,7 @@
 #include <asm/led.h>
 #include <asm/uaccess.h>

+#define DEBUG

 #ifdef DEBUG
 # define DPRINTK(x) printk x

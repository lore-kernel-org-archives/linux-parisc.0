Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tlaloc.n0ano.com (unknown [192.216.249.93])
	by dsl2.external.hp.com (Postfix) with ESMTP id 688D5482A
	for <parisc-linux@parisc-linux.org>; Wed, 26 Mar 2003 09:15:37 -0700 (MST)
From: n0ano@n0ano.com
Date: Wed, 26 Mar 2003 09:25:35 -0700
To: Markus Schaber <markus.schaber@student.uni-ulm.de>
Cc: Matthieu Delahaye <m.delahaye@esiee.fr>, davidm@hpl.hp.com,
	willy@debian.org, adriano@satec.es, linux-ia64@linuxia64.org,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: [Linux-ia64] Linux, Itanium and PA/RISC
Message-ID: <20030326162535.GL873@tlaloc.n0ano.com>
References: <001f01c2f1f1$e772d4b0$6620a4d5@tsatec.int> <20030324121037.GI31008@parcelfarce.linux.theplanet.co.uk> <15999.23084.647629.868320@napali.hpl.hp.com> <20030326100746.GA21703@charrue.esiee.fr> <20030326125140.6f2b7f7c.markus.schaber@student.uni-ulm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030326125140.6f2b7f7c.markus.schaber@student.uni-ulm.de>
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

Well, Itanium's can sort of run any X86 software.

As David was alluding to there are two ways you can boot an Itanium
box, either with an IA32 kernel (a current Pentium based OS) or an
IA64 kernel.

If you boot an IA32 kernel the CPU will behave as an exact Pentium
processor and execute all Pentium code.  The system will be slower
than comparable Pentium processors but it should work exactly the
same.  (Notice that I say `should', I've never done this, there could
be chipset issues, I don't know of anyone who has done this but it
should work.)

If you boot an IA64 kernel then the CPU can execute IA32 user mode
programs.  This means you can't run IA32 device drivers and it also
means you need a fair amount of kernel support in order to run an
IA32 application so the statement `without further software support'
is a little inaccurate.

On Wed, Mar 26, 2003 at 12:51:40PM +0100, Markus Schaber wrote:
>
>...
> 
> However, Itanium chips support X86 Emulation in Hardware, so they can
> run any X86 Software without further software support (however, the
> software is limited to the X86 capabilities regarding Memory Capacity
> etc., and it is _really slow_, every P3/P4/Athlon at the same MHz is
> uncomparable.)
> 
>...

-- 
Don Dugger
"Censeo Toto nos in Kansa esse decisse." - D. Gale
n0ano@n0ano.com
Ph: 303/447-2201

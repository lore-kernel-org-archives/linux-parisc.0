Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 624E7482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 09:12:13 -0700 (MST)
Received: from ldl.fc.hp.com (linux-bugs.fc.hp.com [15.1.50.190])
	by atlrel8.hp.com (Postfix) with ESMTP
	id 501A9A0036F; Fri,  5 Apr 2002 11:12:09 -0500 (EST)
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Phil Anderson <andersop@neverland.ncssm.edu>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Missing beep... and music too 
In-Reply-To: Your message of "Thu, 04 Apr 2002 22:54:15 MST."
             <20020405055415.C6C54482B@dsl2.external.hp.com>
References: <Pine.LNX.4.33.0204042038090.29216-100000@bob.ncssm.edu>  <20020405055415.C6C54482B@dsl2.external.hp.com> 
Date: Fri, 05 Apr 2002 09:12:00 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E16tWJk-0003VF-00@noam.fc.hp.com>
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

> 712/80i was one of the few systems that was sold w/o Floating Pointing
> coprocessor (or FP was disabled) at a lower price point. I believe
> parisc-linux kernel ignores the lies that PDC presents about the FP
> not being present. But I'm wondering if something is really
> disabled on the chip that causes FP to just not work.  I don't know
> if our FP emulation will deal with a completely missing FP Unit.

The 80i FPU is disabled in hardware.  I once saw the restoration
procedure and gagged.

palinux has nearly all, but not 100% of the FPU emulation code.  I
don't recall why I omitted a couple of things -- probably due to
structural issues fitting them into our kernel.  We had also made
a decision not to support FPU-less boxes.

> If this really the case, I should be able find you a real 712/80
> to play with. But you need to figure out what is causing the
> illegal instruction first.

If Grant can't find one, I'm pretty sure we have a 712/80 CPU board
around somewhere.

	-P

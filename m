Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37D75485F
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Mar 2002 00:41:52 -0700 (MST)
Date: Tue, 19 Mar 2002 07:26:33 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "James E. Pace" <jepace@pobox.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] simple_strtol?
Message-ID: <20020319072633.GF21376@sleepie.demon.co.uk>
References: <20020318200919.L25440-100000@tigger.pacehouse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020318200919.L25440-100000@tigger.pacehouse.com>
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

On Mon, Mar 18, 2002 at 08:12:58PM -0800, James E. Pace wrote:
> 
> Hi.
> 
> I'm trying to get FiST
> (http://www.cs.columbia.edu/~ezk/research/fist/) working on my 712.
> I've got kernel version 2.4.17 [ uname -a = Linux rabbit 2.4.17 #2 Sat
> Mar 16 08:27:47 PST 2002 parisc unknown ].
> 
> I'm able to compile a kernel module that includes simple_strtol, but
> when I insmod it, I get :
> 
> + insmod ./rot13fs.o
> ./rot13fs.o: unresolved symbol simple_strtol
> ./rot13fs.o:
> Hint: You are trying to load a module without a GPL compatible license
>       and it has unresolved symbols.  Contact the module supplier for
>       assistance, only they can help you.
> 
> 
> What am I doing wrong?

You need to export the symbol from the kernel for use in modules.  Try
adding

EXPORT_SYMBOL(simple_strtol);

to arch/parisc/kernel/parisc_ksyms.c - maybe with an appropriate
#include for the prototype.

Richard

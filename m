Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E52DC4859
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Jun 2002 08:11:32 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17I8qQ-0001yO-00; Wed, 12 Jun 2002 15:11:30 +0100
Date: Wed, 12 Jun 2002 15:11:30 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Michael S. Zick" <mszick@goquest.com>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200
Message-ID: <20020612151130.U27449@parcelfarce.linux.theplanet.co.uk>
References: <5BA66B90-7D12-11D6-B01F-0030656F07A2@esiee.fr> <02061107100403.00732@localhost.localdomain> <20020611145848.GA2796@tausq.org> <02061113393800.04435@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <02061113393800.04435@localhost.localdomain>; from mszick@goquest.com on Tue, Jun 11, 2002 at 01:39:38PM -0500
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

On Tue, Jun 11, 2002 at 01:39:38PM -0500, Michael S. Zick wrote:
> using objdump -d on the kernel.o produced by my compiler
> (a different version of GCC than used for pa-risc) I find that
> for the "c" code sequence:
> ....
> int cpu = smp_processor_id() ;
> 
> __save_flags(flags) ;
> ....
> generates assembly code which modifies the flags during the
> initialization of "cpu" before the flags are actually saved.

are you sure?  every architecture (apart from sparc32) uses:

#define smp_processor_id() (current->processor)

admittedly on i386 (which is where you seem to be investigating), this
expands to:

get_current()->processor

which expands to

andl %%esp,%0

where 8191UL has previously been loaded into register %0.  but i don't
see how this can affect the interrupt flags.  admittedly, i know very
little about x86, but there are many other instances of code like this
in the kernel.

-- 
Revolutions do not require corporate support.

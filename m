Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.goquest.com (mail.goquest.com [63.172.73.8])
	by dsl2.external.hp.com (Postfix) with SMTP id 10B4C4853
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Jun 2002 12:48:06 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@goquest.com>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200
Date: Tue, 11 Jun 2002 13:39:38 -0500
Cc: parisc-linux@lists.parisc-linux.org
References: <5BA66B90-7D12-11D6-B01F-0030656F07A2@esiee.fr> <02061107100403.00732@localhost.localdomain> <20020611145848.GA2796@tausq.org>
In-Reply-To: <20020611145848.GA2796@tausq.org>
MIME-Version: 1.0
Message-Id: <02061113393800.04435@localhost.localdomain>
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

On Tuesday 11 June 2002 09:58 am, Randolph Chung wrote:
>
> think we are looking at multiple bugs here.....
>
Very likely...
You might check the HPPA version of:

arch/i386/kernel/irq.c::__global_save_flags.

using objdump -d on the kernel.o produced by my compiler
(a different version of GCC than used for pa-risc) I find that
for the "c" code sequence:
....
int cpu = smp_processor_id() ;

__save_flags(flags) ;
....
generates assembly code which modifies the flags during the
initialization of "cpu" before the flags are actually saved.
....
in the pa-risc branch, try the equivalent of:
....
int cpu ;
....
__save_flags(flags) ;
....
cpu = smp_processor_id() ;
....

Mike

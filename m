Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id AB9E3482A
	for <parisc-linux@parisc-linux.org>; Fri, 17 May 2002 00:35:44 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] irq.c patch to fix lockups on recent kernels 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Thu, 16 May 2002 15:30:48 MDT." <20020516213048.DDE21482A@dsl2.external.hp.com>
References: <20020515134703.GY30370@tausq.org> <20020516204045.D4E85482A@dsl2.external.hp.com>  <20020516213048.DDE21482A@dsl2.external.hp.com> 
Date: Fri, 17 May 2002 00:35:44 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020517063544.AB9E3482A@dsl2.external.hp.com>
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

Grant Grundler wrote:
> I'm thinking we should:
> o move the EIRR bit handling into do_cpu_irq_mask()
>   (do_cpu_irq_mask() could loop until EIRR is zero).
> o move I-bit handling into the entry.S assembly.

prototype code is on ftp.parisc-linux.org/patches/irq_eirr.diff
I didn't cleanup some of entry.S stuff but it should work.
Not tested.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Timothy Ball <timball@tux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] include/asm-parisc/pgalloc.h 
In-Reply-To: Message from Timothy Ball <timball@tux.org>
   of "Tue, 12 Feb 2002 15:28:01 EST." <20020212202801.GX8669@gwyn.tux.org>
References: <20020212202801.GX8669@gwyn.tux.org> 
Date: Tue, 12 Feb 2002 21:48:17 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020213044817.44B91482E@dsl2.external.hp.com>
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

Timothy Ball wrote:
> do { ... } while(0); do not need the trailing semicolon and may lead to
> strange side effects. the following patch fixes it.

Tim,
thanks for the patch...but that code doesn't exist in the parisc-linux
source tree. We've got:
  ...
  128 /* TLB flushing routines.... */
  129 
  130 extern void flush_tlb_all(void);
  ...

Matthew Wilcox is looking at syncing our tree with 2.4 at least.
Offhand, don't know if anyone is looking at updating 2.5 for parisc.

thanks,
grant

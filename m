Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dump: pb with module_list 
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Wed, 23 Jan 2002 22:00:33 GMT." <20020123220032.GA29047@sleepie.demon.co.uk>
References: <3C4EFDCC.A4A227F9@admin.france.hp.com>  <20020123220032.GA29047@sleepie.demon.co.uk> 
Date: Thu, 24 Jan 2002 23:37:21 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020125063721.8442E482A@dsl2.external.hp.com>
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

Richard Hirst wrote:
> > I'm probably missing something, but what ????
> 
> You need to export the symbol for modules to see it.  See
> arch/parisc/kernel/parisc_ksyms.c for example.

And add the export-objs variable to your Makefile.
See drivers/*/Makefile or arch/parisc/kernel/Makefile.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50E92482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Jan 2002 15:41:23 -0700 (MST)
Date: Wed, 23 Jan 2002 22:00:33 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Dump: pb with module_list
Message-ID: <20020123220032.GA29047@sleepie.demon.co.uk>
References: <3C4EFDCC.A4A227F9@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C4EFDCC.A4A227F9@admin.france.hp.com>
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

On Wed, Jan 23, 2002 at 07:15:40PM +0100, Bruno Vidal wrote:
> 	Hi
> There is something I don't understand (and I really
> dont like to not understand). I didn't have any pb
> with utsname. But now I want to retrieve the loaded 
> modules at dump time. In order to do that, I wrote
> a very simple loop (it is based on find_module function).
> It is based on the pointer "module_list". this is define
> in linux/module.h as: 
> extern struct module *module_list;
> 
> Because I don't want to modify kernel/module.c
> I've put my function in my dump_base.c
> (it already include linux/module.h). It compile right,
> but when using depmod, insmod, etc...:
> dump.o: unresolved symbol module_list
> I've already recompile the entire kernel, make dep, etc...
> 
> I'm probably missing something, but what ????

You need to export the symbol for modules to see it.  See
arch/parisc/kernel/parisc_ksyms.c for example.

Richard

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Istvan Gyenes <frts@simba.sch.bme.hu>
Cc: "J.Steindlberger" <j@steindlberger.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350 
In-Reply-To: Message from Istvan Gyenes <frts@simba.sch.bme.hu>
   of "Thu, 19 Sep 2002 11:17:00 +0200." <Pine.OSF.4.33.0209191111490.32375-100000@simba.sch.bme.hu>
References: <Pine.OSF.4.33.0209191111490.32375-100000@simba.sch.bme.hu> 
Date: Thu, 19 Sep 2002 16:46:09 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020919224609.DF1314829@dsl2.external.hp.com>
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

Istvan Gyenes wrote:
> Hello Joerg,
> 
> The only difference between the non-smp and smp kernel config file is
> CONFIG_SMP=yes , AFAIK.
> I made a "make menuconfig" and the only thing I've changed is SMP support.

I'm paranoid. I do "make distclean" when doing anything other than
adding/removing drivers. Save/restore the .config if you need to before
running "make distclean".  I don't trust the Makefiles to rebuild
everything correctly for "global" CONFIG_ changes like "SMP".

> The strange thing is that the precompiled smp kernel from the install cd
> boots fine. (2.4.18-smp)

SMP on 2.4.19 isn't as stable yet.  So that's no surprise.

If you want to debug this further, define "EARLY_BOOTUP_DEBUG"
in arch/parisc/kernel/pdc_cons.c and you should get more output
about how far the kernel gets before it crashes/hangs.

grant

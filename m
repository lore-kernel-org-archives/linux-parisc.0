Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from simba.sch.bme.hu (simba.sch.bme.hu [152.66.215.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id A39FB4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 02:27:11 -0600 (MDT)
Date: Fri, 20 Sep 2002 10:28:24 +0200 (MET DST)
From: Istvan Gyenes <frts@simba.sch.bme.hu>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SMP kernel problems on a D350 
In-Reply-To: <20020919224609.DF1314829@dsl2.external.hp.com>
Message-ID: <Pine.OSF.4.33.0209201006420.5180-100000@simba.sch.bme.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Thanks I'll try that!

Another question: If 2.4.19 SMP not enough stable where can I find the
latest stable smp kernel source?

Thanks,

__
Steve

On Thu, 19 Sep 2002, Grant Grundler wrote:

> Istvan Gyenes wrote:
> > Hello Joerg,
> >
> > The only difference between the non-smp and smp kernel config file is
> > CONFIG_SMP=yes , AFAIK.
> > I made a "make menuconfig" and the only thing I've changed is SMP support.
>
> I'm paranoid. I do "make distclean" when doing anything other than
> adding/removing drivers. Save/restore the .config if you need to before
> running "make distclean".  I don't trust the Makefiles to rebuild
> everything correctly for "global" CONFIG_ changes like "SMP".
>
> > The strange thing is that the precompiled smp kernel from the install cd
> > boots fine. (2.4.18-smp)
>
> SMP on 2.4.19 isn't as stable yet.  So that's no surprise.
>
> If you want to debug this further, define "EARLY_BOOTUP_DEBUG"
> in arch/parisc/kernel/pdc_cons.c and you should get more output
> about how far the kernel gets before it crashes/hangs.
>
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

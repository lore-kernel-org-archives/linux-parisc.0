Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id D533D4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 14:03:01 -0600 (MDT)
Date: Fri, 20 Sep 2002 13:02:59 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Istvan Gyenes <frts@simba.sch.bme.hu>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SMP kernel problems on a D350
In-Reply-To: <20020920194820.GC24622@systemhalted>
Message-ID: <Pine.LNX.4.44.0209201301220.20374-100000@garibaldi.apptechsys.com>
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

On Fri, 20 Sep 2002, Carlos O'Donell wrote:

> > Thanks I'll try that!
> > 
> > Another question: If 2.4.19 SMP not enough stable where can I find the
> > latest stable smp kernel source?
> > 
> > Thanks,
> > 
> > Steve
> 
> Nothing up this sleeve, nothing up this sleeve...
> <carlos pulls a stable smp kernel out of his hat>
> 
> Tada! ;)
> 
> I'm not quite certain that we ever had a stable
> SMP kernel. While an older kernel might seem to 
> give you SMP stability, it does so at the cost of 
> speed and the introduction of old bugs.

For me, the last kernel that didn't crash on my J5000 in smp mode while
doing apt-get update was kernel-image-2.4.17-32-smp_23.1_hppa.deb

I wouldn't recommend using it, however...
> 
> If you can find some test cases for Non-SMP vs.
> SMP stability, then we'll be a step in the right 
> direction.
> 
> c.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
Mason's First Law of Synergism:
	The one day you'd sell your soul for something, souls are a glut.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Istvan Gyenes <frts@simba.sch.bme.hu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350 
In-Reply-To: Message from Istvan Gyenes <frts@simba.sch.bme.hu>
   of "Fri, 20 Sep 2002 10:28:24 +0200." <Pine.OSF.4.33.0209201006420.5180-100000@simba.sch.bme.hu>
References: <Pine.OSF.4.33.0209201006420.5180-100000@simba.sch.bme.hu> 
Date: Fri, 20 Sep 2002 22:31:17 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020921043118.0F8F64829@dsl2.external.hp.com>
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
> Thanks I'll try that!
> 
> Another question: If 2.4.19 SMP not enough stable where can I find the
> latest stable smp kernel source?

I'd advise using the 2.4.19 images uploaded by Bdale to debian.org.
Mostly because it's "fall-out-of-bed" easy to get matching source in
case you need to change something or want to try something out.

If that doesn't work for you, for A500, one of the better ones is:
	ftp://ftp.parisc-linux.org/kernels/a500/2.4.18-pa54.tgz

Look in kernels/32 or kernel/64 for other revs using default configs.

I'm convinced SMP instability is because of timing (race conditions)
and/or D-cache problems. My gut feeling if the 4-way associative
cache isn't getting flushed properly in all locations it needs to be.
I'm hoping someone who has more clue about VM and virtually indexed
caches could dig into this.

hth,
grant

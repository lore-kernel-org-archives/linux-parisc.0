Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A3EE4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 02:48:34 -0600 (MDT)
Date: Tue, 24 Sep 2002 01:48:31 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Arto Jantunen <viiru@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP problems
In-Reply-To: <20020924060541.GA27852@dt-link.fi>
Message-ID: <Pine.LNX.4.44.0209240141510.20374-100000@garibaldi.apptechsys.com>
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

On Tue, 24 Sep 2002, Arto Jantunen wrote:

> Any news on the SMP trouble on PA-8200 and similar? Someone said that he
> would be working on it last week. I heard some stuff about it working on
> 64-bit kernels, but 64-bit crashes immediately on my box, SMP or no SMP.
> I would really like to get this monster doing some real work, so any
> news is good news.
I don't know exactly what hardware you have, but my J5k is chugging 
happily along running 2.4.19-64-smp from sid, and the only problem I have 
encountered as of yet is a lockup when starting setserial on boot.  Other 
than that, it seems to be as stable as uniproc 32-bit.  Whatever hardware 
you have, I'm willing to bet that it isn't a J5k, and any differences 
involved may complicate things, so (as always) YMMV.

Good luck...


 > > -- > Arto 
Jantunen > _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
You had mail.  Paul read it, so ask him what it said.

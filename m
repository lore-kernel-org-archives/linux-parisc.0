Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10E764830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jun 2003 05:55:47 -0600 (MDT)
Date: Wed, 18 Jun 2003 13:55:42 +0200
Message-ID: <3ED4C8B60000747E@ocpmta1.freegates.net>
In-Reply-To: <200306171508.h5HF86eW010149@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] Re: g++ (3.3): ...Error: Field out of range
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

Hi Dave,

Shame on me: I forgot to test with different compression option.

I just do it and the problem doesn't occure any more without -O2 or with
-O1?


> You could try assembling with the current cvs version of binutils.  You
> can generate an assembler file by changing `-c' to `-S' and the output
> file name in the above command.  This will allow you to look at the
> assembler line in question and see whether this is a problem with stubs
> or not (i.e., something other than a branch to a function).  As this is
> C++ code, there might be a huge number of small functions causing overflow
> of the stub table.
> 
> The stub table fix was done quite sometime ago and I would have thought
> that recent debian versions of binutils would have it.
> 
> If this is not a stub table overflow problem, please file a gcc PR
> including the preprocessed source from the above command.

Never the less I will try to rebuild cvs binutils then check if the pb continue.

See you later,
    Joel


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be

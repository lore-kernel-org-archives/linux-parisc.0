Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 962C0482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 07:27:37 -0600 (MDT)
Date: Thu, 19 Jun 2003 15:27:33 +0200
Message-ID: <3ED70CF1000079C3@ocpmta2.freegates.net>
In-Reply-To: <200306181712.h5IHCa4Z016566@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: g++ (3.3): ...Error: Field out of range
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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
>
>> It is well a stub table pb?

> No, this is a gcc pb.  Please proceed with a PR.  I can see the
> problem.  There isn't support for long floating-point branches
> in the machine definition :(
>

I am on going to prepare (btw would that I make you or p-l ml list in CC
of the PR?)

> I would suggest that the code being generated for this fuction
> isn't going to be very good.  Whenever at function
> exceeds 240KB in size, then GCC needs to generate long branches
> for function calls and some internal branches.  These sequences
> are much longer and less efficient.  You can tweak the parameter
> of the GCC's inlining model and probably reduce the size of
> the generated code.  The parameters are settable from the
> command line and are documented in the manual, etc.

hmm I found well severall cmd line parameter concerning inline stuff and
I was first tempted to test
-finline-limit=225000 (doesn't help)
-finline-limit=120000 (doesn't help more)
too bad :-(

and no more help with -fno-implicit-templates and/or -fno-implicit-inline-templates.

The only help is -fno-default-inline (i suppose that -fno-inline also) but
seems to me a bit like -O1.

Thanks again,
    Joel


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be

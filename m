Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA0DE4829
	for <parisc-linux@parisc-linux.org>; Mon,  5 Aug 2002 09:06:52 -0600 (MDT)
Date: Mon, 5 Aug 2002 10:59:19 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <joel.soete@freebel.net>, bame@fc.hp.com,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Palo: cmdline and commanline has different limits?
Message-ID: <20020805145919.GB31773@systemhalted>
References: <3D4D7AF8.9030005@freebel.net> <20020804223618.GG19482@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020804223618.GG19482@systemhalted>
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

> > I do not know yet if pad1 can be removed so that cmdline could reach 204 
> > [240-8-7*(sizeof int = 4?)] char lenght, also I prefer to let you choise.
> > 
> > Joel
> 
> I don't see why not? Would 200 characters be enough for your application?
> 
> I do think that "> 255" should be changed in palo.c
> 
> To push it out further would require teaching palo about 
> both formats (and understanding why the comment mentions 
> that all the data must fit in 256 byes).
> 
> c.

Joel,

I just talked to Bame and we both agree that those bytes would
best be left for future expansion.

I've made the change in palo.c such that it checks for "> 127"
I'll be cheking that in today, and a new deb of palo should be out
next week. If you would like to help in the testing process then 
checkout palo from cvs and you can build the package yourself.

The documentation for palo was updated to reflect a limit
in the -c argument.

Do you have a particular use for more than 127 bytes of command line
information? Passing a _lot_ of data via the command line is not 
accepted as good practice :}

c.

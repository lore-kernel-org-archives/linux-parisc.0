Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id D34DC4829
	for <parisc-linux@parisc-linux.org>; Sun,  4 Aug 2002 16:44:00 -0600 (MDT)
Date: Sun, 4 Aug 2002 18:36:18 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <joel.soete@freebel.net>
Cc: bame@fc.hp.com, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Palo: cmdline and commanline has different limits?
Message-ID: <20020804223618.GG19482@systemhalted>
References: <3D4D7AF8.9030005@freebel.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D4D7AF8.9030005@freebel.net>
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

> Hi Paul,
> I just notice a small problem:
> In palo/palo/palo.c at line 720:
> 	...
> 	if (strlen(commandline) > 255)
> 	...
> OTC in palo/lib/common.h in struct firstblock at line 46:
>     char cmdline[128];          /* Up to 127 bytes of text plus a \0 */
>     unsigned char pad1[0xf0 - 8 - 7 * sizeof (int) - 128];
> 
> I do not know yet if pad1 can be removed so that cmdline could reach 204 
> [240-8-7*(sizeof int = 4?)] char lenght, also I prefer to let you choise.
> 
> Joel

I don't see why not? Would 200 characters be enough for your application?

I do think that "> 255" should be changed in palo.c

To push it out further would require teaching palo about 
both formats (and understanding why the comment mentions 
that all the data must fit in 256 byes).

c.

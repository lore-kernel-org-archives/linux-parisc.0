Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from student.cs.ucc.ie (student.cs.ucc.ie [143.239.211.125])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9973482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 05:25:55 -0700 (MST)
Date: Thu, 22 Nov 2001 12:26:07 +0000 (GMT)
From: Markus Grabert <xam@student.cs.ucc.ie>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Herb Radford <herbr@magma.ca>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] My C200 situation 
In-Reply-To: <200111220447.VAA03217@puffin.external.hp.com>
Message-ID: <Pine.OSF.4.41.0111221214040.29126-100000@student.cs.ucc.ie>
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

On Wed, 21 Nov 2001, Grant Grundler wrote:

> Herb Radford wrote:
> > Does that mean that stifb is up on the FX4??
>
> No. That's just the STI console - different driver.
>
> > What about X then?
>
> Dunno - but don't think that's the same.

Mhhh, can anybody give an clear answer to this question ?
Or is here some more testing necessary ?

Does anybody know whether stifb and/or XFree is working on a RavenU+
(C200/C240) with a VISUALIZE FX graphics card ?

Did anybody have success in running XFree using a PC PCI graphics card ?
(probably this is just possible as a 2nd graphics card as Grant wrote in
 a former email)

> > By the way, I also tried a 64-bit kernel 2.4.14pa6 which did not do
> > anything I could see after setting the w-bit in the processor status
> > register (went to 64-bit mode).

Thanks, Max

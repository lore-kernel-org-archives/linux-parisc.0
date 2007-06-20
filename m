From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Unaligned handler broken (kernel BUG at
	mm/mmap.c:1991!)
Date: Wed, 20 Jun 2007 23:09:39 +0200
Message-ID: <200706202309.39643.deller__26094.5532740609$1416624400$gmane$org@gmx.de>
References: <200706182131.06930.deller@gmx.de>
	<20070620184502.GE8184@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070620184502.GE8184@fattire.cabal.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Kyle,

On Wednesday 20 June 2007, Kyle McMartin wrote:
> On Mon, Jun 18, 2007 at 09:31:06PM +0200, Helge Deller wrote:
> > The following small test case - which is itself wrong - crashes 2.6.22-rc5 (32bit kernel) badly:
> > 
> > #include <stdio.h>
> > int main()
> > {
> >         int *ptr = (int *) 0xffffffff;
> >         printf("ptr=%x, val=%d\n", ptr, *ptr);
> > }
> > 
> 
> I have a fix for this, will post after rudimentary testing.

I remembered, that I saw similiar problems with the LTP testsuite last december.
It's in the archives as thread named "kernel BUG at mm/mmap.c:1990".

In the end Willy (and I think you as well!) helped me to track the problem down on IRC.
The final patch which solved this issue is this one, which we had in our old git tree, but which never made it upstream:
http://git.parisc-linux.org/?p=linux-2.6.git;a=commitdiff;h=0590a4f2beee1d489050cb0ca035294892a46a40

Helge

PS: I would surround the if-clause check with likely() today...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

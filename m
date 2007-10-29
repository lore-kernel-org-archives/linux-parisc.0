From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Sun, 28 Oct 2007 23:30:15 -0600
Message-ID: <20071029053015.GA14763__47402.816967997$1416624650$gmane$org@colo.lackof.org>
References: <JQIT2V$FB9C8381616CCA32E9FC6CC809E8D81D@scarlet.be>
	<20071028064158.GB29233@colo.lackof.org>
	<4724A084.5090709@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: kyle <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4724A084.5090709@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Oct 28, 2007 at 02:45:24PM +0000, Joel Soete wrote:
...
> e.g.
> # more GetOrder-poc.c
...
> give me well same results:
> # ./GetOrder-poc
> get_order(1) = 0 (0x0);
> get_order_poc(1) = 0 (0x0).
...

Good!

...
> But I need to check more on a detail:
> here is the prototype of fls():
> static inline int fls(int x)
>
> so I need to be sure that the value of ((size - 1) >> (PAGE_SHIFT)) would 
> always stand in a int (not unsigned but sign) for 32bit (iirc 
> size_of(unsigned long)==32) and 64bit (size_of(unsigned long)==64) 
> implementations?

Huh?
Why do you care how (unsigned long) is handled when the function prototype
defines the API to pass in an "int"?

FWIW, __fls could be extended to handle unsigned long the same way
that __ffs has been...but I don't think we needed to for anything so far.

...
>>> 	return (size ? fls((size - 1) >> (PAGE_SHIFT)): 0);
>> fls is inlined already and does the same test for size.
>
> Yes but here the error (well imo it's an error) came from the unsign long 
> of (-1 >> PAGE_SHIFT) <> 0

Yeah, we'll have to make sure signed int values are handled correctly too.
But something specific to the parisc version of get_order() can deal
with sign bits and zero values then call __fls(unsigned long) instead
of fls(signed int).

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [linux-usb-devel] Re: [parisc-linux] [PATCH] usb/input/hid-core.c
	extract() brain damage
Date: Sat, 4 Jun 2005 11:43:08 -0600
Message-ID: <20050604174308.GA19823__45977.6966752999$1416624541$gmane$org@colo.lackof.org>
References: <20050604072510.GD8230@colo.lackof.org>
	<Pine.LNX.4.44L0.0506041057560.5133-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-usb-devel@lists.sourceforge.net,
 parisc-linux@parisc-linux.org
To: Alan Stern <stern@rowland.harvard.edu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.44L0.0506041057560.5133-100000@iolanthe.rowland.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 04, 2005 at 11:06:52AM -0400, Alan Stern wrote:
> In spite of the total overall number of changes required, wouldn't it be 
> much simpler to have a suite of routines (inlines or macros) like:
> 
> 	get_16, put_16, get_le16, put_le16, get_be16, put_be16
> 	get_32, put_32, get_le32, put_le32, get_be32, put_be32
> 	get_64, put_64, get_le64, put_le64, get_be64, put_be64
> 
> 	in short, {get|put}_{|le|be}{16|32|64}

Sorry, no. The architectures that trap on misaligned accesses have to
handle that in the kernel. And even though the implementations
get simpler, a plethoria of interfaces just clutters up the general
device driver API. For that reason alone I wouldn't want it.

The endian conversion (swap) macros are PITA already.
I'll argue the swap API should be simplified to four macros:
	cpu_to_le(x), cpu_to_be(x), le_to_cpu(x), be_to_cpu(x)

and force the caller to cast to the right size. switch(sizeof(x)) would
then select the right arch specific variant. I'll figure out how to
pitch this to linux-arch...and then see how far it gets batted back. :^)

> for native, little-endian, and big-endian unaligned accesses?  The generic 
> definitions are extremely simple and architecture-specific headers could 
> easily provide optimized versions.
> 
> I realize this doesn't fit in very well with the current state of the API, 
> but IMHO it would be a big improvement.

Not really. davem is right that it would clutter up certain parts
of the code (e.g. networking stack).
Don't forget all the above is a NOP on 90% (x86) of the computers.

I'm annoyed that certain performance sensitive paths (e.g. TCP/IP) don't
use macros to access unaligned data. It affects my work (ia64)
and pet (parisc) architectures. But that's how it is and I don't
see it changing anytime in the near future.

thanks for thinking about it,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

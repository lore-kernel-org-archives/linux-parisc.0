Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF7D1482B
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 15:45:04 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18rn3v-0005BQ-00; Sat, 08 Mar 2003 22:45:03 +0000
Date: Sat, 8 Mar 2003 22:45:03 +0000
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: grundler@dsl2.external.hp.com, jsm@udlkern.fc.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030308224503.L3865@parcelfarce.linux.theplanet.co.uk>
References: <20030308063043.GB27859@dsl2.external.hp.com> <20030307.222945.32673395.davem@redhat.com> <20030308172439.GA10161@dsl2.external.hp.com> <20030308.110459.35972945.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030308.110459.35972945.davem@redhat.com>; from davem@redhat.com on Sat, Mar 08, 2003 at 11:04:59AM -0800
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

On Sat, Mar 08, 2003 at 11:04:59AM -0800, David S. Miller wrote:
>    From: grundler@dsl2.external.hp.com (Grant Grundler)
>    Date: Sat, 8 Mar 2003 10:24:39 -0700
>    
>    After getting some sleep and thinking about how IOMMUs work on parisc,
>    I've convinced myself the CPU caches are virtually tagged and
>    virtually indexed.
> 
> Some quick googling suggests that they are physically tagged.

I'm not sure of the exact definitions of physically/virtually tagged.
The definition you're interested in is on Page F-6 of the PARISC 2.0
Architecture book by Gerry Kane.  Fortunately HP have it online at the
rather ugly URL:

http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,959!218!244,00.html


	The instruction and data caches are required to detect that the
	same physical memory location is being accessed by two virtual
	addresses that satisfy all the following requirements:

	   1. The two virtual addresses map to the same absolute address.
	   2. Offset bits 40 through 63 are the same in both virtual addresses.

The upshot is that if two addresses are congruent modulo 4MB and they
map to the same physical address, the cache will detect it.  I've been
thinking about (ab)using kmap() for this for a while.  The trouble
is we'd need to have 1024 slots just to be guaranteed space to map 1
page -- if we need to guarantee to be able to map two pages at once,
we need 2048 slots (ie 8MB of virtual space).  Etc.  I have no idea how
many pages we expect to be able to map simultaneously, and haven't been
able to get a straight answer out of anyone so far.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

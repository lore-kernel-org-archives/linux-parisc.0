Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Peter Saisanas" <psaisanas@iprimus.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP C240 With Debian 3.0 
In-Reply-To: Message from "Peter Saisanas" <psaisanas@iprimus.com.au>
   of "Mon, 19 Aug 2002 23:23:47 +1000." <000e01c24783$a707f680$050000c6@dualpiii700>
References: <000e01c24783$a707f680$050000c6@dualpiii700> 
Date: Mon, 19 Aug 2002 15:52:00 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020819215201.211A94829@dsl2.external.hp.com>
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

"Peter Saisanas" wrote:
> "Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping =
> resources" and the c240 locks up.=20

This has come up before on the mailing list.
We need to change ccio_mem_ratio to 2 or otherwise fix
how iova_space_size is getting calculated.

...
> But on rare occations i can at least install the base system and it =
> works very nicely
...
> What do i need to do to get the C240 stable and stop the machine =
> crashing.

arch/parisc/kernel/ccio-dma.c: unmodified: line 169 of 1615 [10%].

/* Ratio of Host MEM to IOV Space size */
static unsigned long ccio_mem_ratio = 4;

replace 4 with 2.

grant

From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] BUG 2.6.12-rc3-pa1 PCI mmap panic
Date: Sun, 01 May 2005 14:24:20 -0500
Message-ID: <1114975460.4788.27.camel@mulgrave>
References: <20050501074901.GA13801@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050501074901.GA13801@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2005-05-01 at 01:49 -0600, Grant Grundler wrote:
> Trying to get "tvflash" running on pa8800. tvflash is a userspace
> firmware flash tool for mellanox infiniband boards.
> Works fine on x86, x86-64, ia64, ppc, and sparc64.
> "tvflash -i" is supposed to go off and identify all
> installed mellanox boards and which firmware rev they
> currently have.
> 
> The panic is in pfn_to_nid():
>         r = pfnnid_map[i];
>         BUG_ON(r == 0xff);	<---- panic
> 
> Any clue what's broken?

pfnnid_map is a map per 1gb (currently what PFNNID_SHIFT defines) of our
memory range showing which discontig chunk this maps to.  0xff means the
range maps nowhere.

Without better debugging, it's hard to say, but I guess that this flash
tool is actually trying to mmap a region of memory on the PCI card and
it's tripping over this section of code.  My second order guess would be
that we don't update the pfnnid_map when we actually declare a card I/O
range, so the kernel thinks it can map the region OK but we erroneously
trip this bug.

I'm with Joel on this one: Can you reproduce the problem without
CONFIG_DISCONTIGMEM?

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

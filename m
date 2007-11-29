From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Thu, 29 Nov 2007 11:50:57 -0700
Message-ID: <20071129185057.GA14893@colo.lackof.org>
References: <JS7JF3$B26560F4AD894A9D4B4501FF960EB990@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <JS7JF3$B26560F4AD894A9D4B4501FF960EB990@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Nov 28, 2007 at 09:25:51AM +0100, Joel Soete wrote:
> > You need to read about "VIVT" caches (Virtual Indexed, Virtual Tagged).
> > The "Virtual Index" bits have to be provided by any cache coherent traffic
> > in order to be cache coherent. That's how the caches know _where_ in the
> > cache to find potential hits for a given cacheline.
> >
> For sure I need more reading but imho this paper is already clear on subject:
> my understanding (in short terms) is that cpu cache entry should be the same
> virtual address as DMA cache else it would need additional stuff to check
> physical address, right?

There is no "DMA Cache". The CPU owns the data cache and it needs enough
info to verify if particular DMA transactions affect entries in the
CPU cache (or not). "VIVT" summarizes the type of cache and thus info
the CPU needs for DMA/cache coherency checking.

cheers,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

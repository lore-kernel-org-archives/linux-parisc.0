From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] QEMU Port (Help needed)
Date: Sun, 4 Jun 2006 17:19:47 -0600
Message-ID: <20060604231947.GH27231@parisc-linux.org>
References: <20060604160441.GA18082@miranda.arrow>
	<119aab440606041448t3952e3dfwf85f926ffdc5e441@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440606041448t3952e3dfwf85f926ffdc5e441@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 04, 2006 at 05:48:17PM -0400, Carlos O'Donell wrote:
> 4. flush_icache_range can probably be copied from the kernel implementation.

Why are we still talking about doing flush_icache_range() in userspace?
Why does qemu not use mprotect() to set either PROT_EXEC or PROT_WRITE
(and never both at the same time)?  The kernel will flush userspace
appopriately (and if it doesn't, that's a bug).
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

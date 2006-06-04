From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] QEMU Port (Help needed)
Date: Sun, 4 Jun 2006 19:22:36 -0400
Message-ID: <119aab440606041622p4a6af3adva78ca119f6617a8b@mail.gmail.com>
References: <20060604160441.GA18082@miranda.arrow>
	<119aab440606041448t3952e3dfwf85f926ffdc5e441@mail.gmail.com>
	<20060604231947.GH27231@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060604231947.GH27231@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/4/06, Matthew Wilcox <matthew@wil.cx> wrote:
> On Sun, Jun 04, 2006 at 05:48:17PM -0400, Carlos O'Donell wrote:
> > 4. flush_icache_range can probably be copied from the kernel implementation.
>
> Why are we still talking about doing flush_icache_range() in userspace?
> Why does qemu not use mprotect() to set either PROT_EXEC or PROT_WRITE
> (and never both at the same time)?  The kernel will flush userspace
> appopriately (and if it doesn't, that's a bug).
>

Blame QEMU for letting you override the default implementation!
It's always tempting to see if you can do it faster in userspace?

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Re: [PATCH] Common compat_sys_sysinfo
Date: Sun, 7 Jan 2007 08:18:17 -0700
Message-ID: <20070107151817.GN24620__5199.72874685681$1416624255$gmane$org@parisc-linux.org>
References: <20070107144850.GB3207@athena.road.mcmartin.ca>
	<20070107151319.GA23478@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: Christoph Hellwig <hch@infradead.org>,
 Kyle McMartin <kyle@parisc-linux.org>,
 akpm@osdl.org,
 linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070107151319.GA23478@infradead.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jan 07, 2007 at 03:13:19PM +0000, Christoph Hellwig wrote:
> and last but not least we probably want a unified mechanisms to deal
> with the 64bit arguments that are broken up into two 32bit ones (not just
> for emulation but also for 32it BE architectures)

It's not BE that is the problem -- drepper thought of that.

What he fundamentally missed was the calling convention where 64-bit
arguments have to be 64-bit aligned, even when they're passed through
registers.  So:

int foo(int, long long);

takes its arguments in arg0, arg2 and arg3, but glibc passes the syscall
arguments in arg0, arg1 and arg2.

I think the Right Way to fix this is for some gcc hacker to implement an
__attribute__((packed_args)) that changes the calling convention for
that function, then we can define asmlinkage to use that on mips and
parisc.

Any budding gcc hackers out there?  ;-)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

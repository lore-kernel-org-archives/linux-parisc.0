From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: pa_memcpy: 2 small question
Date: Mon, 10 Jan 2005 10:17:10 -0700
Message-ID: <20050110171710.GC16091@colo.lackof.org>
References: <20050110085446.GS18497@tausq.org>
	<41DE941900000C83@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41DE941900000C83@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 10, 2005 at 06:12:24PM +0100, Joel Soete wrote:
> well any way if no trap occurs the results is put in %r0: I don't yet well
> understand this usage of %r0 as target reg (excepted for prefetching)?

writes to %r0 are simply discarded.
It's a handy target when we don't care about the result since
it will not cause any interlocks with previous or succesive instructions.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

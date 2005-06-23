From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Wed, 22 Jun 2005 23:27:53 -0600
Message-ID: <20050623052753.GA20584@colo.lackof.org>
References: <200503242133.j2OLXl4R020985@hiauly1.hia.nrc.ca>
	<42B9C20E.3090409@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42B9C20E.3090409@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jun 22, 2005 at 07:54:54PM +0000, Joel Soete wrote:
> of fp registers?
> or how may I try to define it as accurately as possible?
> (I objdump a operating 2.6.12-rc.-pa. 64bit to grep some 'fr[12][0..9]' and 
> all of them seems to be used?

Of course they will all be used - kernel has to save and restore
process state when switching context. You have to look at each
use and determine why FP is being used. There shouldn't
be that many different uses.

> Do I have to look elsewhere; tausq also spoke about: sic
> [...]One proposal that has been talked about before is if we can
> compile a version of the millicode lib that uses limited fpregs range
> and compile the kernel using this new option that Dave is talking about,
> then we will be able to get by using a (much) smaller subset of fp regs
> and we won't have to save/restore them in the kernel. )

That's correct - but we will still have to save/restore all FP regs
on a general context switch - just a subset of those when
entering/leaving the kernel (e.g. handling an external interrupt).

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

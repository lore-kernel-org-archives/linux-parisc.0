From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: flush_kernel_[di]cache_page question? [WAS: [parisc-linux]
	2.6.10-rc1-pa11 profile data
Date: Fri, 26 Nov 2004 12:02:45 -0700
Message-ID: <20041126190245.GA4071@colo.lackof.org>
References: <20041111081154.GR15714@tausq.org>
	<418A81170000898E@mail-8-bnl.mail.tiscali.sys>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A81170000898E@mail-8-bnl.mail.tiscali.sys>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Nov 26, 2004 at 05:59:18PM +0100, Joel Soete wrote:
> >  40646 flush_kernel_icache_page                 406.4600
> [...]
> >   4089 flush_kernel_dcache_page                  40.8900
> [...]
> > we really need to do better at cache flushing..... anybody have any
> > ideas? :)
> >
> Is somebody can help me to understand those:
> [...]
> flush_kernel_dcache_page:

Joel,
the problem is not in the flush_kernel_dcache_page() routine.
The problem is we are calling too often.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

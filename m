From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Thu, 18 Aug 2005 01:17:56 -0600
Message-ID: <20050818071756.GA27345@colo.lackof.org>
References: <4301B090.9040405@excelcia.org>
	<20050817061913.GA8761@colo.lackof.org>
	<430384FE.6080105@excelcia.org> <20050817194058.GA3378@netfall.com>
	<43041C3C.2080704@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43041C3C.2080704@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Aug 17, 2005 at 11:27:24PM -0600, Kurt Fitzner wrote:
> p.s.  I installed HPUX in 64-bit mode.  Which, so I'm told, should have
> decreased my performance.  I'd like to get my C160 running Linux in
> 64-bit mode, but I can't. :(

Sure you can. recent 64-bit kernels will boot on C160.
It's just not an obvious win in most cases.

I need to think about your other comments.
parisc-linux is less than optimal for cache behavior.
Especially kernels that predate 2.6.10-ish timeframe where
James Bottomley fixed up some of the worst offenses.

But if it's an OS problem (it could be), running lmbench
on both HPUX and parisc-linux might shed light on where
the issue is.

thanks for posting the HPUX NBench results.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

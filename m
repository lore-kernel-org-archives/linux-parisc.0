From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Sat, 20 Aug 2005 00:21:35 -0600
Message-ID: <20050820062135.GA28839@colo.lackof.org>
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
...
> Next off, for nbench running on a C160/HPUX I see a memory throughput
> increase of 2.67X, integer calc increase of 1.4X, and floating point
> increase of 2.24X when compared to the C160/Linux.
...
> The performance issue on my C160/Linux was not due cache line
> loading/thrashing.
...
> What really locked it in for me that it's an OS issue,
...

It clearly is an OS issue. And thinking about it more,
I'm convinced this benchmark is exposing a cache utilization
(or lack thereof) issue. HPUX is very efficient at
NOT flushing the cache. Linux flushes alot more.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] Re: Problems with kernel mmap (failing tst-mmap-eofsync in glibc on parisc)
Date: Fri, 22 Aug 2003 12:09:52 -0700
Message-ID: <20030822190952.GF21328__33248.7552812838$1416622709$gmane$org@tausq.org>
References: <Pine.LNX.4.44.0308221926060.2200-100000@localhost.localdomain> <1061577688.2090.285.camel@mulgrave>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Hugh Dickins <hugh@veritas.com>,
	"David S. Miller" <davem@redhat.com>, willy@debian.org,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>, drepper@redhat.com
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <1061577688.2090.285.camel@mulgrave>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

In reference to a message from James Bottomley, dated Aug 22:
> On Fri, 2003-08-22 at 13:34, Hugh Dickins wrote:
> > Might the problem be in parisc's __flush_dcache_page,
> > which only examines i_mmap_shared?
> 
> This is the issue: we do treat them differently.

as does some other archs, like ARM.

are we saying that MAP_SHARED != VM_SHARED? the mmap code allows
architectures to map pages differently if MAP_SHARED is specified, but
it puts it on i_mmap vs i_mmap_shared using VM_SHARED, and for read-only
files we silently drop VM_SHARED... so the page is mapped using
MAP_SHARED semantics but placed on i_mmap....

confused,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [2.6 patch] arch/parisc/Makefile: remove
	GCC_VERSION
Date: Thu, 7 Dec 2006 23:24:26 -0500
Message-ID: <20061208042425.GC2606__26884.9721331664$1416624632$gmane$org@athena.road.mcmartin.ca>
References: <20061201114908.GR11084@stusta.de>
	<20061201182355.GC10549@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@osdl.org>,
 linux-kernel@vger.kernel.org,
 Kyle McMartin <kyle@parisc-linux.org>,
 Adrian Bunk <bunk@stusta.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061201182355.GC10549@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Dec 01, 2006 at 11:23:55AM -0700, Grant Grundler wrote:
> I've committed a variant of this to git://git.parisc-linux.org/git/linux-2.6.git
> I didn't test the failure case - only that it doesn't trigger with
> my current gcc 4.x compilers.
> 
> I expect Kyle will push parisc tree to linus in the near future.
> 
> Signed-off-by: Grant Grundler <grundler@parisc-linux.org>
> 

I like the version ggg committed to our cvs better (and I verified it
correctly functions with gcc-3.0 from Debian woody.)

Picked into my tree.

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

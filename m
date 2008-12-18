From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
	compiling ruby1.9
Date: Thu, 18 Dec 2008 02:03:40 -0500
Message-ID: <20081218070340.GF30438@bombadil.infradead.org>
References: <4949812D.7080608@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4949812D.7080608@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 17, 2008 at 11:46:05PM +0100, Helge Deller wrote:
> The Debian bugzilla has a long thread about kernel crashes when
> compiling ruby1.9 on hppa. This kernel bug led even to discussions if
> hppa should be dropped for lenny.
> See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=478717 for details.
> 
> It's really easy to reproduce the bug, and it generates this backtrace
> (interestingly two backtraces):
> 

When does it die? My ruby1.9 is building through to the tests (where
it's hanging without crashing...)

r, Kyle

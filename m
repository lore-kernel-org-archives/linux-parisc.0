From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: in ccio_io_pdir_entry(),BUG_ON() seems to break gcc-4.2
	optimization?
Date: Sun, 29 Jun 2008 14:52:42 -0600
Message-ID: <20080629205242.GA7629@colo.lackof.org>
References: <K324MR$1963B6E59C4D4D716463AB17911CD186@scarlet.be> <20080628202347.GA23898@colo.lackof.org> <4866BA91.9040607@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4866BA91.9040607@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 28, 2008 at 10:26:25PM +0000, Joel Soete wrote:
...
>> What's wrong with "ci" variable? It's just another register.
> well the idea is that "ci" variable is just there as a tmp variable just 
> used in this asm code, right.
> so why not simply get rid of its declaration (btw save a line of code ;-)) 
> and just use a common temporay reg as r19?

No - don't do that. Let the compiler do the work of allocating registers.
It's really good at it. :)  Much better than you and I combined. :)
All we need to do is tell the compiler we need a register.

cheers,
grant

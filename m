Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA08566
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 May 2000 18:01:23 -0600
Message-ID: <20000531180109.A8473@puffin.external.hp.com>
Date: Wed, 31 May 2000 18:01:09 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CONFIG_SYSCTL is not set
References: <200005300201.TAA11206@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200005300201.TAA11206@milano.cup.hp.com>; from Grant Grundler on Mon, May 29, 2000 at 07:01:07PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Mon, May 29, 2000 at 07:01:07PM -0700, Grant Grundler wrote:
> Philipp Rumpf wrote:
> > I wouldn't really consider this a bug, but if anyone does he should 
> > probably report it to whoever is working on that code in 2.3. 
> 
> If anyone wants to build x86 install/rescue disks, I think they can't now.
> Either the Configure.help is wrong or the code is wrong.
> I don't know how to submit a BUG.
> Any pointers on where this bug should go?

You were right.  It's just annoying behaviour not to compile at all, so
I submitted a patch to Alan (obviously, RPC_DEBUG doesn't make sense if
CONFIG_SYSCTL isn't defined).

So ac7 shouldn't have this problem.

	Philipp

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 18 Dec 2002 18:26:57 -0700
To: Gavin Hubbard <ghub005@xtra.co.nz>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rp2430 questions
Message-ID: <20021219012657.GJ17944@dsl2.external.hp.com>
References: <20021219005118.LJTP14518.web4-rme.xtra.co.nz@[127.0.0.1]>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021219005118.LJTP14518.web4-rme.xtra.co.nz@[127.0.0.1]>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, Dec 19, 2002 at 01:51:18PM +1300, Gavin Hubbard wrote:
> Hi
> 
> I'm installing a dual-boot rp2430 system for one of our developers
> this weekend. Are there any parisc-linux issues I need to be aware of
> with regards to the crippled firmware e.g. known installation problems
> or gotchas?

Nope. You will want to upgrade the kernel ASAP though.
Get the latest 2.4.19 kernel you can find.

> Also, if we do a firmware upgrade to rp2470 in two or three months time
> will it require a complete rebuild or reinstallation of the linux OE to
> support the unlocked hardware?

We don't have any rp2430's here to test such an upgrade.
But I can't imagine any difference besides the additional (faster?) CPU
(and more memory) getting recogized. Should your root disk get renamed,
it's possible to recovery from that pretty easily - I've done it
more than a few times.

grant

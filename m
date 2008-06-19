From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: in ccio_io_pdir_entry(), BUG_ON() seems to break gcc-4.2
Date: Thu, 19 Jun 2008 18:41:52 -0400 (EDT)
Message-ID: <20080619224154.4F8F04DCB@hiauly1.hia.nrc.ca>
References: <20080619160441.GA6049@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: rubisher@scarlet.be, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080619160441.GA6049@colo.lackof.org> from "Grant Grundler" at Jun 19, 2008 10:04:41 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >    4:   34 1c 00 00     ldi 0,ret0
> 
> The BUG_ON is causing the movb to be inserted. And then the compiler knows
> the value is zero and can either copy from a register or "load immediate 0".
> It probably chose the "ldi 0" because it avoids register interlocks and
> can always be executed.

This might not be correct with gnu as, but I think "ldi 0" is done as

	or r0,r0,ret0

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Bylander <bjorn.bylander@telia.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting to ISL with Linux installed 
In-Reply-To: Message from Christoph Plattner <christoph.plattner@gmx.at>
   of "Mon, 21 Jan 2002 22:26:50 +0100." <3C4C879A.D55F643D@gmx.at>
References: <DLEJJFGDAJICFFBHFNCDGEBBCEAA.bjorn.bylander@telia.com> <20020121030235.C37E737D2B@carmen.fc.hp.com>  <3C4C879A.D55F643D@gmx.at> 
Date: Mon, 21 Jan 2002 18:51:54 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020122015154.B793A482A@dsl2.external.hp.com>
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

Christoph Plattner wrote:
> How is the switch to and from the console done exactly,
> after I have booted the uxbootlf ?

http://lists.parisc-linux.org/hypermail/parisc-linux/0420.html

Matt Taggart also once posted a more complete recipe.
If htdig didn't suck so badly I'd look for it...

> How can I do a factory default setup, if there is going something wrong
> ?

You can't. Only the factory can really do it.
It requires a special card ("Dagger") with LASI and onboard firmware.
Don't muck with this unless you really need to.

grant

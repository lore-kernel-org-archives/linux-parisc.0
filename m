Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (p50845770.dip.t-dialin.net [80.132.87.112])
	by dsl2.external.hp.com (Postfix) with ESMTP id 819DE483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Feb 2002 12:43:32 -0700 (MST)
Date: Mon, 25 Feb 2002 20:42:15 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Jochen Friedrich <jochen@scram.de>,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] EISA EEPROM patch
Message-ID: <20020225204215.A2377@solo.franken.de>
References: <Pine.LNX.4.43.0202252002560.24957-100000@alpha.bocc.de> <jochen@scram.de> <20020225191151.A89224855@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020225191151.A89224855@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Mon, Feb 25, 2002 at 12:11:51PM -0700
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

On Mon, Feb 25, 2002 at 12:11:51PM -0700, Grant Grundler wrote:
> Jochen Friedrich wrote:
> > looks like there is a typo in eisa_eeprom.c. Probably HPEE_BASE_LENG 
> > should be HPEE_MAX_LENGTH instead?
> 
> Yes.
> I think Thomas will fix this shortly.

yep, I missed that one :-( Fix is commited.

Thomas

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]

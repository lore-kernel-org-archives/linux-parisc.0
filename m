Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jochen Friedrich <jochen@scram.de>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] EISA EEPROM patch 
In-Reply-To: Message from Jochen Friedrich <jochen@scram.de>
   of "Mon, 25 Feb 2002 20:05:32 +0100." <Pine.LNX.4.43.0202252002560.24957-100000@alpha.bocc.de>
References: <Pine.LNX.4.43.0202252002560.24957-100000@alpha.bocc.de> 
Date: Mon, 25 Feb 2002 12:11:51 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020225191151.A89224855@dsl2.external.hp.com>
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

Jochen Friedrich wrote:
> looks like there is a typo in eisa_eeprom.c. Probably HPEE_BASE_LENG 
> should be HPEE_MAX_LENGTH instead?

Yes.
I think Thomas will fix this shortly.

grant

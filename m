Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jochen Friedrich <jochen@scram.de>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IPv6 
In-Reply-To: Message from Jochen Friedrich <jochen@scram.de>
   of "Mon, 28 Jan 2002 20:17:12 +0100." <Pine.NEB.4.33.0201282014540.13593-100000@www2.scram.de>
References: <Pine.NEB.4.33.0201282014540.13593-100000@www2.scram.de> 
Date: Mon, 28 Jan 2002 13:03:56 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020128200356.61E33482A@dsl2.external.hp.com>
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
> and unfortunately, it doesn't work. This is what i get when i ping my 720
> from an Intel box:
> 
> ICMPv6 checksum failed [3ffe:0400:0470:0004:0000:0000:0000:0001 >
> ff02:0000:0000:0000:0000:0001:ff00:0002]
> NET: 4 messages suppressed.
> 
> I'll try to have a look...

Excellent - I just don't have more time to look at it.
Obviously, you want to look at the 32-bit version.

Another idea is to compare the generic code output with
the asm return value.

In any case, I'd be happy to commit any patch you come up.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id A74E14829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 00:32:41 -0700 (MST)
Date: Thu, 9 Jan 2003 23:36:59 -0800
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] unaligned accesses
Message-ID: <20030110073659.GC31470@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030109082902.GF23535@tausq.org> <3E1AA8D500000856@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E1AA8D500000856@ocpmta8.freegates.net>
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

> >Blame LaMont!
> >(yes, I'm just kidding, I've just been waiting for my chance to say
> >this... :-)
> >
> Do you think that this tcpdump pb is also related to Lamont job (to be honest
> I do not remember what was it?):

LaMont recently improved the unaligned handler to be more correct and
more robust... as well as handle more cases.
> ...
> Jan  9 09:59:58 fw01 kernel: tcpdump(4638): unaligned access to 0x0011e78a
> at ip=0x0002ab83
> Jan  9 09:59:34 fw01 kernel: tcpdump(4638): unaligned access to 0x0011e78e
> at ip=0x0002ab83
> ...

yes, tcpdump (and several other network tools) are known to generate a
lot of unaligned accesses.

> hmmm buggy: not always, the triky case is when you have to access to those
> kind of data encapsulated into a structure. I do not yet find any workaround
> or how to fix this kind of pb. Any idea (gcc-3.3?)?

eh? what do you mean? 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62FAE4840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Nov 2003 19:42:53 -0700 (MST)
Date: Sun, 23 Nov 2003 19:42:51 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] strace locks up 2.4.22-pa14
Message-ID: <20031124024251.GB23224@colo.lackof.org>
References: <20031121005003.GB13007@colo.lackof.org> <3FB265250000556F@ocpmta2.freegates.net> <20031122052915.GB29917@colo.lackof.org> <3FBF4F65.70502@tiscali.be> <20031122220919.GA6732@colo.lackof.org> <3FBFE7F0.2070204@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FBFE7F0.2070204@tiscali.be>
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

On Sat, Nov 22, 2003 at 10:49:20PM +0000, Joel Soete wrote:
> >2.4.22-pa17 on c3k, "strace -f -o /tmp/dcop.out dcopserver" hung at home. 
> Sorry I forget to ask if "strace -f dcopserver" works?

good question. It locked up with 2.4.22-pa17 as well. :^(
"locked up" meaning:
o I could ping a NIC
o console mouse/keyboard stopped responding
o I couldn't ssh into the box.

System TOC'd nicely and then HPMC'd the box.
GR00-3 0x0  0x1032f010 0x102a1a70  0x1038953c
GR20-23 0x53  0xff..ff 0x0a  0x3c230a1c
GR24-27  0x102bddbd 0xff...feb 0x3c230948 0x102d2010

IIA Space  0x0
IIA Offset 0x102a0994 strnlen+18
GR02 0x102a1a70 vsnprintf+6dc

blecchh...need a full stack unwinder.

grant

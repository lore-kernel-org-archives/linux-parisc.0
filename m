Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id E884F4840
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Nov 2003 20:22:31 -0700 (MST)
Date: Tue, 11 Nov 2003 20:22:30 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
Message-ID: <20031112032230.GB12000@colo.lackof.org>
References: <3F969FFE00009EA4@ocpmta2.freegates.net> <3F969FFE00009F73@ocpmta2.freegates.net> <20031110173525.GC24664@colo.lackof.org> <3FB0DC01.6070701@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FB0DC01.6070701@tiscali.be>
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

On Tue, Nov 11, 2003 at 12:54:25PM +0000, Joel Soete wrote:
...
> but on c110 I noticed many (with rx_copybreak = 100 and rx_copybreak = 
> 1518):
> do_page_fault() pid=882 command='netserver' type=15 address=0x0000001c
> ...

hrm...this sounds familiar...I might have only run the netperf "client"
on parisc and ran "netserver" on either ia64 or ia32 box. :^/

sorry,
grant

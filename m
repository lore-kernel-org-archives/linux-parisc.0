Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23BE84841
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Nov 2003 22:50:24 -0700 (MST)
Date: Sat, 15 Nov 2003 22:50:22 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Damian Muchli?ski <mudamian@poczta.onet.pl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux on HP
Message-ID: <20031116055022.GD4059@colo.lackof.org>
References: <002901c3aad6$87fb1c10$64d71399@Damian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <002901c3aad6$87fb1c10$64d71399@Damian>
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

On Fri, Nov 14, 2003 at 06:41:25PM +0100, Damian Muchli?ski wrote:
> So I have downloaded palinux-2.4.22-pa13-20031022-netinst.iso from your
> website,check md5, burned and booted.
> Unfortunately it hangs on "searching for devices" without any more info.

I don't know how to extract the vmlinux from the -pa13 netinst.iso.
But I could grab the 2.4.22 kernel+modules which are installed.
It boots fine on my c3k via gfx console (using PCI Viz-EG card).
(uname -a give "2.4.22-32 #1" and Oct 22, 2003 time stamp)

Thibaut, the kernel used to boot the netinst.iso is the identical
one that gets install by the netinst.iso?

Damian, perhaps you have additional/different PCI cards that are
causing problems?

Can you send output from "in io"?
Type "in io" while at the "Main Menu: Enter command" firmware prompt.

hth,
grant

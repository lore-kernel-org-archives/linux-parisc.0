Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id C23194881
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Nov 2003 18:52:00 -0700 (MST)
Date: Sat, 15 Nov 2003 18:51:59 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: buggz <buggz@america.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dual NICs on 9000/715, anyone?
Message-ID: <20031116015159.GA4059@colo.lackof.org>
References: <3F969FFE00009EA4@ocpmta2.freegates.net> <3F969FFE00009F73@ocpmta2.freegates.net> <20031110173525.GC24664@colo.lackof.org> <3FB0DC01.6070701@tiscali.be> <20031112032230.GB12000@colo.lackof.org> <3FB68167.10106@tiscali.be> <Pine.LNX.4.58.0311152220070.16980@sal.ucc.ie> <Pine.CYG.4.58.0311151819580.712@buggz3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.CYG.4.58.0311151819580.712@buggz3>
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

On Sat, Nov 15, 2003 at 06:22:32PM -0500, buggz wrote:
> Anyone get dual NICs working on this machine?
> The second one is on the EISA expansion card.

EISA DMA isn't working, IIRC.
I don't recall if anyone has published Wax (EISA) DMA docs.
If not, that means someone from HP would have to write it
or get enough detail from someone inside HP to write it.

> It works in HPUX.
> I'd like to get this to work in linux and use the box as a router/gw.

At one we had a NIC working using PIO (not DMA).
But don't expect stellar performance.

grant

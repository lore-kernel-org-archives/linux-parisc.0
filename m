Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE17C487B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 10:37:49 -0700 (MST)
Date: Mon, 10 Nov 2003 10:37:48 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
Message-ID: <20031110173748.GD24664@colo.lackof.org>
References: <3F969FFE00009E0B@ocpmta2.freegates.net> <3F969FFE00009EA4@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F969FFE00009EA4@ocpmta2.freegates.net>
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

On Mon, Nov 10, 2003 at 01:31:45PM +0100, Joel Soete wrote:
> ie a Lasi_82596 (as Matthew mentioned in a previous mail).

yeah - that's not going to perform as well as tulip.
And 10-Half is going to be substantially slower.
Sounds like it has a bug in the negotiation.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D3D2483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 10:35:27 -0700 (MST)
Date: Mon, 10 Nov 2003 10:35:25 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
Message-ID: <20031110173525.GC24664@colo.lackof.org>
References: <3F969FFE00009EA4@ocpmta2.freegates.net> <3F969FFE00009F73@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F969FFE00009F73@ocpmta2.freegates.net>
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

On Mon, Nov 10, 2003 at 03:00:37PM +0100, Joel Soete wrote:
>                         if (pkt_len > rx_copybreak) {
>                                 struct sk_buff *newskb;

yup - the rx_copybreak support is exactly what I'm talking about.
tulip driver has similar support.

> /* Copy frames shorter than rx_copybreak, otherwise pass on up in
>  * a full sized sk_buff.  Value of 100 stolen from tulip.c (!alpha).
>  */
> static int rx_copybreak = 100;

The comment is wrong. Tulip uses 1518 for nearly everything but x86.
ie it copies all packets since the MTU is <= 1518.


> This last notice seems what I am loocking for?
> Have you a better idea then try and test (ie rx_copybreak=512, test, rx_copybreak=256,
> ... and btw rx_copybreak = PKT_BUF_SZ == 1536)?
> Or is it better to tiddle code before?

I don't know. It depends on if/when the misaligned access happens.
It's possible the misaligned access is less expensive than
the full copy on your machine.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F750482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 11:56:01 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 31282B007; Mon,  4 Jun 2001 18:52:34 +0100 (BST)
Date: Mon, 4 Jun 2001 18:52:34 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problems with 0.9 ISO Images from mkhppa1.esiee.fr
Message-ID: <20010604185234.Z25745@linuxcare.com>
References: <20010604170841.A8900@solo.franken.de> <20010604173924.A1043@excalibur.cologne.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010604173924.A1043@excalibur.cologne.de>; from parisc-linux@excalibur.cologne.de on Mon, Jun 04, 2001 at 05:39:24PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 04, 2001 at 05:39:24PM +0200, Karsten Merker wrote:
> I had some difficulties after the installation (with certain operations in
> vi I could repeatably crash the kernel and I got kernel panics on bootup
> when booting from harddisk), but both problems could be solved by using a
> current cvs kernel instead.

I think the vi problem can be avoided by changing the termtype.
See <http://bugs.parisc-linux.org/db/12/122.html>.

The kernel panics on boot are a known proboem with the sti
console.

> The only problem I had with the installation itself was that the dialog
> boxes looked a bit weird when using sticon.

Excellent, thanks very much for the report.

Richard

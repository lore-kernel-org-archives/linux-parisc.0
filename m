Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 232804840
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  4 Jan 2004 22:28:43 -0700 (MST)
Date: Sun, 4 Jan 2004 22:28:42 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Matt Lewis <nitephyre@iinet.net.au>
Subject: Re: [parisc-linux] Probem Installing: slang(version).deb corrupt
Message-ID: <20040105052842.GB612@colo.lackof.org>
References: <000801c3d1de$08e053d0$0101a8c0@nitephyre>
	<3FF6A74F.3000108@tiscali.be>
	<001f01c3d24b$5e810600$0101a8c0@nitephyre>
	<20040104045551.GA16904@colo.lackof.org>
	<000a01c3d28b$91046fa0$0101a8c0@nitephyre>
	<3FF7FD86.8000208@tiscali.be>
	<000a01c3d2bd$65441b40$0101a8c0@nitephyre>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000a01c3d2bd$65441b40$0101a8c0@nitephyre>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Jan 04, 2004 at 10:22:15PM +1000, Matt Lewis wrote:
> so, it seems that my only soloution is to try and install via serial cable? :|

Not "via". Use serial cable to get a working serial console.
Use the 70MB iso you already have and try again to install.

Disconnect the USB keyboard, and cycle power on the C3000.
When it comes up, PDC (firmware) should be talking to the
Serial Port 1 by default.

BTW, which 70MB ISO did you grab?
Can you post the complete URL?

grant

Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0A8348BF
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  5 Jan 2004 11:25:00 -0700 (MST)
Date: Mon, 5 Jan 2004 11:24:59 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Matt Lewis <nitephyre@iinet.net.au>
Subject: Re: [parisc-linux] Probem Installing: slang(version).deb corrupt
Message-ID: <20040105182459.GB9004@colo.lackof.org>
References: <000801c3d1de$08e053d0$0101a8c0@nitephyre>
	<3FF6A74F.3000108@tiscali.be>
	<001f01c3d24b$5e810600$0101a8c0@nitephyre>
	<20040104045551.GA16904@colo.lackof.org>
	<000a01c3d28b$91046fa0$0101a8c0@nitephyre>
	<3FF7FD86.8000208@tiscali.be>
	<000a01c3d2bd$65441b40$0101a8c0@nitephyre>
	<20040105052842.GB612@colo.lackof.org>
	<01d101c3d362$217cf940$0101a8c0@nitephyre>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01d101c3d362$217cf940$0101a8c0@nitephyre>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Jan 05, 2004 at 06:01:30PM +1000, Matt Lewis wrote:
> ftp.parisc-linux.org/cd-images/testing/auto-isos/isos/palinux-2.4.21-pa6-20030718-netinst.iso

Matt,
that should be sufficient to do an install.


Thibaut/ESIEE,
Any chance someone could roll ISOs which uses 2.4.23+memremap+rtc fixes?
lamont is building a new 2.4.23 debian kernel you could use.

and I noticed:
	You are now connected to:
	Linux greg 2.4.18-pa45 #3 Mon Jul 1 10:45:09 CEST 2002 parisc GNU/Linux 

2.4.18 has lots of security holes.
I suggest you guys update those systems before bad things happen.

thanks,
grant

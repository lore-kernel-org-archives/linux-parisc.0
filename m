Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 520D3485D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 02:06:05 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 061B1B00C; Mon, 24 Sep 2001 09:04:46 +0100 (BST)
Date: Mon, 24 Sep 2001 09:04:46 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Tilman Baumann <Simsalabimson@web.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] hp715-50 scorpio - this is the real emailaddress
Message-ID: <20010924090446.D5051@linuxcare.com>
References: <01092222265101.03631@tilli>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01092222265101.03631@tilli>; from Simsalabimson@web.de on Sat, Sep 22, 2001 at 10:26:51PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 22, 2001 at 10:26:51PM +0200, Tilman Baumann wrote:
> hi, can anyone of you tell me, if it makes sense to install parisc-linux on 
> my machine?
> I have a hp715-50 scorpio.

Linux will work quite well on that machine, but you may have to run
with a serial console, as Linux doesn't support graphics on all
hardware yet.  Also, Linux doesn't support EISA cards on any parisc
boxes yet, so it you have any of those they wont work.

Richard

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDEF1482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 03:59:48 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2DAADB00C; Tue, 17 Jul 2001 10:57:52 +0100 (BST)
Date: Tue, 17 Jul 2001 10:57:52 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Yan Han <yhan@uwo.ca>
Cc: Michael_Handrich@gmx.de, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] not supported by 0.9 version
Message-ID: <20010717105752.Q30356@linuxcare.com>
References: <000801c10e2e$bb1dee70$d10c6481@HCI009>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000801c10e2e$bb1dee70$d10c6481@HCI009>; from yhan@uwo.ca on Mon, Jul 16, 2001 at 03:37:20PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jul 16, 2001 at 03:37:20PM -0400, Yan Han wrote:
> Hi! we tried to install 0.9 version in 715/33. It doesn't work. 
> 
> so use "rbootd" to boot up the machine.

For 715/33, 715/50, and 715/75, you should use the 0.9.2 ISO, as it
contains a fixed glibc, needed for the older processors in these boxes.
See <http://mkhppa1.esiee.fr/download.html>.  I have always booted
via rbootd on my 715/75, never tried a CDROM boot.

Richard

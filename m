Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20038482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Jun 2001 07:42:52 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CBE6EB00C; Mon, 25 Jun 2001 14:43:19 +0100 (BST)
Date: Mon, 25 Jun 2001 14:43:19 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] boot-floppies build status
Message-ID: <20010625144319.P14416@linuxcare.com>
References: <20010623170024.G14416@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010623170024.G14416@linuxcare.com>; from rhirst@linuxcare.com on Sat, Jun 23, 2001 at 05:00:25PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jun 23, 2001 at 05:00:25PM +0100, Richard Hirst wrote:
> slang...  to get rid of the problems with slang.so references I had
> to
> 
> build and install slang1, slang1-dev, slang1-pic
> build and install libnewt0, libnewt-dev, libnewt-pic
> build and install whiptail
> build and install util-linux
> build nano-tiny

and tasksel is built against a bad slang1 also.

Richard

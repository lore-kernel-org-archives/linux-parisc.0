Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id E01D8482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 03:15:35 -0600 (MDT)
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA02338
	for <parisc-linux@puffin.external.hp.com>; Sun, 2 Sep 2001 03:13:28 -0600
Received: from pc1-hems4-0-cust107.bre.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.107)
  by mailserv2.iuinc.com with SMTP; 2 Sep 2001 09:15:38 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 85C55B00C; Sun,  2 Sep 2001 10:15:56 +0100 (BST)
Date: Sun, 2 Sep 2001 10:15:56 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: James Waterhouse <james.waterhouse@videotron.ca>
Cc: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>,
	"debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>
Message-ID: <20010902101556.W11744@linuxcare.com>
References: <3B8FB5EF.3020301@videotron.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B8FB5EF.3020301@videotron.ca>; from james.waterhouse@videotron.ca on Fri, Aug 31, 2001 at 12:06:07PM -0400
Subject: [parisc-linux] Re: booting problems
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 31, 2001 at 12:06:07PM -0400, James Waterhouse wrote:
> Hello everyone,
> 	I'm seem to be having trouble booting into linux on my 712/60. I hope 
> someone can help. I have built a new kernel (from cvs) and also set up 
> an nfs root. When I try to boot the linux boots up to the point where it 
> says "Cleaning: /tmp/ /var/lock /var/run" and then it just hangs. Any 
> idea what is cause it to hang? Could there be a problem with the nfsroot?

Possible.  What are you using for your nfsroot?  Does it still respond
to pings?  What console are you using?  Do you get a prompt if you
boot with 'init=/bin/sh'?

Richard

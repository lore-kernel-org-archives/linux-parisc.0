Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1EC6482A
	for <parisc-linux@parisc-linux.org>; Fri, 10 Aug 2001 11:22:06 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 5E3F5B00C; Fri, 10 Aug 2001 18:23:04 +0100 (BST)
Date: Fri, 10 Aug 2001 18:23:04 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] The final patch for the keyboard problem
Message-ID: <20010810182304.H23676@linuxcare.com>
References: <3B6F986D.FA89E147@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B6F986D.FA89E147@esiee.fr>; from marteaut@esiee.fr on Tue, Aug 07, 2001 at 09:27:41AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 07, 2001 at 09:27:41AM +0200, Thomas Marteau wrote:
> Hi all,
> 
> 	It is my last patch solving the keyboard problem on BXXX and CXXX. It

With this patch applied my B180 hangs in init_keyb(), if there is no
keyboard attached.  I was trying to boot a 2.4.7 kernel based installer.

Richard.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc3-hems4-0-cust183.bre.cable.ntl.com [213.107.179.183])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4F15482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Oct 2001 00:49:10 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C299EB00C; Fri, 19 Oct 2001 07:49:16 +0100 (BST)
Date: Fri, 19 Oct 2001 07:49:16 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: =?iso-8859-1?Q?DUTOT_St=E9phane?= <stephane.dutot@exlicite.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PPTP and PPPOE under Debian HPPA Linux.
Message-ID: <20011019074916.V11105@linuxcare.com>
References: <01a501c1565e$c9ce4e60$9601a8c0@utopia> <20011018224644.U11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011018224644.U11105@linuxcare.com>; from rhirst@linuxcare.com on Thu, Oct 18, 2001 at 10:46:44PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 18, 2001 at 10:46:44PM +0100, Richard Hirst wrote:
> I've just had a look at this.  Seems to be a problem related to
> the kernel trying to invoke non-existant usermode helper progs.
> 
> I created a script /sbin/hotplug containing just
> 
> 
> #!/bin/sh
> echo hotplug: $* > /dev/console
> 

Don't forget to chmod +x that script.

> and my kernel no longer crashes when trying to establish an async
> ppp link.  Instead, I get this in syslog:

The real problem there was that I was using the wrong authentication
method for my isp.  Once I set that right the link came up.

Richard

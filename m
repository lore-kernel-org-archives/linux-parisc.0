Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id CEDF24829
	for <parisc-linux@parisc-linux.org>; Fri,  6 Dec 2002 09:22:32 -0700 (MST)
Date: Fri, 6 Dec 2002 11:22:27 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: lamont@hp.com
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] towards unattended reboot
Message-ID: <20021206162227.GB8611@systemhalted>
References: <20021206135243.GA20175@b180.mmjgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021206135243.GA20175@b180.mmjgroup.com>
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

> Q: Given a 2.4.19 kernel, how do you get it to automatically reboot on crash?
> 
> A: see below.  The first one breaks the loop on dumping the stack.  The
>    second part resets the machine in parisc_terminate().

Looks awesome in my opinion. I've needed something like this for my
cluster, it gets anyone when machines don't reset on crash :)

Though having this be optional seems like an important feature to add.

c.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id C35A1482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Nov 2002 09:12:38 -0700 (MST)
Date: Fri, 8 Nov 2002 11:12:25 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Berthold Gunreben <b.gunreben@web.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nanosleep
Message-ID: <20021108161225.GD2402@systemhalted>
References: <200211081116.gA8BGuX28978@mailgate5.cinetic.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211081116.gA8BGuX28978@mailgate5.cinetic.de>
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

> Hi List,         
> I tried to compile glibc2.3.1, and have some problems with the threading support there.     
> When using perl with the new glibc on a C240, things seem to work without problems. On    
> a 715/33, I get (probably) endless loops with lots of sched_yield() calls.    
     
glibc 2.3.1 from debian CVS or upstream?

c.

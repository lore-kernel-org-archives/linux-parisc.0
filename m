Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 213EB4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 14:55:22 -0600 (MDT)
Date: Fri, 20 Sep 2002 16:55:18 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350
Message-ID: <20020920205518.GB25844@systemhalted>
References: <20020920203724.GD24622@systemhalted> <200209202046.g8KKkGwj019921@hiauly1.hia.nrc.ca> <20020920205012.GF4909@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020920205012.GF4909@tausq.org>
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

> > Is there a way to turn off the unaligned handler?  It may be hiding
> > bad stuff going on in userland.  There are still cases where expect
> > causes a continuous sequence of unaligned faults.
> 
> not at runtime, but i can build a kernel with this turned off and let
> you test it.
> 
> randolph

Would be nice to have a proc interface for this.
I would like to do consecutive testing with it 
enabled and disabled.

c.

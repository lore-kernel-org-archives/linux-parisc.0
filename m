Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B5DE4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Feb 2003 18:34:02 -0700 (MST)
Date: Sat, 8 Feb 2003 16:56:08 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>, grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
Message-ID: <20030209005608.GR11363@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030208232303.B27544@parcelfarce.linux.theplanet.co.uk> <200302090035.h190ZJYC012838@hiauly1.hia.nrc.ca> <20030209004942.GQ11363@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030209004942.GQ11363@tausq.org>
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

> lock(l1)
> do something
> unlock(l1)
> 
> lock(l2)
> do something else
> unlock(l2)
> 
> will gcc ever move the lock(l2) before the unlock(l1)? 

well, bad example, since l1 and l2 are both volatile, but in general,
nothing will prevent part of "do something else" to happen inside the l1
lock, right?

randolph

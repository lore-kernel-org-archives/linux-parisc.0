Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 174D0482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 15:51:11 -0600 (MDT)
Date: Fri, 20 Sep 2002 14:51:47 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, jeremyd@apptechsys.com,
	frts@simba.sch.bme.hu, grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350
Message-ID: <20020920215147.GG4909@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020920205012.GF4909@tausq.org> <200209202056.g8KKu0XM019968@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200209202056.g8KKu0XM019968@hiauly1.hia.nrc.ca>
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

> Is there any software that actually needs the unaligned handler?
> I think it would be useful for test purposes to have a kernel with
> it off.

off the top of my head....

in the kernel, the usb driver has some unaligned accesses.

in userspace, several of the network utilities (tcpdump, nmap, etc) make
unaligned accesses

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

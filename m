Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4839F482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 09:03:29 -0600 (MDT)
Date: Wed, 23 Oct 2002 08:06:20 -0700
From: Randolph Chung <randolph@tausq.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] insmod modules -> kernel panic:
Message-ID: <20021023150619.GE22052@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3DB68404.549D048A@admin.france.hp.com> <3DB6B01B.61D240D@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DB6B01B.61D240D@admin.france.hp.com>
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

In reference to a message from Bruno Vidal, dated Oct 23:
> 	hi
> It seems to be a weird problem. I've recompile everything
> (make clean && make dep && make vmlinux && make modules && make modules_install)
> And:
> -A-class: 64bits compilation, it panic, but not at the same place than before:

Hi Bruno,

We seem to be having some general problems with insmod causing random
crashes. I would suggest that you stick with building things into the
kernel instead of modules for a little while until we figure out the
insmod problem.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

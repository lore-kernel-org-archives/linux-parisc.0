Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail15.speakeasy.net [216.254.0.215])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E7A3482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Jun 2002 11:21:48 -0600 (MDT)
Date: Wed, 5 Jun 2002 10:21:32 -0700
From: Randolph Chung <randolph@tausq.org>
To: joel.soete@freebel.net
Cc: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020605172132.GC29187@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020529132631.B3691@systemhalted> <20020529180739.GL9919@tykepenguin.com> <20020530143626.GF810@tykepenguin.com> <20020530133515.B15631@systemhalted> <20020531072849.GD1145@tykepenguin.com> <20020531085419.B18658@systemhalted> <20020604115547.GB1808@tykepenguin.com> <20020604084440.A24973@systemhalted> <20020604154954.GA29187@tausq.org> <1023292640.3cfe34e07e65b@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1023292640.3cfe34e07e65b@webmail.tiscalinet.be>
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

> Mine is now:
> CONFIG_MAGIC_SYSRQ=Y
> CONFIG_KDB=Y
> CONFIG_KDB_MODULES=Y
> # CONFIG_KDB_OFF IS NOT SET
> CONFIG_KALLSYMS=Y
> 

that looks fine.

randolph

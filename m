Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id E973F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 05:39:04 -0600 (MDT)
Date: Fri, 7 Jun 2002 07:36:58 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] strange message with insmod
Message-ID: <20020607073658.A10393@systemhalted>
References: <3CFF72D7.30FA7556@admin.france.hp.com> <1023381362.3cff8f72ec461@webmail.tiscalinet.be> <3D006C09.164DF254@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D006C09.164DF254@admin.france.hp.com>; from bruno_vidal@hpfrcu03.france.hp.com on Fri, Jun 07, 2002 at 10:17:13AM +0200
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

> 	Hi
> I think I found where the problem is. In order to add debug info
> for P4, I've add in the main Makefile: -gdwarf-2. I've remove this
> debug option, and now everything is okay. I think that this option is
> creating too much debug informations. Does someone has already try
> to investiguate a solution in order to add debug information, without
> creating soooo much information ?
> 
> 	Thanks.
>

GCC 3.2 is the only branch that has dwarf2 support for HPPA?
You'll have to live with stabs.

ATM I'm trying to find out why 3.1/3.2 produces slightly twisted
kernel net code, and subsequently causing an oops.

c. 

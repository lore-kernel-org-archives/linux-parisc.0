Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF0C6482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 11:12:22 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ombykaaa for parisc-linux@lists.parisc-linux.org; Tue, 22 Jan 2002 11:12:22 -0700
Date: Tue, 22 Jan 2002 10:11:53 -0800
From: Randolph Chung <randolph@tausq.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] vmlinux header for savecrash.
Message-ID: <20020122181153.GG3247@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3C4C53B7.67DA24E@admin.france.hp.com> <20020121202539.994A5482A@dsl2.external.hp.com> <3C4D2EFB.F82671C2@admin.france.hp.com> <20020122174533.38418482A@dsl2.external.hp.com> <3C4DA793.B17F1D3C@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C4DA793.B17F1D3C@admin.france.hp.com>
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

In reference to a message from Bruno Vidal, dated Jan 22:
> 	Hi
> I don't know how to retrieve option pass to the kernel,
> but give me some clue, and I'll add this information in
> the dump header asap, because it is a really good idea :-)

static char *boot_kernel = "/boot/vmlinux";
MODULE_PARM(boot_kernel, "s")
MODULE_PARM_DESC(boot_kernel, "Boot kernel path")

then i guess somehwere in your dump code strcpy boot_kernel to a known
location in the dump.

of course we still need to change palo to do this (pass the
parameter)... paul, any comments?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C037482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 10:54:11 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id dlzxkaaa for parisc-linux@lists.parisc-linux.org; Tue, 22 Jan 2002 10:54:11 -0700
Date: Tue, 22 Jan 2002 09:53:32 -0800
From: Randolph Chung <randolph@tausq.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] vmlinux header for savecrash.
Message-ID: <20020122175332.GF3247@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3C4C53B7.67DA24E@admin.france.hp.com> <20020121202539.994A5482A@dsl2.external.hp.com> <3C4D2EFB.F82671C2@admin.france.hp.com> <20020122174533.38418482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020122174533.38418482A@dsl2.external.hp.com>
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

> Randolph Chung and I were wondering if dump driver could save a
> parameter passed in by palo: eg "boot_kernel=/boot/vmlinux-pa11".
> I haven't checked if something like that already exists.

Is this really an arch-dependent problem? How do other architectures (I
think lkcd works on i386 and alpha?) do this?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

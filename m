From: David Mosberger <davidm@napali.hpl.hp.com>
Subject: [parisc-linux] Re: [Linux-ia64] Linux, Itanium and PA/RISC
Date: Mon, 24 Mar 2003 11:19:08 -0800
Message-ID: <15999.23084.647629.868320__2517.4091374085$1416622324$gmane$org@napali.hpl.hp.com>
References: <001f01c2f1f1$e772d4b0$6620a4d5@tsatec.int>
	<20030324121037.GI31008@parcelfarce.linux.theplanet.co.uk>
Reply-To: davidm@hpl.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Adriano Galano <adriano@satec.es>, linux-ia64@linuxia64.org,
	parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030324121037.GI31008@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>>>>> On Mon, 24 Mar 2003 12:10:37 +0000, Matthew Wilcox <willy@debian.org> said:

  Matthew> On Mon, Mar 24, 2003 at 11:41:18AM +0100, Adriano Galano
  Matthew> wrote:
  >> Hi all:

  >> I read that IA-64 support PA-RISC instruction mapping. That's
  >> mean that I can use Linux for PA/RISC
  >> (http://www.parisc-linux.org/) in a Itanium 2 computer?

  Matthew> No.  You certainly can't run a PA-RISC kernel on an IA64
  Matthew> box, just like you can't run an x86 kernel on an ia64 box.

Ugh, that's not strictly true.  You definitely can boot x86 linux and
windows 98 on Itanium.  I believe the same is true for Itanium 2 if
you have Intel's firmware, though I have never tried that myself.

	--david

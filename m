Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta05ps.bigpond.com (mta05ps.bigpond.com [144.135.25.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F766486C
	for <parisc-linux@parisc-linux.org>; Sun, 23 Feb 2003 23:24:25 -0700 (MST)
Received: from bubble.local ([144.135.25.78]) by
          mta05ps.bigpond.com (Netscape Messaging Server 4.15 mta05ps Jul
          16 2002 22:47:55) with SMTP id HASV4L00.E6M for
          <parisc-linux@parisc-linux.org>; Mon, 24 Feb 2003 16:24:21 +1000
Date: Mon, 24 Feb 2003 16:54:21 +1030
From: Alan Modra <amodra@bigpond.net.au>
To: Matthew Wilcox <willy@debian.org>
Cc: binutils@sources.redhat.com, parisc-linux@parisc-linux.org
Message-ID: <20030224062421.GA31111@bubble.sa.bigpond.net.au>
References: <20030223185847.C2938@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030223185847.C2938@parcelfarce.linux.theplanet.co.uk>
Subject: [parisc-linux] Re: [PATCH] space register 0 changes for hppa
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

On Sun, Feb 23, 2003 at 06:58:47PM +0000, Matthew Wilcox wrote:
> +	* hppa-dis.c: Do not emit a space register if the space register
> +	field is 2 bits and the value is 0 as this is implicit addressing,
> +	not use of space register 0.

Hi Matthew,
  ChangeLog entries shouldn't be sent as diffs.  Write this one as

	* hppa-dis.c (print_insn_hppa <2 bit space register>): Do not print
	the space register when the value is zero.

and put the reason for the change as a comment in the code if you feel
you need some justification for the change.

Did you run the binutils testsuite?

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre

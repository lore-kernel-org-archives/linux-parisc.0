Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A3B5A4832
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jan 2002 10:52:29 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16OjN2-0008WT-00; Thu, 10 Jan 2002 17:52:08 +0000
Date: Thu, 10 Jan 2002 17:52:08 +0000
From: Matthew Wilcox <willy@debian.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] binutils: opcodes and bfd
Message-ID: <20020110175208.A32712@parcelfarce.linux.theplanet.co.uk>
References: <3C3DCF11.19BC5E24@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C3DCF11.19BC5E24@admin.france.hp.com>; from bruno_vidal@hpfrcu03.france.hp.com on Thu, Jan 10, 2002 at 06:27:45PM +0100
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

On Thu, Jan 10, 2002 at 06:27:45PM +0100, Bruno Vidal wrote:
> First, thanks for your feedback, now the dump modules is working fine.
> The system is able to dump. But now I need to modify the tool to retrieve
> the dump. But I need bfd and opcode: libbfd.a and libopcode.a. It is part
> of the binutil package. But in the last debian package this two librairies
> are missing. And on CVS tree, there is no more binutil src. Where can I
> find the latest binutil src, or where can I find a binutil package with
> this two libraires. Another small problem, when using yacc on parisc
> (ie: bison), the result is not the same on a i386 and parisc :-(.
> I'll try tomorrow to recompile yacc.

sounds like you're missing the binutils-dev package.

what's the problem with yacc?

-- 
Revolutions do not require corporate support.

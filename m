Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E618F482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Apr 2002 08:06:12 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16zeSD-0005pK-00; Mon, 22 Apr 2002 15:06:05 +0100
Date: Mon, 22 Apr 2002 15:06:05 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?Bruno_L=E9on?= <nonolemono@yahoo.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to install emacs 21.2 on a B180L
Message-ID: <20020422150605.O5225@parcelfarce.linux.theplanet.co.uk>
References: <200204220914.g3M9E8S07303@iut-lannion.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <200204220914.g3M9E8S07303@iut-lannion.fr>; from nonolemono@yahoo.fr on Mon, Apr 22, 2002 at 11:13:02AM +0200
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

On Mon, Apr 22, 2002 at 11:13:02AM +0200, Bruno Léon wrote:
> I'm trying to install emacs 21.2 on a B180L,  but I can't compile the sources.
> The system tells me that "emacs hasn't been ported on
> hppa-unknown-linux-system".

   emacs21 |     21.2-1 |      unstable | source, alpha, arm, hppa, i386, ia64, m68k, mips, mipsel, powerpc, s390, sparc

so you can simply apt-get install emacs21.  Presumably the debian package
has patches to allow emacs to compile on hppa-linux.

-- 
Revolutions do not require corporate support.

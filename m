Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9509C4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Aug 2002 12:44:46 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17eKBJ-0007RI-00; Mon, 12 Aug 2002 19:44:45 +0100
Date: Mon, 12 Aug 2002 19:44:45 +0100
From: Matthew Wilcox <willy@debian.org>
To: Harri Haataja <harri.haataja@cs.helsinki.fi>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Additional Network Cards for 712
Message-ID: <20020812194445.Q27578@parcelfarce.linux.theplanet.co.uk>
References: <OFF5A919B5.02CBBDDB-ONC1256C13.0060CB62@hasler.ascom.ch> <20020812191247.P27578@parcelfarce.linux.theplanet.co.uk> <20020812211608.B37236@azrael.smilehouse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020812211608.B37236@azrael.smilehouse.com>; from harri.haataja@cs.helsinki.fi on Mon, Aug 12, 2002 at 09:16:10PM +0300
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

On Mon, Aug 12, 2002 at 09:16:10PM +0300, Harri Haataja wrote:
> Did 712 have EISA? Anyway, 715 does. Are there any (E)ISA cards
> supported by the linux kernel? Is there an HCL for cards?

712 did not have EISA, it wouldn't've fitten in the form factor.
Some ISA/EISA network cards have drivers that can cope with a big-endian
machine.  I've used a 100VG card in a 715 myself.  There's no real HCL
for cards... someone want to write one?  ;-)

-- 
Revolutions do not require corporate support.

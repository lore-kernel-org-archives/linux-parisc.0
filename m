From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] fpu emulation: another stupid question
Date: Fri, 14 Jan 2005 11:02:33 -0500
Message-ID: <20050114160233.GQ1281@baldric.uwo.ca>
References: <41DE4A3A0000261D@mail-1-bnl.tiscali.it>
	<20050114124102.GE30982@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050114124102.GE30982@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > So do we need the emaulation code in our kernel?
> 
> The emulation code also handles conditions that are not implemented by the
> hardware.  I forget what they are exactly; some of the 128-bit wide FP
> ops and some operations involving denormalised or infinite numbers.

Doesn't it also happen to handle cases where the operands are not
aligned properly?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

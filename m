From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] fpu emulation: another stupid question
Date: Fri, 14 Jan 2005 17:11:32 -0800
Message-ID: <20050115011132.GB18497@tausq.org>
References: <41DE4A3A0000261D@mail-1-bnl.tiscali.it>
	<20050114124102.GE30982@parcelfarce.linux.theplanet.co.uk>
	<20050114160233.GQ1281@baldric.uwo.ca>
	<20050114160408.GK30982@parcelfarce.linux.theplanet.co.uk>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050114160408.GK30982@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Doesn't it also happen to handle cases where the operands are not
> > aligned properly?
> 
> I'd've thought that'd be the unaligned trap handler rather than the FP
> emulation code, but you may be right -- I don't care to look too hard ;-)

willy is right, the unaligned trap handler handles this case.

the fp emulation code also handles some fp format conversions. if you
look in the archives you'll find a test case that is very very slow on
pa-linux compared to hpux. it's something that should be looked into at
some point.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2ED89482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Nov 2001 10:16:14 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 166EVA-0000mc-00; Tue, 20 Nov 2001 17:16:04 +0000
Date: Tue, 20 Nov 2001 17:16:04 +0000
From: Matthew Wilcox <willy@debian.org>
To: Helge Deller <helge.deller@sap.com>
Cc: "Pedot, Wolfgang" <wpedot@harris.com>,
	'Parisc Linux Mailinglist' <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 2.4.14 and ISA-NE2000 StackDump
Message-ID: <20011120171604.F652@parcelfarce.linux.theplanet.co.uk>
References: <8D4C69676E66D511A1CB00508BBBB1921627EE@ranmx1.ran.harris.com> <E166EPy-0004Bn-00@linuxlab.wdf.sap-ag.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E166EPy-0004Bn-00@linuxlab.wdf.sap-ag.de>; from helge.deller@sap.com on Tue, Nov 20, 2001 at 06:10:41PM +0100
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

On Tue, Nov 20, 2001 at 06:10:41PM +0100, Helge Deller wrote:
> Hi Wolfgang,
> 
> No, the 715/64 has a PA7100LC processor and thus is 32bit only machine.
> I'm running a 32bit kernel too, but maybe 715/old (as yours) and 715/new
> machines (as mine) work different. IIRC the 715/old has an ASP and the
> 715/new have a LASI chip. Maybe you could send me your whole dmsg
> and I'll take a look again.

Not only that, the EISA adapter in the 715/new is Wax and that in 715/old
is Mongoose (maybe Outfield, but I think that was in 735/755).

-- 
Revolutions do not require corporate support.

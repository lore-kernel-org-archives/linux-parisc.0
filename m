Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 55F15483F
	for <parisc-linux@lists.parisc-linux.org>; Sun, 31 Mar 2002 19:07:38 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16rrEP-0000cH-00; Mon, 01 Apr 2002 03:07:37 +0100
Date: Mon, 1 Apr 2002 03:07:37 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: ccollet@gmu.edu, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux semi-booting on an HP 3000 947
Message-ID: <20020401030737.L7279@parcelfarce.linux.theplanet.co.uk>
References: <271520c2711900.2711900271520c@gmu.edu> <20020401021652.J7279@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020401021652.J7279@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Mon, Apr 01, 2002 at 02:16:52AM +0100
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

On Mon, Apr 01, 2002 at 02:16:52AM +0100, Matthew Wilcox wrote:
> According to my search of the mailing list archives, it's equivalent to a
> G30 in HPUX land.  The console driver is indeed the problem.  You could
> use Christoph Plattner's hack to get console output, but I'm not sure
> what other devices you might have that would work.  Probably the ethernet
> will work, and the SCSI won't.

Oops, got confused between G and E class.  G class has NIO lan, console
and scsi, so you're basically completely hosed.

-- 
Revolutions do not require corporate support.

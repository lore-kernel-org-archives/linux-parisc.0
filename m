Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4527E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 23:47:12 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15ch94-0006uV-00; Fri, 31 Aug 2001 06:47:10 +0100
Date: Fri, 31 Aug 2001 06:47:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.9-pa10 hangs on c200+ after 'branching to kernel entry point'
Message-ID: <20010831064710.G30497@parcelfarce.linux.theplanet.co.uk>
References: <20010830215714.A19233@middle.of.nowhere> <20010830210933.D30497@parcelfarce.linux.theplanet.co.uk> <20010831065732.B4816@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010831065732.B4816@middle.of.nowhere>; from thunder7@xs4all.nl on Fri, Aug 31, 2001 at 06:57:32AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 31, 2001 at 06:57:32AM +0200, thunder7@xs4all.nl wrote:
> Where can I find any info on 'the current serial port snafu'? Is this
> the same problem as mentioned on the 5th of August 'more serial problems
> on D310' ?

http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2001-August/029567.html
it almost certainly is the same problem which was reported by the D310 owner.

fyi, i committed option 1 earlier today.

-- 
Revolutions do not require corporate support.

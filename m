Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39137482F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Apr 2002 17:30:37 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 171FAc-0005Tz-00; Sat, 27 Apr 2002 00:30:30 +0100
Date: Sat, 27 Apr 2002 00:30:30 +0100
From: Matthew Wilcox <willy@debian.org>
To: Dunc <dunc@lemonia.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] hp9000/827s
Message-ID: <20020427003030.B12051@parcelfarce.linux.theplanet.co.uk>
References: <1019862967.3cc9dfb797e86@www.lemonia.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1019862967.3cc9dfb797e86@www.lemonia.org>; from dunc@lemonia.org on Sat, Apr 27, 2002 at 12:16:07AM +0100
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

On Sat, Apr 27, 2002 at 12:16:07AM +0100, Dunc wrote:
> I have been attempting to install on a hp9000/827s

According to hp9000_models;
8x7/F10-I40      Old Nova servers    PCXS    NIO, None     NIO(1),NIO(2),NA

Basically, nothing is going to work.  There's some limited support for
the console in these machines, but no support for the SCSI, the Lan or
any other cards.  Sorry.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3FA4B4854
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 13:13:12 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16ksdx-0004lH-00; Tue, 12 Mar 2002 20:13:09 +0000
Date: Tue, 12 Mar 2002 20:13:09 +0000
From: Matthew Wilcox <willy@debian.org>
To: Gururaj Ananthateerta <gururaj@cup.hp.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Switch console error.
Message-ID: <20020312201309.H30538@parcelfarce.linux.theplanet.co.uk>
References: <3C8E5DCD.942E6278@cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C8E5DCD.942E6278@cup.hp.com>; from gururaj@cup.hp.com on Tue, Mar 12, 2002 at 11:58:06AM -0800
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

On Tue, Mar 12, 2002 at 11:58:06AM -0800, Gururaj Ananthateerta wrote:
> I guess that I may have ommitted some console drivers during building my
> kernel.
> Anyine has nay clue about this.

I would assume CONFIG_SERIAL_CONSOLE is the option you're missing.
Another option might be CONFIG_SERIAL, but I suspect you turned on
support for your serial ports :-)

> I am using the following machines.
> HP-N Class server.

N class isn't supported.  There are a number of problems which need to
be solved to support N class...

> I searched the mailing list, but didn't get anything specific.

I'm surprised, I thought this was in the FAQ.

-- 
Revolutions do not require corporate support.

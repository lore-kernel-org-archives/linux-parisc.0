Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61410482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 09:40:28 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 165rT8-0003UV-00; Mon, 19 Nov 2001 16:40:26 +0000
Date: Mon, 19 Nov 2001 16:40:26 +0000
From: Matthew Wilcox <willy@debian.org>
To: Richard Allen <ra@hp.is>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] What does this one mean ?
Message-ID: <20011119164026.B1835@parcelfarce.linux.theplanet.co.uk>
References: <20011119163421.A14821@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011119163421.A14821@hp.is>; from ra@hp.is on Mon, Nov 19, 2001 at 04:34:22PM +0000
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

On Mon, Nov 19, 2001 at 04:34:22PM +0000, Richard Allen wrote:
> do_page_fault() pid=27461 command='rpm' type=6 address=0x6bc63f53

looks like it branched to hyperspace.  "k\AE?S" as a string, so it's
not obviously ascii.  looks like it came from 0x0007c04f, so that might
be a good place to start tracing.

maybe rpm is broken (who would notice?  i can't imagine many people are
using rpm on hppa :-) -- tried recompiling it?

-- 
Revolutions do not require corporate support.

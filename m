Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B7514829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 08:55:33 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 186CEd-0008Hj-00; Mon, 28 Oct 2002 15:55:23 +0000
Date: Mon, 28 Oct 2002 15:55:23 +0000
From: Matthew Wilcox <willy@debian.org>
To: jsoe0708@tiscali.be
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19-pa24 (uaccess.h patch) [was: mkfs.xfs failled]
Message-ID: <20021028155523.O27461@parcelfarce.linux.theplanet.co.uk>
References: <3DB5755500001056@ocpmta7.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DB5755500001056@ocpmta7.be.tiscali.com>; from jsoe0708@tiscali.be on Mon, Oct 28, 2002 at 03:22:31PM +0100
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

On Mon, Oct 28, 2002 at 03:22:31PM +0100, jsoe0708@tiscali.be wrote:
> PS: Can you explain the willy's idea on how to replace ex_table?

ex_table is used for recovering from a page fault.  i don't see how we
can take a page fault when copying to kernel ram.

-- 
Revolutions do not require corporate support.

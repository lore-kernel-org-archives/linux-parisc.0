Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A981B4849
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Apr 2002 09:25:40 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16zJDe-0005aL-00; Sun, 21 Apr 2002 16:25:38 +0100
Date: Sun, 21 Apr 2002 16:25:38 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <joel.soete@freebel.net>
Cc: Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.2 experimental debs
Message-ID: <20020421162538.G5225@parcelfarce.linux.theplanet.co.uk>
References: <3CC2B937.8020509@freebel.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3CC2B937.8020509@freebel.net>; from joel.soete@freebel.net on Sun, Apr 21, 2002 at 01:05:59PM +0000
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

On Sun, Apr 21, 2002 at 01:05:59PM +0000, Joel Soete wrote:
> "Stack pointer and cr30 do not correspond!
> Dumping virtual address stack instead
> 
> Dumping Stack from ... to ...:
> 
> Humm as it appends as well with telnet as ssh I suspect a inetd problem?

I'd bet on gcc-3.2 miscompiling something in the network part of the kernel,
personally.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE4D5482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 11:15:25 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16QY7C-0000LR-00; Tue, 15 Jan 2002 18:15:18 +0000
Date: Tue, 15 Jan 2002 18:15:18 +0000
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gpm 1.19.6-9 Broken?
Message-ID: <20020115181518.F19567@parcelfarce.linux.theplanet.co.uk>
References: <1011117789.3c446eddddc77@webmail.tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1011117789.3c446eddddc77@webmail.tiscali.be>; from joel.soete@freebel.net on Tue, Jan 15, 2002 at 07:03:09PM +0100
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

On Tue, Jan 15, 2002 at 07:03:09PM +0100, joel.soete@freebel.net wrote:
> I do my daily apt-get dist-upgrade which update my gpm package to release indice
> -9 and it failled to start with daemons.log following error messages:

I suggest you file a bug against the debian gpm package (see
http://www.debian.org/Bugs/).  Since you've clearly narrowed it down to
gpm, it's really up to that package's maintainer.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92ED94857
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Jun 2002 07:45:47 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17ND72-0001pY-00; Wed, 26 Jun 2002 14:45:36 +0100
Date: Wed, 26 Jun 2002 14:45:36 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>,
	Matt Taggart <taggart@carmen.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 24bit colour
Message-ID: <20020626144536.B28662@parcelfarce.linux.theplanet.co.uk>
References: <5.1.0.14.0.20020610084610.026cfc70@10.106.16.2> <20020610203815.8349B380D5@carmen.fc.hp.com> <1024391159.3d0ef7f7c3903@webmail.tiscalinet.be> <20020618121104.E9435@parcelfarce.linux.theplanet.co.uk> <1025099026.3d19c51207773@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1025099026.3d19c51207773@webmail.tiscalinet.be>; from joel.soete@freebel.net on Wed, Jun 26, 2002 at 03:43:46PM +0200
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

On Wed, Jun 26, 2002 at 03:43:46PM +0200, joel.soete@freebel.net wrote:
> Quoting Matthew Wilcox <willy@debian.org>:
> > it's probably less work to teach XFree86 how to talk to your gfx card
> > than it is to get the HPUX X server to run on Linux.
> 
> I would prefer also but is there any documentation about this interface?

i meant that it's probably less work to reverse-engineer the interface
and implement it in XFree86 than it is to get the HPUX X server working.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5370A4839
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Jun 2002 05:11:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17KGt6-0005ge-00; Tue, 18 Jun 2002 12:11:04 +0100
Date: Tue, 18 Jun 2002 12:11:04 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: Matt Taggart <taggart@carmen.fc.hp.com>,
	s-clarob@st-aidans.cumbria.sch.uk,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 24bit colour
Message-ID: <20020618121104.E9435@parcelfarce.linux.theplanet.co.uk>
References: <5.1.0.14.0.20020610084610.026cfc70@10.106.16.2> <20020610203815.8349B380D5@carmen.fc.hp.com> <1024391159.3d0ef7f7c3903@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1024391159.3d0ef7f7c3903@webmail.tiscalinet.be>; from joel.soete@freebel.net on Tue, Jun 18, 2002 at 11:05:59AM +0200
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

On Tue, Jun 18, 2002 at 11:05:59AM +0200, joel.soete@freebel.net wrote:
> Quoting Matt Taggart <taggart@carmen.fc.hp.com>:
> > The Color Recovery extension is only available in the HP-UX Xserver. No
> > one 
> > has been able to run the HP-UX Xserver on palinux yet.
> > 
> 
> Any idea howto:
> 1) install
> 2) configure
> 
> I would try something to make my b2000 internel fxe running X.

it's probably less work to teach XFree86 how to talk to your gfx card
than it is to get the HPUX X server to run on Linux.

-- 
Revolutions do not require corporate support.

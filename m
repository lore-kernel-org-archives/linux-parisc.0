Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dhcp23.swansea.linux.org.uk (pc1-cwma1-5-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1370E4872
	for <parisc-linux@lists.parisc-linux.org>; Sat, 30 Aug 2003 07:50:48 -0600 (MDT)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9) with ESMTP id h7UDnqra031176;
	Sat, 30 Aug 2003 14:49:52 +0100
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9/Submit) id h7UDno85031174;
	Sat, 30 Aug 2003 14:49:50 +0100
Subject: Re: [parisc-linux] Security Hole in binfmt_som.c ?
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Matthew Wilcox <willy@debian.org>
Cc: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <20030830131541.GI13467@parcelfarce.linux.theplanet.co.uk>
References: <3F509BBD.2040007@hrzpub.tu-darmstadt.de>
	 <20030830131541.GI13467@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Message-Id: <1062251389.31150.4.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Sat, 30 Aug 2003 14:49:50 +0100
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

On Sad, 2003-08-30 at 14:15, Matthew Wilcox wrote:
> On Sat, Aug 30, 2003 at 02:42:37PM +0200, Ruediger Scholz wrote:
> > binfmt_som.c:216:2: #error "Fix security hole before enabling me"
> > What's this message about?
> 
> I don't know.  I wish someone would tell me.  You'd think they'd have the
> decency to contact the person listed as the author at the top of the file.

Actually explanations were posted in the previous discussion on this on
parisc-list.

Someone has to do the equivalent of the 2.4.22 binfmt_elf changes if
neccessary so that another thread can't change the file handles or 
steal the exec fd being passed to the loader.

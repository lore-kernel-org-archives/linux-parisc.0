Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A04049E7
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Oct 2003 13:13:46 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AEDkG-0000Bi-AQ; Mon, 27 Oct 2003 20:13:44 +0000
Date: Mon, 27 Oct 2003 20:13:44 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Joel Soete <soete.joel@tiscali.be>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
Message-ID: <20031027201344.GE5172@parcelfarce.linux.theplanet.co.uk>
References: <3F9BFB00.5090008@tiscali.be> <20031026172531.GA32146@colo.lackof.org> <3F9C3154.4060105@tiscali.be> <3F9C3854.80001@tiscali.be> <20031027193911.GA16012@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031027193911.GA16012@colo.lackof.org>
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

On Mon, Oct 27, 2003 at 12:39:11PM -0700, Grant Grundler wrote:
> On Sun, Oct 26, 2003 at 09:10:44PM +0000, Joel Soete wrote:
> > How may I find and reset the speed setup of a nic (I mean which 10 or 
> > 100 Mb, half or full duplex)?
> 
> ethtool?

I know the lasi_82596 driver doesn't support ethtool yet.

Someone who was interested and had time & the right machine could do some
serious work on lasi_82596:

 - Get rid of "static struct net_device *netdevs[MAX_DRIVERS];"
 - Make it work on peecees and 680x0 too and then get rid of the original
   82596 driver.
 - Add ethtool support.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

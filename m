Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A52548C8
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Oct 2003 12:34:06 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AEZbP-0000mq-Q0; Tue, 28 Oct 2003 19:34:03 +0000
Date: Tue, 28 Oct 2003 19:34:03 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
Message-ID: <20031028193403.GK8874@parcelfarce.linux.theplanet.co.uk>
References: <3F98D67D00001BC1@ocpmta3.freegates.net> <3F9EC44D.6040106@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F9EC44D.6040106@tiscali.be>
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

On Tue, Oct 28, 2003 at 07:32:29PM +0000, Joel Soete wrote:
> Anyway:
>  # ethtool eth1
> Settings for eth1:
> No data available
>  # ethtool eth0
> Settings for eth0:
> No data available
> 
> Any idea (may be switching the two interfaces: I mean just change 
> interfaces)?

As I said, the lasi_82596 driver doesn't support ethtool.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4F7648D7
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Mar 2003 08:39:26 -0700 (MST)
Date: Thu, 20 Mar 2003 17:39:22 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: bruno_vidal@hp.com
Cc: Matthew Wilcox <willy@debian.org>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] struct page: page in use or not ?
Message-ID: <20030320153922.GB27039@marmite.its.uct.ac.za>
References: <3E789FE6.C9BB53CD@hp.com> <20030319170749.GX14520@parcelfarce.linux.theplanet.co.uk> <3E79A49C.81C188AA@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E79A49C.81C188AA@hp.com>
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

On Thu, Mar 20, 2003 at 12:23:08PM +0100, bruno_vidal@hp.com wrote:
>     Hi
> What do you mean by "swsusp" patche ? What it do....

swsusp = Software Suspend

http://fchabaud.free.fr/English/default.php3?COUNT=3&FILE0=Tricks&FILE1=Laptop&FILE2=Swsusp

	Software suspend is a kernel patch that provides the ability to
	suspend execution of the kernel without using any APM BIOS
	feature. This is really useful either if your BIOS is broken
	(for instance you have bought a larger disk than the original
	one and the BIOS is unable to handle it :-() or if you
	frequently swap from windows to linux because this feature
	allows you to save your linux session on disk instead of
	rebooting.

-- 
Michael Wood <mwood@its.uct.ac.za>

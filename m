Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E771490D
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 08:23:48 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AuvSM-0004tH-Sv; Sun, 22 Feb 2004 15:23:46 +0000
Date: Sun, 22 Feb 2004 15:23:46 +0000
From: Matthew Wilcox <willy@debian.org>
To: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Subject: Re: [parisc-linux] Unknown symbol eisa_in8
Message-ID: <20040222152346.GQ11824@parcelfarce.linux.theplanet.co.uk>
References: <40389735.2070702@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40389735.2070702@hrzpub.tu-darmstadt.de>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Feb 22, 2004 at 12:49:09PM +0100, Ruediger Scholz wrote:
> when I configure lastest kernel from cvs to use parport and lp driver as 
> module, I get the following warning when running "make modules_install":
> 
> WARNING: /lib/modules/2.6.3-pa0/kernel/drivers/char/lp.ko needs unknown 
> symbol eisa_in8
> WARNING: /lib/modules/2.6.3-pa0/kernel/drivers/char/parport-pc.ko needs 
> unknown symbol eisa_in8
> 
> Is in both files a definition for io.h missing?

Nope, you've found a better problem than that.  We aren't exporting
eisa_in8 to modules.  Fix coming up shortly.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 680D648CA
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 11 Mar 2004 07:02:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B1Ql6-0005Ty-Tw; Thu, 11 Mar 2004 14:02:00 +0000
Date: Thu, 11 Mar 2004 14:02:00 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ns87415 (superio) support for 2.6.x
Message-ID: <20040311140200.GJ2148@parcelfarce.linux.theplanet.co.uk>
References: <20040310224816.GA23292@tausq.org>
	<404EC1C6000018AB@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <404EC1C6000018AB@ocpmta1.freegates.net>
Sender: <willy@www.linux.org.uk>
Cc: Randolph Chung <randolph@tausq.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Mar 11, 2004 at 01:59:49PM +0100, Joel Soete wrote:
> I just build the new 2.6.4-rc-pa6 (in which this patch is included also if
> i didn't miss anything?) and boot it successfully on my b2k. Any way I noticed
> a 'kernel bug()' in dmesg:
> 
> Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
> ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
> kernel BUG at include/asm/ide.h:30!

ide_default_io_base()

Looks like we should just take out this BUG().  Randolph?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

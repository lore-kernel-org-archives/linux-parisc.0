Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 503F84852
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 15:58:50 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AwqwS-0006be-KO; Fri, 27 Feb 2004 22:58:48 +0000
Date: Fri, 27 Feb 2004 22:58:48 +0000
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] kernel 2.6.3 compile problem
Message-ID: <20040227225848.GW25779@parcelfarce.linux.theplanet.co.uk>
References: <200402271110.50459.eggert.ehmke@berlin.de>
	<Pine.LNX.4.58.0402271018590.3556@sal.ucc.ie>
	<20040227224926.GA10923@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040227224926.GA10923@baldric.uwo.ca>
Sender: <willy@www.linux.org.uk>
Cc: Randolph Chung <tausq@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Feb 27, 2004 at 05:49:26PM -0500, Carlos O'Donell wrote:
> On Fri, Feb 27, 2004 at 10:22:22AM +0000, M. Grabert wrote:
> > > CONFIG_VGA_CONSOLE=y
> > 
> > I think this is the culprit. There is not VGA support on Linux/PA-RISC.
> 
> This is the culprit, and I stumble across it all the time. How do we go
> about setting this to CONFIG_VGA_CONSOLE=n as the default? 

Done.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

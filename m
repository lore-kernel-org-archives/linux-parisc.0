Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D519487E
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 13 Feb 2004 11:10:18 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1ArhlZ-00014K-1H; Fri, 13 Feb 2004 18:10:17 +0000
Date: Fri, 13 Feb 2004 18:10:16 +0000
From: Matthew Wilcox <willy@debian.org>
To: dub@latnet.lv
Subject: Re: [parisc-linux] can't compile 2.4.24: pdc_cons.o problem!
Message-ID: <20040213181016.GO31168@parcelfarce.linux.theplanet.co.uk>
References: <1076695572.402d1214ad4b7@clients.latnet.lv>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1076695572.402d1214ad4b7@clients.latnet.lv>
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

On Fri, Feb 13, 2004 at 08:06:12PM +0200, dub@latnet.lv wrote:
> Hi,
> 
> I'm trying to compile a new kernel for K210. I tried both stable 2.4.24 and 2.4.23
> (got them by "apt-get -t stable kernel-source-2.4.2x")

the problem you're having is that you're trying to compile a kernel
that really doesn't support parisc.  i suggest either getting the
latest CVS kernel (see http://www.parisc-linux.org/faq/cvs.html) or
kernel-patch-2.4.21-hppa from the debian archive.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

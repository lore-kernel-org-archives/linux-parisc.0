Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 28EEA487B
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Mar 2004 09:52:04 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B3HnO-0006XF-UV; Tue, 16 Mar 2004 16:52:02 +0000
Date: Tue, 16 Mar 2004 16:52:02 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] SCSI broken in latest CVS changes
Message-ID: <20040316165202.GW25059@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.58.0403150256180.17258@sal.ucc.ie>
	<40561E7100000AF2@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40561E7100000AF2@ocpmta2.freegates.net>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org, "M. Grabert" <xam@cs.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Mar 16, 2004 at 05:17:01PM +0100, Joel Soete wrote:
> Hello Max,
> >It doesn't detect any of the two internal 9 GB LVD-SCSI of my C3k.
> 
> The same for me on b180 OTC 2.6.4-pa1 runing fine...
> 
> Do you got some news?

I got my c3k going and experienced the same problem.  I've backed out
the last two patches (Christoph's one to remove the queueing and the
dev_printk one) and it now works fine.  I've also imported 2.6.5-rc1,
so 2.6.5-rc1-pa0 should be happy happy on a c3k now.  Shout if it's not.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

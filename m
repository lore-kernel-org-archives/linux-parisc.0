Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F38AF484E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Sep 2003 08:25:07 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A1596-0004cE-6p; Sun, 21 Sep 2003 15:25:04 +0100
Date: Sun, 21 Sep 2003 15:25:04 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: "Stephen C. Tweedie" <sct@redhat.com>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Ranjith Sudarsanan <ranjith_sudarsanan@hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [Fwd: [parisc-linux] Problems with raw interface.]
Message-ID: <20030921142504.GD13172@parcelfarce.linux.theplanet.co.uk>
References: <1063919293.16536.2.camel@dhcp23.swansea.linux.org.uk> <1063989244.2834.48.camel@sisko.scot.redhat.com> <20030921053555.GA5312@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030921053555.GA5312@dsl2.external.hp.com>
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

On Sat, Sep 20, 2003 at 11:35:55PM -0600, Grant Grundler wrote:
> BTW, kernel and user space will alias to different cachelines
> for the same 32-bit "offset" because of "Space Registers"
> (form of segmented addressing).

Rubbish, they alias to the same cachelines because of the 4MB get-out
clause.  What you may have meant is that the same page accessed through
user and kernel mappings will alias to different cachelines because
their addresses *aren't* congruent modulo 4MB.

> > The key places are rw_raw_dev(), where we set up the virtual address to
> > physical page mappings, and brw_kiovec(), where the actual physical page
> > IO is done.
> 
> I can look, but willy or jejb have much better chance of finding
> something...

Those functions don't seem to exist in 2.6.  The only reference is:
./Documentation/block/biodoc.txt: of data, so brw_kiovec() invokes ll_rw_kio for each kiobuf in a kiovec.
which seems to be an orphaned comment.

I'll reluctantly take a look at 2.4.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

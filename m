From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [PATCH] parisc: remove CVS keywords
Date: Sat, 4 Apr 2009 13:14:27 -0600
Message-ID: <20090404191426.GA13748@parisc-linux.org>
References: <20090403014922.GA28891@orion> <20090403175849.GJ14159@bombadil.infradead.org> <20090404060958.GA1116@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	Alexander Beregalov <a.beregalov@gmail.com>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090404060958.GA1116@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Apr 04, 2009 at 12:09:58AM -0600, Grant Grundler wrote:
> On Fri, Apr 03, 2009 at 01:58:49PM -0400, Kyle McMartin wrote:
> > On Fri, Apr 03, 2009 at 05:49:22AM +0400, Alexander Beregalov wrote:
> > > 
> > > Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> > 
> > I don't feel comfortable removing these for hysterical raisins, unless
> > people on the list ack this.
> 
> I don't mind them being removed. The history is preserved else
> where for whoever wants to look.  Please add my
> 	Ack-by: Grant Grundler <grundler@parisc-linux.org>
> 
> to whatever parts of this patch you care to accept.

I'm comfortable with removing the $Id$ tags too.  Generally these have
been in copy-and-pasted files; we weren't relying on them for anything.

Acked-by: Matthew Wilcox <willy@linux.intel.com>

> > (Just like I wouldn't remove the "sorry
> > about the wall" comment... :)
> 
> Sorry, I've no clue about this one...what's the story? :)

Find the file it's in ... look at the history ... you'll get it
eventually ;-)  You'll probably have to go back to the 2.2 tree though.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."

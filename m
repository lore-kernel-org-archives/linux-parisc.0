From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [Vserver] Re: [parisc-linux] syscall number for vserver
Date: Thu, 18 Dec 2003 17:28:09 +0100
Message-ID: <20031218162809.GA2605__43371.8817345381$1416623064$gmane$org@MAIL.13thfloor.at>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
	<20031218072506.GA8142@lst.de>
	<20031218150129.GA792@MAIL.13thfloor.at>
	<20031218160450.GJ15674@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: vserver@list.linux-vserver.org, Christoph Hellwig <hch@lst.de>,
	parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <herbert@13thfloor.at>
In-Reply-To: <20031218160450.GJ15674@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Dec 18, 2003 at 04:04:50PM +0000, Matthew Wilcox wrote:
> On Thu, Dec 18, 2003 at 04:01:29PM +0100, Herbert Poetzl wrote:
> > vserver folks really do not care whether or not the
> > syscall is reserved on their architecture, as long 
> > as it's there, and it will be there anyway, I just 
> > wanted to be polite and correct, so if you 'think'
> > we split up the switch just for parisc(64) again, 
> > then I can assure you, that just won't happen ...
> 
> FYI, Christoph does not control syscall allocations on PA-RISC; I do.
> I don't yet have a firm opinion on whether we should allocate this
> syscall.  I see both sides of this argument, but personally, I believe
> sys_vserver is a mistake.

thanks for the information, (I almost assumed that,
at least according to 2.6/MAINTAINERS)

maybe you _can_ suggest a _doable_ solution for 
vserver, if so please go ahead, I'm listening ...

personally, I believe that the whole syscall number
allocation per architecture is broken by design, a 
better solution would be to have only one table for
all architectures, automatically blocking ni_syscalls
with strong typed arguments (bitsize), and a simple
way to either version or enable/disable those syscalls

after spending some thoughts on the 'a multiplexer is
a bad thing' argument, I came to the conclusion that,
if well designed, it's probably better than having a
different syscall with differing arguments on every
architecture, especially if the functionality is
completely agnostic regarding architecture ...

best,
Herbert

> -- 
> "Next the statesmen will invent cheap lies, putting the blame upon 
> the nation that is attacked, and every man will be glad of those
> conscience-soothing falsities, and will diligently study them, and refuse
> to examine any refutations of them; and thus he will by and by convince 
> himself that the war is just, and will thank God for the better sleep 
> he enjoys after this process of grotesque self-deception." -- Mark Twain
> _______________________________________________
> Vserver mailing list
> Vserver@list.linux-vserver.org
> http://list.linux-vserver.org/mailman/listinfo/vserver

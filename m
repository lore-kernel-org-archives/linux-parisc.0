From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] Security Hole in binfmt_som.c ?
Date: Sat, 30 Aug 2003 14:49:50 +0100
Message-ID: <1062251389.31150.4.camel__1923.72952956266$1416622744$gmane$org@dhcp23.swansea.linux.org.uk>
References: <3F509BBD.2040007@hrzpub.tu-darmstadt.de>
	 <20030830131541.GI13467@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030830131541.GI13467@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sad, 2003-08-30 at 14:15, Matthew Wilcox wrote:
> On Sat, Aug 30, 2003 at 02:42:37PM +0200, Ruediger Scholz wrote:
> > binfmt_som.c:216:2: #error "Fix security hole before enabling me"
> > What's this message about?
> 
> I don't know.  I wish someone would tell me.  You'd think they'd have the
> decency to contact the person listed as the author at the top of the file.

Actually explanations were posted in the previous discussion on this on
parisc-list.

Someone has to do the equivalent of the 2.4.22 binfmt_elf changes if
neccessary so that another thread can't change the file handles or 
steal the exec fd being passed to the loader.

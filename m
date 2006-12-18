From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] V-Class server.
Date: Mon, 18 Dec 2006 09:20:51 -0700
Message-ID: <20061218162050.GC21070__599.411948542361$1416624235$gmane$org@parisc-linux.org>
References: <4586B83E.40603@bcrl.stcloudstate.edu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Chuck Hall <chall@bcrl.stcloudstate.edu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4586B83E.40603@bcrl.stcloudstate.edu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 18, 2006 at 09:48:14AM -0600, Chuck Hall wrote:
> After reading the the parisc-linux website I noticed that the V-class 
> machines could be supported if someone had access to one.  I have access 
> to one, with just one problem no teststation software to get it booted.

Hi Chuck,

I don't know what needs to be done to get a V-class to boot, but I know
there are several people on the list with prior experience of V-class,
and I hope they'll be able to help you.

> If I had the software I would be willing to have the machine accessable 
> for development work for the purpose of getting Linux on it and anything 
> else you could think of.  I might even be able to get a few cs grad 
> students to work on it, they don't seem to be doing anything useful 
> right now.

That would be marvellous.

> I do have a question about the V-class and Linux.  What still needs to 
> be done?  The parisc-linux website states the main problem as being the 
> PCI bus adapter.  Knowing what else needs to be done would help in 
> judging the difficulty in completing the project.

I believe that is the only thing.  We can verify that (without doing the
work ;-) by booting a ramdisk-based userspace on it.  The first steps of
the Debian installer should work well for this purpose.  If it works,
then `all' we need is the PCI bus adapter.  I suspect there's also an
IOMMU (or similar) driver that needs to be written too.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 041B9496D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Aug 2003 11:56:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19lBTJ-00036u-RE; Fri, 08 Aug 2003 18:56:13 +0100
Date: Fri, 8 Aug 2003 18:56:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Joel Soete <joel.soete@tiscali.be>,
	"Conan C. Albrecht" <conan_albrecht@byu.edu>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] Re: Debian on rp 7400
Message-ID: <20030808175613.GP22222@parcelfarce.linux.theplanet.co.uk>
References: <25EEF58E-C82D-11D7-8F19-00039398B282@byu.edu> <20030806205220.GA6353@dsl2.external.hp.com> <3F336914.5020305@tiscali.be> <20030808163744.GA29158@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030808163744.GA29158@dsl2.external.hp.com>
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

On Fri, Aug 08, 2003 at 10:37:44AM -0600, Grant Grundler wrote:
> On Fri, Aug 08, 2003 at 09:10:44AM +0000, Joel Soete wrote:
> > >IIRC, "non-equivalently mapped aliases" 
> 
> > Is there much more detailed public doc some where about this stuff?
> 
> sorry - I don't understand the problems well enough.
> The PA 2.0 arch book might describe the cache behaviors sufficiently
> to determine this will be a problem.

You're looking for the section "Address Aliasing" starting on page F-5.
For the dead-tree-non-enabled, it's covered at
http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,959!218!244,00.html

Note that the book has some small errata in this section; the copy on
the web has these errata corrected.

Also note that the use of space bits in generating the cache index
is disabled.

Also note that the 16MB boundary discussed is relaxed to 4MB.

> I only partially understand what Jerry talking about and have no idea
> how linux VM implementation collides with the aliasing rules.

User mappings of shared pages are equivalently aliased.  The kernel's
view of user pages is a non-equivalent alias.  We could (ab)use kmap()
to ensure the kernel only accesses user pages through equivalent aliases,
but that requires quite some work.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

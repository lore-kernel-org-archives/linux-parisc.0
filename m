From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kernel module relocation bug
Date: Mon, 29 Nov 2004 19:23:35 -0500 (EST)
Message-ID: <200411300023.iAU0NaI2014797@hiauly1.hia.nrc.ca>
References: <1101773511.1714.98.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1101773511.1714.98.camel@mulgrave> from "James Bottomley" at Nov
	29, 2004 07:11:44 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Mon, 2004-11-29 at 18:08, John David Anglin wrote:
> > With -ffunction-sections, gcc guarantees that calls can reach the
> > beginning of a function plus some margin for the stub table.  The linker
> > inserts stubs on a per function basis.  This should work better with
> > relinking as the functions remain in their own sections.
> 
> So what we really need is the equivalent of -ffunction-sections for the
> linker where, when we combine a bunch of .o's it sees if the branches
> are getting too far a way and drops a stub in between the function
> sections (so that the in-kernel linker doesn't have to bother about
> doing this).

Then, in the final or in-kernel link, the long branch stubs get
fixed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Tue, 25 Apr 2006 13:52:28 -0500
Message-ID: <200604251352.28932.mszick@morethan.org>
References: <200604241535.k3OFZmPJ027261@hiauly1.hia.nrc.ca>
	<200604251017.14866.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604251017.14866.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue April 25 2006 10:17, Michael S. Zick wrote:
> On Mon April 24 2006 10:35, John David Anglin wrote:
> > > ldcw,co target_address
> > > 
> > > Where target_address includes the magic byte[0] of 
> > > the cache line.
> > 
> > Where is this documented?
> > 
> Close, not quite there yet:
> 
> HP patent number: 4,713,755
> 
> The page to retrieve this by number:
> http://patft1.uspto.gov/netahtml/PTO/srchnum.htm
> 
> Now it should be a 'simple' matter to just read
> every patent that references this one.
> 

One more conjecture confirmed,

The cache lines are a master/slave arrangement,
only one processor (or device) can be the master
(owner) of the cache line.

This is accomplished by keeping the cpu id (address)
of the master in the virtual tag.

Ref: HP patent number: 5,197,146

That is how the logical 'makePrivate' of the formal
memory model happens.

Translation:

Thou shall not allow load balancing to migrate a
task that holds a spinlock - you leave the master
of that cache line on the prior processor.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

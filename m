From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Tue, 25 Apr 2006 10:17:14 -0500
Message-ID: <200604251017.14866.mszick@morethan.org>
References: <200604241535.k3OFZmPJ027261@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241535.k3OFZmPJ027261@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon April 24 2006 10:35, John David Anglin wrote:
> > ldcw,co target_address
> > 
> > Where target_address includes the magic byte[0] of 
> > the cache line.
> 
> Where is this documented?
> 
Close, not quite there yet:

HP patent number: 4,713,755

The page to retrieve this by number:
http://patft1.uspto.gov/netahtml/PTO/srchnum.htm

Now it should be a 'simple' matter to just read
every patent that references this one.

Where in the _published HP documents_ that describe
the implementation - Ah, that is another question.

So far the closest approximation is the stw,bc
behavior when including magic byte[0].

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

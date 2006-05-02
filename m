From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Tue, 2 May 2006 06:27:21 -0500
Message-ID: <200605020627.21319.mszick@morethan.org>
References: <200604302125.k3ULPDl5016370@hiauly1.hia.nrc.ca>
	<200604301828.26318.mszick@morethan.org>
	<20060502062442.GC14414@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060502062442.GC14414@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue May 2 2006 01:24, Grant Grundler wrote:
> On Sun, Apr 30, 2006 at 06:28:26PM -0500, Michael S. Zick wrote:
>
- - - -
> > Is it not the PxTLB transactions that implement the inter-processor
> > coherency?
> 
> I don't think so.
>

Makes sense, the hardware function transactions, such as coherency
transactions are usually not accessable by even kernel code.

Ignoring diagnostic features of course.
 
> 
> 
> Do you honestly think the HP HW engineers were _that_ stupid?
> 

No.
But programmers of old hardware are not always up to the same
standard.  Typo's, Think-o's, and Brain Farts happen.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

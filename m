From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Re: back to glibc-2.3.3 & gcc-3.4.1 pb
Date: Mon, 6 Sep 2004 15:58:05 -0400
Message-ID: <20040906195804.GN15721@baldric.uwo.ca>
References: <413B3845.1050302@tiscali.be>
	<200409060239.i862dAh2001466@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409060239.i862dAh2001466@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Sep 05, 2004 at 10:39:10PM -0400, John David Anglin wrote:
> >      0x411cc740 <_dl_make_fptr+112>: ldw,s r7(,r6),ret0
> > in:
> > r7 == 0x7c4
> > r6 == 0x0
> 
> r6 is wrong.  Find out why it is zero.

Agreed. It's crashing because it has bogus input in my opinion.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

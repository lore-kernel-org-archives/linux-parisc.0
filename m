From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: Sun, 12 Sep 2004 09:10:07 -0400
Message-ID: <20040912130959.GK1854@baldric.uwo.ca>
References: <20040911165325.GO28659@tausq.org>
	<200409112249.i8BMnjCA006552@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409112249.i8BMnjCA006552@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Sep 11, 2004 at 06:49:45PM -0400, John David Anglin wrote:
> > [1] The change to using absolute jumps is because gas doesn't want to
> > let us take the difference of labels in two different sections (viz.
> > .text vs .fixup). jejb and I are not able to come up with a case where
> > using relative jumps is required.
> 
> Right.  However, there is a way to do 32/64 bit pc-relative offsets.
> The table entries need to look like "L$1+(.+8-L$0)-$PIC_pcrel$0".
> GAS needs to be reasonably new to support this.

Interesting.

I thought I needed relative fixups, then I realized I was wrong.

I use exception fixups for LWS on the gateway page, but I can
just fudge the exception entries differently. No big problem
since I have to do a fixed relocation on them anyway.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] Should I read SHR[DW] as SHRP[DW] in parisc2.p
Date: Fri, 13 Aug 2004 19:53:17 -0500
Message-ID: <200408131953.17512.mszick@goquest.com>
References: <200408140027.i7E0RCRO001690@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408140027.i7E0RCRO001690@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri August 13 2004 19:27, John David Anglin wrote:
> >   80:   d2 80 09 f4     shrpw r0,r20,16,r20
> >   84:   d2 80 39 f0     extrw,u,= r20,15,16,r0
> > 
> > Then checking chapter 7 on 'shrpw' it very clearly
> > states that this instruction effects only the right
> > half of the registers. (no mention of left half)
> 
> It actually says for 'shrpw' that the leftmost 32 bits of the target
> register (r20) are undefined.  If you had used a different target
> register, r20 would not have been affected.
> 
I need to learn to read better.

> 
> The documentation is a bit vague when it comes to condition tests
> when a result is discarded, but I believe that the test is done
> before the result is discarded.  It doesn't make any sense to test
> r0 which always reads as zero.
> 
Another vague thing -
Can you get a register stall (interlock) against gr0?
I.E:
op-code ....,destination Rx
op-code source Rx, .....
must wait for the store to Rx to be retired.
If Rx is GR0 - will the behavior be the same?
In tech. terms...
Is the discard prior to the retire stage of the
pipeline?
Is the discard even earlier than that in the pipeline? 
Does reference to GR0 count against the two 
register limit on issues?

I can find a partial answer - if the operation referencing
GR0 changes the flags - it seems that you can stall 
against the update of the flags in the PSW.
(or at least that would be reasonable to expect).

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

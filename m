From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Success! [Was: SCSI hang in 2.6.6-pa4]
Date: Fri, 21 May 2004 18:07:59 -0600
Message-ID: <20040522000759.GA25166@colo.lackof.org>
References: <Pine.LNX.4.58.0405191939460.30587@trillian.uni>
	<40AC8294.7030303@tiscali.be>
	<Pine.LNX.4.58.0405202222240.18175@trillian.uni>
	<40ADCA04.10502@tiscali.be>
	<Pine.LNX.4.58.0405211711030.1564@trillian.uni>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Elliott Potter <mailinglist@eep.burdell.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0405211711030.1564@trillian.uni>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, May 21, 2004 at 05:23:20PM -0500, Elliott Potter wrote:
> 1) No SMP?  <pout>I want my SMP!</pout> :)
>   ... or in the form of a
> question: is this something that's going to work maybe in a bit but not
> for now, or is it just broken beyond all patience?  Just wondering.

It should work in the "near future".
As usual, 32-bit SMP seems to work but it's not well tested.

> 2) I'm a bit confused on the whole 64 bit thing.  I've been selecting
> the PA7000 CPU option on kernel configs for the various machines I have
> (j5k, c3k, c360) because when I picked PA8*00 I was getting lots of
> weird errors regarding modules - I assumed that was an issue with 64
> bits, and I also was under the impression from recent posts that 64 bit
> kernels aren't quite right yet.  Right?

64-bit SMP didn't work for me. Otherwise, 64-bit UP works fine.
But none of the workstations you listed above require 64-bit
and thus I don't reccomend it unless you have more than 4GB RAM.

>  Or is that just userland?
> Granted I don't think I have any real need for a 64 bit kernel, but just
> wondering.  What I really want is one modular kernel config I can use
> for the three machines.

The main differences between c360 (ccio+dino) and j5k/c3k (sba+lba drivers)
are not available as modules. Just build them all into one kernel
and it will work fine.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

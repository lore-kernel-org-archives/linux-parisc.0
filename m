From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Solution to OPD's in hppa-linux,
	including a transition plan?
Date: Wed, 16 Mar 2005 22:51:41 -0500 (EST)
Message-ID: <200503170351.j2H3pfhv011974@hiauly1.hia.nrc.ca>
References: <20050316213757.GG22872@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: tausq@debian.org,
 amodra@bigpond.net.au,
 parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050316213757.GG22872@baldric.uwo.ca> from "Carlos O'Donell" at
	Mar 16, 2005 04:37:58 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> We *do* have a n OPD for functions called in this manner, but only if
> the plabel word carried a PLABEL32 reloc. The use of _dl_make_fptr
> makes sure each symbol gets a unique function descriptor and will never
> create duplicates.
> 
> The problem is that in the executable, we lazily point all the plabel
> words at their associated plt entries and *splat* they are no longer
> unique. Please note this *only* happens in the executable. Executables
> do not generate PLABEL32 relocs for their plabel words.
> 
> I want to recommend that the executable emit PLABEL32 relocs against all
> plabel word entries. The dynamic loader would then fill these entries
> with unique OPD's as it has done so for shared libraries (this code was
> originall wirtten by Bame et. al. and I ported hppa to use Lu's
> non-locking generic version).

I think you are correct.  I hadn't realized that we are only dropping
the PLABEL32 in executables.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

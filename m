From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.3 vs. 3.4
Date: Wed, 27 Apr 2005 14:23:58 -0400 (EDT)
Message-ID: <200504271823.j3RINwTK000206@hiauly1.hia.nrc.ca>
References: <20050427171532.GC496@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050427171532.GC496@baldric.uwo.ca> from "Carlos O'Donell" at
	Apr 27, 2005 01:15:32 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Wed, Apr 27, 2005 at 01:00:20PM -0400, Carlos O'Donell wrote:
> > NOTE: dl_make_ftpr is actually compiled *into* the executable at this
> > point, since it's static and all the loader code is included.
> 
> On second thought, I'm sure _dl_make_fptr from the dynamically loaded
> ld.so.1 is being used. So I'm not quite sure what distinguishes this
> case from any other, except that it crashes on the first call to
> _dl_make_fptr.

Do you have the macro fix installed?  There is a definition that's
only used in an asm that 3.4 deletes because it thinks it's not used.
I believe there is a warning.

If that's not the problem, can you send the precompiled source,
the compile command, and a note as to which code is miscompiled.

I probably won't be able to look at it until next week.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

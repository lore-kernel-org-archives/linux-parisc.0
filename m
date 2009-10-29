From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Thu, 29 Oct 2009 19:35:00 -0400 (EDT)
Message-ID: <20091029233501.152D1500F@hiauly1.hia.nrc.ca>
References: <4AEA158C.10005@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AEA158C.10005@gmx.de> from "Helge Deller" at Oct 29, 2009 11:22:04 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> 
> On 10/29/2009 10:07 PM, John David Anglin wrote:
> >>> Still need to look at readelf -u on .o's.
> >>
> >> Yes, I see this too. readelf -u doesn't print any longer the second line of:
> >> <arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]
> >>             Entry_GR=1 Save_SP Total_frame_size=8
> >
> > Actually, the entries are still there.  For weak functions that
> > are not used, they appear as "<foo+x>:" where foo is the closest
> > preceding symbol before the unused weak function.  In practice,
> > the code shouldn't be entered, so the lack of an associated function
> > symbol shouldn't matter.
> >
> > I have a fix for the readelf -u bug.  See below.
> 
> Sorry, but I don't fully understand...
> 
> With your patch to gas, the unwind info for the weak functions are completely gone in the final executable (which is good).

I don't think I changed this.  In the testcase that you sent, I see

<a>: [0x104a0-0x104b8]
        Entry_GR=1 Save_SP Total_frame_size=8 
<a+1c>: [0x104bc-0x104d8]
	Entry_GR=1 Save_SP Total_frame_size=8 
<z>: [0x104dc-0x104f4]
	Entry_GR=1 Save_SP Total_frame_size=8 
<main>: [0x104f8-0x10544]
	Entry_GR=1 Save_SP Total_frame_size=8 
<f>: [0x10548-0x10564]
	Entry_GR=2 Save_SP Save_RP Total_frame_size=8 

The weak version of f is the <a+1c> entry.

> But "readelf -u" doesn't show the "Entry_GR=..." lines for _any_ function any longer (in the final executable).
> I really mean _all_ functions, weak, non-weak, standard, ...

That's not what I'm seeing.  The old and new versions seem similar
(i.e., with respect to missing "Entry_GR=...").  Didn't touch the
code that extracts and prints this stuff.

The lack of "Entry_GR=..." stuff for an entry probably indicates
that there isn't a .CALLINFO directive for the function in question.
This could happen if the function is handcoded assembler.  However,
it is legitimate for a function not to have any of the unwind stuff
set (e.g., function doesn't save any registers or allocate a frame).
I think GCC gets this right but it never has been looked at with a
magnifying glass.

> The patch you attached only changes the start and end addresses of the symbols...?

Yes, and only for .o's.  In final executables, there are no relocations
in the .PARISC.unwind section.  So, the values printed should be unaffected.

In the .o case, the code was in effect doing the SEGREL relocation twice
leading to offsets twice as big as they should have been.  It still runs
through the relocations if present, but uses the value from doing the
relocation if one is present.  Compare what you see now with objdump -d
and readelf -u on a .o.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

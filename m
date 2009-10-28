From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Wed, 28 Oct 2009 19:10:25 -0400 (EDT)
Message-ID: <20091028231026.CDB6F4E38@hiauly1.hia.nrc.ca>
References: <4AE8BEE3.1040706@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org,
	randolph@tausq.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AE8BEE3.1040706@gmx.de> from "Helge Deller" at Oct 28, 2009 11:00:03 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Hi Dave,
> 
> > On 10/28/2009 12:19 AM, John David Anglin wrote:
> >> From my understanding of things, it shouldn't be necessary to remove the
> >>unwind info for unused weak  symbols if they aren't garbage collected.
> 
> What do you mean with "garbage collected" ?  "dropped from the executable" ?
> AFAICS, the weak function was completely dropped from the vmlinux file.

Yes, I mean "dropped from the executable".  Dropping weak functions
is trickier than just leaving them in place.  It is easier to just
adjust the linkage.  The default behavior of HP ld is to leave unused
functions.  Don't know about GNU ld.  If GNU ld drops unused weak
functions, then the PARISC.unwind entries for them need to be removed.

> Some more info:
> The unwind function in the parisc linux kernel walks the (sorted!) unwind list.
> If one entry is wrong this can lead to incorrect unwinding.
> 
> In this case:
> 
> <arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]   - non-weak function
>            Entry_GR=1 Save_SP Total_frame_size=8
> <arch_mod_section_prepend>: [0x1011fc4c-0x10167cf4]  - weak function
>            Entry_GR=1 Save_SP Total_frame_size=8
> <module_arch_cleanup>: [0x1011fc78-0x1011fcb8]
>            Entry_GR=2 Save_SP Save_RP Total_frame_size=8
> 
> I see a those options:
> a) drop the second (weak) unwind info entry
> b) for the weak function, use the same start- and end-addresses as the non-weak entry.
> 
> Option b) would probably need some adjustments to the existing parisc
> specific unwind function.

I'm not keen about b).  From looking at one of my builds, it does indeed
look like the weak version of arch_mod_section_prepend has been dropped
(can only find one copy with objdump).

Do you know if linux uses the --gc-sections ld option?  This together
with the GCC -function-sections option might contribute to this problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

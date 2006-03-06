From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [Fwd: Re: [parisc-linux] Re: gcj can't make shared libs on hppa]
Date: Mon, 6 Mar 2006 11:47:47 -0500
Message-ID: <119aab440603060847i5cd87f25tc50fb5699429d5ab@mail.gmail.com>
References: <440BC3CB.8020801@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: "Randolph Chung" <randolph@tausq.org>,
 dave@hiauly1.hia.nrc.ca,
 parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <440BC3CB.8020801@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Dave,

Sorry, it appears I've been dropped from various lists when my
mail servers went down due to university problems.

> > Right, it's a linker bug.  The following plabel is dropped from the
> > shared library.
> >
> > 0000000c R_PARISC_PLABEL32  .L_ZN2A1C1Ev0
>
> I was too hasty in calling this a linker bug.  We end up with the
> following relocations in the shared library as a result of the above
> relocation in the object file:
>
> 00010f34 R_PARISC_PLABEL32  *ABS*+0x00010f46
> 00010f44 R_PARISC_IPLT     *ABS*+0x000009a8
>
> The reason for the segmentation fault is the R_PARISC_IPLT isn't
> being handled correctly and the indirect call to the constructor
> for the library branches to the wrong location.

Can you explain what is broken?
Where does it branch to?

> Carlos, do you have an opinion on how plabels that reference local
> symbols in shared libraries should be handled?  This is what we have
> in the A1.s file for .L_ZN2A1C1Ev0:
>
>         .word   P%.L_ZN2A1C1Ev0
>         .set    .L_ZN2A1C1Ev0,_ZN2A1C1Ev

*ABS* IPLT relocations might be mildly broken in hppa actually.

*ABS* PLABEL's point to the PLT at runtime, this might be a
reason for the breakage. We point them at the PLT because they
are local and thus the PLT is a unique OPD.

It might be possible the IP is correctly set, but the GP is incorrect.
If you could verify this it would be great?

This breakage would have occured around the time that fixup was
changed to incorporate ia64 changes.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA23874
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 16:13:58 -0600
Date: Sat, 23 Oct 1999 00:14:43 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: frowand@cup.hp.com
Cc: Paul Bame <bame@debian.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot messages from C3000 console
Message-ID: <19991023001443.A22908@suse.de>
References: <199910212057.OAA19923@debian.fc.hp.com> <380FB68D.A8F28E62@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <380FB68D.A8F28E62@hp.com>; from Frank Rowand on Thu, Oct 21, 1999 at 05:57:49PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> I'm cutting this from another discussion, don't feel like re-typing it.
> The file we are talking about (giving line number references) is head.S.
> We calculated the the offending offset was at label "blargh" plus a bit.
> 
> The following discussion talks about how we get to the code section
> where the HPMC occurs.  Earlier, we talked about hard-coding magic
> addresses, which are machine specific (that's in the macro "debug",
> which is what actually caused the HPMC -- line 162).

The debug macro should indeed have been empty (and is, now).  Sorry for that.

> Then I get a little incensed at the coding style here.... (editing out other
> people's responses to my tirade)
> 
> 
> > This is a **bogus** way to write code.  Comments should be required!!!!!! 
>   Is there any way to encourage that?

there is a comment on top of the section of code in question

	/* setup the BTLB.  XXX: This assumes a unified BTLB */"

which I agree isn't as verbose as it could be but it seems not to hard to me
to get to "we do a PDC_BLOCK_TLB call now" from "setup the BTLB".

> > But I'm *extremely* serious about that.  This code is unmaintainable in it's
>   current form.  It's going to be miserable adding 2.0 support to something
>   like that.

indeed it is, which is one of the reasons I proposed to wrap the virtually-mapped
kernel in a physically-mapped som binary which could do these pdc calls in C (and
would remove the need for most of head.S)

> > it's important to anyone who would like to pick up head.S and be able to
>   read it.  To decode the procedure call I had to know where to find
>   documentation for page zero, know what PDCE_PROC is, figure out what PDC
>   procedure was being called.
> > For me, it was about 45 seconds instead of the two seconds it would take to
>   read a comment.
> > For someone who doesn't have my background, it could be hours.

I cannot exactly remember whether this was based on gcc-generated code, but I
am pretty sure it was, which might explain why it doesn't use macros (of course,
it would have been a good idea to include the C code as comment in this case).

	Philipp Rumpf

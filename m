Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA19369
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Dec 2000 22:15:19 -0700
Message-Id: <200012280518.AAA11283@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: law@redhat.com
Date: Thu, 28 Dec 2000 00:18:04 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rth@redhat.com, alan@linuxcare.com.au, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
In-Reply-To: <9917.977947732@upchuck> from "Jeffrey A Law" at Dec 27, 2000 01:08:52 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   In message <200012141640.LAA03285@hiauly1.hia.nrc.ca>you write:
>   > That's what I thought.  It would appear to occur when the above two insns
>   > get moved out of a loop.  The count gets decremented when the old insns
>   > are deleted but not incremented when the new insns are created.  The puzzle
>   > is why the count is zero rather than 1.  Maybe what happens is the two
>   > insns in the loop are deleted first, then the label is deleted?  Notice
>   > that insn 788 is moved to insn 1530.  However, the insn becomes 1531 and
>   > the reg changes to 337 from 208.
> In this case we typically will bump the number of uses before we delete
> the insns that way the label doesn't go away unexpectedly.

As far I can tell, move_movables doesn't do this when it moves an insn
out of a loop.  It does this by deleting the old insn and creating a new
one.  It calls add_label_notes if notes need to be added to the new insn.

I sent a patch to add_label_notes for review which I think fixes the
problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

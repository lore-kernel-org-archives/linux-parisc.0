From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: CAS (lws_compare_and_swap32)
Date: Mon, 29 Mar 2010 22:18:57 -0400
Message-ID: <119aab441003291918j2e7a17d8of7ee957876a549ab@mail.gmail.com>
References: <4BB0B2C8.8000302@fsij.org>
	 <119aab441003290913x6cb925b9v66b44a14c31393cb@mail.gmail.com>
	 <119aab441003291231j320e6637g87c201f75ee61faf@mail.gmail.com>
	 <20100330015455.GA13505@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: NIIBE Yutaka <gniibe@fsij.org>, debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100330015455.GA13505@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 29, 2010 at 9:54 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> I think the solution may be to proceed the CAS sequence with a probe,=
w
> instruction. =A0This will trigger a non-access TLB miss fault/non-acc=
ess
> data page fault if its going to happen. =A0There is a FIXME for case =
17
> in handle_interruption about this.

Then what though? One process has to write to the page to initiate the
COW. How else are you going to initiate the COW? Once in userspace you
are only allowed to write to the CAS value (one word on a page), and
you *can't* because that would violate the CAS semantics and atomicity
requirements.

The "first" process must take the lock, has to write the result to the
page, has to initiate the COW, has to sleep with the lock held, and
the rest have to spin in userpace waiting for it to complete.

AFAICT the rest of the processes are not be able to stop the "first"
process from finishing the COW, so we make forward progress after the
COW is done and the "first" process resumes and unlocks the LWS CAS
lock (for that address range).

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

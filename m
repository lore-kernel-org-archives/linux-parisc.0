From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: GCC 4.3 and PLABEL32 issues.
Date: Wed, 26 Mar 2008 08:00:26 -0400
Message-ID: <119aab440803260500i20dd94e0o6365a9c488e59986@mail.gmail.com>
References: <119aab440803251959j8596a72wc399174db02ed71f@mail.gmail.com>
	 <20080326032001.357B74E7F@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc.ca, linux-parisc@vger.kernel.org,
	aurel32@debian.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080326032001.357B74E7F@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Mar 25, 2008 at 11:20 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> > If the if condition is reduced to "0" as early as 003t.original, does
>  > that mean it's the C frontend fault?
>
>  Yes.  If I remember correctly, casting a pointer to an integer type
>  is implementation defined.

I mention this in the PR.

>  > This issue is breaks glibc's detection of PLABEL's during startup
>  > relocation processing.
>
>  This definitely needs a PR.  It should be marked as a regression.
>  This probably also breaks the unwind code in libjava as it has a
>  similar check.  There's also __canonicalize_funcptr_for_compare.
>
>  It's something of a puzzle as to why this didn't appear in testing.
>  It suggests we aren't testing the build libraries but installed libraries.

PR/35705 filed, and CC'd to you.
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=35705

Cheers,
Carlos.

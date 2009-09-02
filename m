From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: hppa nptl switch
Date: Wed, 2 Sep 2009 10:09:22 -0400
Message-ID: <119aab440909020709m72645cf7j61103d577bd387d7@mail.gmail.com>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz>
	 <119aab440909010655j148ad3b8oae5328d646ef570c@mail.gmail.com>
	 <4A9D42C3.70103@aurel32.net> <200909012003.49114.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Aurelien Jarno <aurelien@aurel32.net>, debian-hppa@lists.debian.org,
	debian-glibc@lists.debian.org, linux-parisc <linux-parisc@vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <200909012003.49114.vapier@gentoo.org>
Resent-Message-ID: <lTCxSv834KD.A.ZkG.kynnKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Tue, Sep 1, 2009 at 8:03 PM, Mike Frysinger<vapier@gentoo.org> wrote:
> i think the question was one about packaging rather than general use ? =
=A0if you
> build a package against a newer glibc version but it only uses older symb=
ols,
> then in theory it should work fine with older glibc versions. =A0if the s=
ymbol
> changes between versions, then it should have corresponding symbol versio=
n
> changes as well (which will automatically be recorded in the binary).

Yes, the question is specifically about packaging.

If the answer is "Debian does not prevent you from downgrading glibc,
even if you have new packages built against the new glibc", then I
accept that.

However, I have another question. What prevents applications built on
a buildd against a newer glibc, from being installed on a system with
an older glibc? Glibc provides backwards compatibility, but *not*
forwards. What happens in the packaging subsystem to prevent this?

How does an application encode "I was built against glibc X.Y,
therefore I should only be run on such a glibc or newer."

Cheers,
Carlos.

From: Luk Claes <luk@debian.org>
Subject: Re: HPPA and Squeeze
Date: Thu, 18 Jun 2009 08:29:10 +0200
Message-ID: <4A39DEB6.2080803@debian.org>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org> <20090615173102.GC2690@lackof.org> <4A39823C.8070104@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Debian Release <debian-release@lists.debian.org>,
 linux-parisc@vger.kernel.org
To: HPPA porters <debian-hppa@lists.debian.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <4A39823C.8070104@debian.org>
Resent-Message-ID: <r-cEn26iwL.A.pYG.H2dOKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Matthias Klose wrote:
> Grant Grundler schrieb:
>> On Fri, Jun 12, 2009 at 08:49:26AM +0200, Luk Claes wrote:
>>> Grant Grundler wrote:

>>>> On Tue, Jun 02, 2009 at 03:07:35PM +0100, Neil McGovern wrote:

>>>>     http://lists.debian.org/debian-release/2009/04/msg00303.html
>>> Note that it's wrong to assume we will come with the answers.
>> I was expecting a summary of specific issues from an organization
>> that claims to operate transperently.  The hand waving is easy. But
>> doesn't resolve problems and doesn't meet my expectation of an "open"
>> organization that I've donated money, time, and materials to.
> 
> +1. dropping hppa as a release architecture was not communicated by the release
> team at all.  I did spend some time to get gcj / default-jdk working on hppa,
> and some money (buying a new disk for a hppa machine) to help this port.  The
> time and the money could have spent better, if d-r would have better
> communicated about their intent.

There are issues with the hppa port where the release team considered
dropping it since 2005 communicated to the porter list...

> hppa is not in a good shape, but there are other architectures which are not
> better (sparc, mips*) from a toolchain point of view. what about these?

I'm not aware of current toolchain issues on sparc and the issues on
mips* still seem to be manageable, no?

> there are issues pointed out and not addressed like the -dev / -headers packages
>  built as binary independent packages just to save disk space, which have an
> impact on "slow" architectures, and which are not addressed by the release team.
> would the release team mind addressing these real issues, or should we drop
> "slow" architectures as well?

Well, this Packages issue is clearly a responsability from the FTP Team
and the Release Team would indeed be very happy to have that resolved.

Cheers

Luk

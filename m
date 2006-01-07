From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: qt-x11-free build fails
Date: Sat, 7 Jan 2006 10:40:00 -0700
Message-ID: <20060107174000.GA11145__23294.5378440947$1416623980$gmane$org@colo.lackof.org>
References: <20060107090511.GI29300@tennyson.dodds.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: 342545@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org,
 debian-release@lists.debian.org,
 lamont@debian.org,
 willy@debian.org,
 tausq@debian.org,
 kyle@debian.org,
 jbailey@debian.org,
 341675@bugs.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20060107090511.GI29300@tennyson.dodds.net>
Resent-Message-ID: <Dqj6rB.A.GyE.Pr_vDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Sat, Jan 07, 2006 at 01:05:11AM -0800, Steve Langasek wrote:
> Grant, thank you for your work to date on this bug.  (BTW, it would be
> helpful if you would follow up to bug #342545 on libgcc2, instead of bug
> #341675 which is filed against just one of the many packages affected by
> it).

Steve,
welcome!
I'm just replying to what was already on the CC list.
I've also added parisc-linux mailing list since this may involve
kernel and/or need FP unit expertise that I don't have.

> Unfortunately, it doesn't seem from the bug log as though much progress is
> being made towards a resolution.

We (several hppa developers) are working on it.
But keep in mind this is a hobby for all of us.

> At this point, the KDE transition has
> been completed in testing for all architectures, with the exception of hppa
> as a result of this bug.  The release team is already moving on to other
> transitions that need to happen for etch, including another round of
> dbus-related KDE changes.

My opinion: release team should move on and ignore hppa until this is
resolved. If it doesn't get resolved in the next couple of weeks
(say by Feb or mid-Feb), then drop hppa from etch. But I'm not
a DD and don't want to know the politics involved. Just my $0.02.

> This is a release-critical bug, and it is impacting hppa's ability to keep
> up with etch at large, extending even to such core packages as aptitude
> (build-depends on cppunit; now uninstallable in testing on hppa).

*nod* - I saw the KDE dependency already.

>  Is there
> progress being made on this bug that's not shown in the bug log, or do we
> need to consider dropping hppa from the list of etch release archs at this
> point?

Yes, we are making progress - nothing new to report since last week.
I'm looking at it today and will consult with other hppa developers
once I have more data later today.

And as noted above, I think release team should informally ignore
hppa until this is resolved and we catch up again. But I don't know
what the politics or policys in Debian allow for. I'm just a (mostly)
happy debian user and upstream (hppa) maintainer.

thanks,
grant


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org

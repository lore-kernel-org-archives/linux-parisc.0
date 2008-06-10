From: dann frazier <dannf@dannf.org>
Subject: Re: hppa release status
Date: Tue, 10 Jun 2008 16:19:58 -0600
Message-ID: <20080610221958.GE16265@colo.lackof.org>
References: <20080608194617.GT10194@mails.so.argh.org> <484EF5D7.5000209@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Andreas Barth <aba@not.so.argh.org>, debian-hppa@lists.debian.org,
	debian-release@lists.debian.org, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <484EF5D7.5000209@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 10, 2008 at 11:44:55PM +0200, Helge Deller wrote:
> CC'ed: parisc-linux kernel development list
>
> Andreas Barth wrote:
>> during the upload of python2.5, the build failed on hppa due to stalls
>> in the test suite, see http://bugs.debian.org/483042 and
>> http://buildd.debian.org/fetch.cgi?&pkg=python2.5&ver=2.5.2-5&arch=hppa&stamp=1211583145&file=log
>> (Matthias "fixed" that bug by disabling the testsuite, not something that 
>> makes
>> us happy.)
>> After that happened, we asked on #parisc if someone could take a look,
>> and we were told that linuxthreads is currently unmaintained for hppa,
>> and the issue could only be fixed by moving to nptl and we need to do an
>> (incompatible) abi change in glibc. Such a change would be really
>> unfortunate, and we hope that every other roads have been evaluated
>> first (like trying to understand why python on linuxthreads fails on
>> hppa but not on e.g. kfreebsd). We also would like to be sure that ntpl
>> is really better than linuxthreads for python2.5 before a transition.
>
> My personal feeling is, that a switch to NPTL is probably the best 
> solution. Even if this involves a abi change.
> Maybe experts on NPTL could comment here?
>
>> In addition to the python2.5 issue, there are two other issues that are
>> quite concerning:
>>   * a problem with ruby1.9 which likely is kernel related #478717.
>
> Hmm..
>
>>   * dirmngr that segfaults, likely because of some signalstack issues
>>     #459567.
>
> Yes, we need to implement makecontext()/getcontext() in glibc.
>
>> We've seen no porter activity on those bugs yet.
>
> I'd volunteer to try on thedirmngr/makecontext() issue. (At least as far as 
> my time permits).
>
>> On further discussing that within the release team, we noticed that the
>> Qualification page on 
>> http://wiki.debian.org/hppaLennyReleaseRecertification
>> is not really complete, e.g. it says:
>> | The installer is being maintained by ... and it's currently working
>> | effectively. Successful installation reports are available at: ...
>> It would really be great (read: it is necessary) that the Qualification
>> Page is filled with the missing information, and that we actually have
>> enough porters for hppa.
>
> I've added myself there in a few items.
> I'd be willing to look into issues with the installer, but not being a 
> active debian developer I'd need help from a debian guy if necessary.

hey Helge,
 Feel free to contact me if you need something done that requires DD
privs.

>> So, with respect to the python2.5 issue, what now?
>> At the technical side, best of course would be if linuxthreads would
>> continue to work at least enough for lenny, this was the case for a few
>> years already, it should be able to survive a few months more, and
>> python2.5 can build with the test-suite on hppa.  Of course not breaking
>> the API during a linuxthreads -> NPTL switch would be even better.
>
> I can't comment on that.
>
>> If really you see no other option than switching to NPTL, even at the
>> current unfortunate moment, the only way how this could be done in a
>> timely fashion would be to exempt hppa from the list of architectures
>> our testing migration scripts look at for updateness and non-breakness.
>> Then upload glibc ASAP, and schedule an archive-wide binNMU campaign.
>> Of course, this demands enough buildd power, and wanna-build access by
>> (some of) the porters (or whatever else you consider appropriate).
>> Moreover it needs quite a lot of time to track that closely, which the
>> Release Team probably won't have on its own, so we will need hppa
>> buildd-admin and hppa porters time, a lot.
>> After the transition is done (and we can only hope it is in time for
>> lenny), hppa could be added back to the normal architectures. Downside
>> of this is of course that in case hppa is slower than lenny, lenny would
>> be released without hppa.
>
> which would be sad...
>
>
>> Of course, we also need plans for the ruby and dirmngr issues.
>
> Yes.
>
>> So, after that long mail, what's your take on this? How do we continue?
>
> Any other comments?
>
> Helge
>
>
>

-- 
dann frazier


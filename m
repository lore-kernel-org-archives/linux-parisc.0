From: dann frazier <dannf@dannf.org>
Subject: Re: decommissioning parisc-linux.org
Date: Thu, 9 Feb 2012 10:55:47 -0700
Message-ID: <20120209175547.GA22332@dannf.org>
References: <20120208143347.GB22903@dannf.org>
 <CA+DQjFhKZiuxcoHJYcpDBUJW3xNNTDQhfm=d3trWG3u8DARtXw@mail.gmail.com>
 <BLU0-SMTP5575D9E1E9A88CEE0BD790977A0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thibaut VARENE <varenet@parisc-linux.org>,
	linux-parisc@vger.kernel.org, taggart@lackof.org,
	bame@riverrock.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP5575D9E1E9A88CEE0BD790977A0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Feb 08, 2012 at 06:47:45PM -0500, John David Anglin wrote:
> On 8-Feb-12, at 5:16 PM, Thibaut VARENE wrote:
> 
> >On Wed, Feb 8, 2012 at 3:33 PM, dann frazier <dannf@dannf.org> wrote:
> >>As Paul noted[1], parisc-linux.org was running a vulnerable
> >>apache which got the attention of HP's security audit team. I've been
> >>doing most of the maintenance of the OS on this machine for a while,
> >>but that has just meant apt-get upgrading when cron-apt told me
> >>to for
> >>a few years. Turns out apache-ssl was obsolete (an etch version!), so
> >>no amount of upgrading was going to fix that.
> >>
> >>At this point I've removed apache-ssl. I tried installing apache2 to
> >>see if any web pages would magically work - it didn't, so right now
> >>the website is 404 farm :( I didn't spend much time trying to handle
> >>that since.....
> >>
> >>parisc-linux.org is running the last stable release of Debian that
> >>supported hppa ('lenny'), and its life is now expired. As such, I
> >>think we really need to migrate the site to another maintained
> >>distribution and/or architecture. I'm willing to help migrate
> >>services
> >>for the next month or so - let's just say 2012.03.14 for a good round
> >>(heh) date - after which I plan to halt this system and let HP know
> >>the hardware can be put to other uses. From what I can tell, we
> >>originally installed this system almost exactly 9 years ago - ah,
> >>rememember its predecessor dsl2? Good times. Anyway -
> >>
> >>*************************************************************************
> >>*** If you need any data off this machine, now's the time to
> >>grab it! ***
> >>*************************************************************************
> >>
> >>If you'd like to take over longterm hosting the website/domain,
> >>please
> >>get in touch with taggart or I. If you'd like to continue using the
> >>machine and/or HP's network to do the hosting, I can probably find a
> >>contact for you there - though I wouldn't bet on it.
> >>
> >>In the meantime, if anyone wants to get the website working on
> >>apache2
> >>for the remainder of the system's lifetime, please let me know.
> >
> >Hi Dann,
> >
> >What's the status of @p-l.o email addresses? I'm receiving a fair bit
> >of email on this domain, and I think others do too, if we need to move
> >on elsewhere it'd be nice to have a little headstart... ;)
> >
> >Thanks
> >
> >T-Bone
> >
> >
> 
> 
> parisc-linux.org could be updated to unstable.  As I have mentioned,
> I am working
> to restart an unstable buildd for parisc.  

Yeah, I know this had started, but I haven't been keeping up with
the current status.

> The magnum machine in the
> ESIEE cluster
> is currently being updated for this purpose.  It is currently
> running a 3.2.2 kernel
> and glibc 2.13-10.  I intend to update it to 3.2.4 and glibc 2.13-26
> this weekend.
> I have built a big hunk of unstable/
> 
> As far as I can tell, the last kernel patch that I post to the
> @p-l.o list, resolves the SMP
> stability issues that have plagued parisc for years.  I now have
> about six weeks running
> experience on rp3440s without a single random segmentation fault or
> hpmc.  The
> machines have been running at load levels not previously possible.
> This is the result
> of many incremental fixes to the tool chain and the kernel.

Cool

> I have no objection to moving the site to another arch although
> there is some political
> benefit to having it run on parisc.  I am willing to try to build
> apache2 from unstable.

Well, we have apache2 installed from lenny now - it just isn't serving
anything useful :)

> I believe it would be useful to keep the site going until we see if
> restarting buildd will
> fly or not given the current level of improvement.

I am supportive of the site continuing to self-host, and I realize
that means it needs to run devel bits. But, there's two separate
issues I see there.

 1) We need to bridge the gap between now and then. Even if we had a
    buildd online today, just grinding through the necessary backlog
    would take weeks.
 2) I won't have time to be the principle admin for a system running
    unstable. I'm happy to help here & there, and w/ whatever
    transition ends up happening, but things like manually
    patching/fixing kernels, monitoring security updates and how they
    impact our bits, etc. Its a lot of work just for managing a single
    host.

For 1) I think the right answer is to move services to a new
stable/secure host for the time being and shut the existing machine
down. We can retain the option of moving things back once the unstable
port is in full force. As a side benefit, such a migration should also
help get the existing services running w/ newer packages
(e.g. apache2) and allow us cleanly transition services over w/
minimal downtime (demonstrate a working system first, then update DNS
records). Who knows how painful it will be to go from pre-lenny to sid
all at once.

2) can be solved by moving the domain to someone else's
infrastructure, or having a trusted volunteer to be the primary
admin for the system.

From: John David Anglin <dave.anglin@bell.net>
Subject: Re: decommissioning parisc-linux.org
Date: Sat, 11 Feb 2012 14:11:30 -0500
Message-ID: <BLU0-SMTP8734A5ED7DDBD9EC0C7A7597790@phx.gbl>
References: <20120208143347.GB22903@dannf.org> <CA+DQjFhKZiuxcoHJYcpDBUJW3xNNTDQhfm=d3trWG3u8DARtXw@mail.gmail.com> <BLU0-SMTP5575D9E1E9A88CEE0BD790977A0@phx.gbl> <20120209175547.GA22332@dannf.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Thibaut VARENE <varenet@parisc-linux.org>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	taggart@lackof.org, bame@riverrock.org,
	Carlos O'Donell <carlos@systemhalted.org>
To: dann frazier <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120209175547.GA22332@dannf.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9-Feb-12, at 12:55 PM, dann frazier wrote:

> Well, we have apache2 installed from lenny now - it just isn't serving
> anything useful :)
>

I don't know much about about web page setup, so I can't be much
help for this.

>> I believe it would be useful to keep the site going until we see if
>> restarting buildd will
>> fly or not given the current level of improvement.
>
> I am supportive of the site continuing to self-host, and I realize
> that means it needs to run devel bits. But, there's two separate
> issues I see there.
>
> 1) We need to bridge the gap between now and then. Even if we had a
>    buildd online today, just grinding through the necessary backlog
>    would take weeks.

Yes, I have been working on bridging the gap manually since last
summer.  I now have 5829 debs in my unstable archive.  Generally, things
have gotten easier as system stability has improved and bugs were
fixed.  It is a big job but I've done it in my spare time.

> 2) I won't have time to be the principle admin for a system running
>    unstable. I'm happy to help here & there, and w/ whatever
>    transition ends up happening, but things like manually
>    patching/fixing kernels, monitoring security updates and how they
>    impact our bits, etc. Its a lot of work just for managing a single
>    host.
>
> For 1) I think the right answer is to move services to a new
> stable/secure host for the time being and shut the existing machine
> down. We can retain the option of moving things back once the unstable
> port is in full force. As a side benefit, such a migration should also
> help get the existing services running w/ newer packages
> (e.g. apache2) and allow us cleanly transition services over w/
> minimal downtime (demonstrate a working system first, then update DNS
> records). Who knows how painful it will be to go from pre-lenny to sid
> all at once.
>
> 2) can be solved by moving the domain to someone else's
> infrastructure, or having a trusted volunteer to be the primary
> admin for the system.


I need to update a few more packages before magnum is ready for buildd.

Thibaut offered to setup the buildd but doesn't have a lot of free  
time.  I'm
willing to do general system admin and monitoring the build system,
but Thibaut  has to be in charge.  I'm hoping that Carlos is still  
willing to help
with uploads, and to try to get his current patches into the debian  
eglibc 2.13
patch set.  Otherwise, we may have to have a separate patch set.

I think ESIEE is the logical host site.  Magnum will be moved to an  
"open" IP
when it's ready to start building.  It will require careful  
firewalling at that time.

No objection to moving the current buildd to magnum.  I guess the  
security
updates are the biggest issue.  Once the buildd is running, we can  
work on
transitioning to a final release.

Dave
--
John David Anglin	dave.anglin@bell.net




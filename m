Return-Path: <soete.joel@tiscali.be>
Received: from spoolo2.tiscali.be (spoolo2.tiscali.be [62.235.13.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F1544851
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 17 Apr 2004 15:32:51 -0600 (MDT)
Message-ID: <4081A280.8050108@tiscali.be>
Date: Sat, 17 Apr 2004 21:32:48 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Andy Walker <ajwalker@broadpark.no>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
References: <407DA495.1090009@tiscali.be>
	<40711E5500006381@ocpmta2.freegates.net>
	<26419.193.161.152.244.1082114391.squirrel@www.puszczka.com>
	<4081731B.7070006@tiscali.be>
	<32875.127.0.0.1.1082234959.squirrel@www.puszczka.com>
In-Reply-To: <32875.127.0.0.1.1082234959.squirrel@www.puszczka.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Andy Walker wrote:
>>Hello Andy,
>>
>>Sorry for delay but I was a bit busy by a production server.
> 
> 
> No problem.
> 
> 
>>>2.6.6-rc1-pa0 shows the same behaviour,
>>
>>Thanks.
>>but not a surprise regarding previous test.
>>
>>
>>>although it does seem to make it
>>>through the Gentoo boot process most times.
>>
>>I would not be surprise if it occures during some fsck. Do you also use
>>ext3 on your Gentoo?
>>btw Gentoo always install pkg by a local rebuild from src (that's a long
>>time that I visit the site)?
> 
> 
> That's the Gentoo way - so every package on my system is compiled
> -march=2.0 -mschedule=8000. The downside is that install and upgrade
> takes a long time on slow machines.

Yes that why I do not investegate more: I don't have a lot of budget for my system which are generaly systems a bit outdated 
machine recover from trash still just enough for my investigation but a bit too slow to build all the tools I would like to 
maintained uptodate frequently. The very great stuff would have to have the choice: update from pre-compiled binaries or a local 
compile. The debian packaging system is very robust (some month ago, on a i386, I do an update from a old woody (r0 iirc) directly 
to unstable aka sid without any pb) but I do not yet find a clear doc explaining me how to personalize pkg from dpkg src (I would 
like for instance change the prefix in general /usr into /opt/app/app_rev a la hp)?

> The upside is that you get total
> control over package selection and compilation options. I've played
> with Debian before but I find apt a pain compared to Gentoo's portage.
> Also all this sid/woody/stable/unstable etc.... stuff confuses me.
> 
That is the simple aspect: in short
     the current stable release was named (the 2.x was potato, the current one woody)
     the very last packages otc are put in unstable (aka sid) for large testing and debuging
     when pkg become enough stable it is pushed in testing the futur debian release (recently named sarge)

there are also security update for stable release only because there are in general in unstable and testing before!

For my part I only have ineterest in very last available packages (so sid or unstable) to test new features but some times (rarely 
in fact) the system is a bit 'unstable' :) (that's my choice).

> 
>>>I've compiled 2.6.3-pa2 in the hope of getting the C180 up and stable.
>>
>>This seems to be the last one enough stable for me and my c110: I just
>>updated my distro (that used a lot tar iirc) and all works
>>fine with this kernel.
> 
> 
> 2.6.3-pa2 is rock solid. I've been running updates, kernel compilation -
> pretty heavy stuff, and no problems.
> I'm just about to 'emerge' X11 - that should keep it downloading,
> untarring and compiling for 24 hours.
>
Ok

> Any suggestions for things I might test to narrow our problem down.
> 
Not realy for the moment, as explain previously, the problem seems to apear between 2.6.4-rc1-pa3 and 2.6.4-rc3-pa6.
I will try to figure out now if it comes from upstream or from or tree: I am on going to rebuild 2.6.4-rc3-pa1 and see how will it 
behave.

Thanks a lot,
	Joel

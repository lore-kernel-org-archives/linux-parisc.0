From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: debian hppa
Date: Sat, 28 May 2011 02:58:26 +0200
Message-ID: <BANLkTi=maOnkCLD9aU=JDYL9257EkpHxnQ@mail.gmail.com>
References: <20110527213516.GH21744@dannf.org> <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: dann frazier <dannf@dannf.org>, dave.anglin@nrc-cnrc.gc.ca,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110527233738.0B95D4FCB@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 28, 2011 at 1:37 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> On Fri, May 27, 2011 at 04:20:46PM -0400, John David Anglin wrote:
>> > On Fri, 27 May 2011, dann frazier wrote:
>> >
>> > > There are no buildds configured for building debian-ports yet, as far
>> > > as I know.
>> >
>> > Will this happen?
>>
>> If there is interest/people willing to work towards maintaining a
>> stable release off of debian-ports, I can setup/manage buildds to do
>> so. But, I personally don't have interest in maintaining systems that
>> run an unstable-only port.
>
> I am willing to help within the limits of my free time (evenings and
> weekends).

I'm willing to provide access to hardware (machines listed under
"ESIEE testring" on http://www.fr.parisc-linux.org/cluster.html -
which needs update btw as the cupertino testring is no more) for as
long as it'll be usable with Debian. I have zero interest in Gentoo
(essentially for technical and practical reasons which are outside the
scope of this email) and will not migrate to it. That means that if
debian(-ports)/hppa is no more and I have to reclaim some rackspace in
the datacenter I manage, the parisc machines will likely be the first
to go away... I'll let people know if/whenever this happens, so that
pickups can be arranged if need be.

BTW, I'm still running 2.6.22.19 on most these machines, and I've kind
of lost track: do we have a known better kernel I could safely upgrade
to?

HTH
T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/

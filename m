From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: decommissioning parisc-linux.org
Date: Sat, 11 Feb 2012 23:12:05 +0100
Message-ID: <CA+DQjFicockZMkgKNwF=5Dk--gWraTfZg5mo1Ph8BnQjYkfK8A@mail.gmail.com>
References: <20120208143347.GB22903@dannf.org> <CA+DQjFhKZiuxcoHJYcpDBUJW3xNNTDQhfm=d3trWG3u8DARtXw@mail.gmail.com>
 <BLU0-SMTP5575D9E1E9A88CEE0BD790977A0@phx.gbl> <20120209175547.GA22332@dannf.org>
 <BLU0-SMTP8734A5ED7DDBD9EC0C7A7597790@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: dann frazier <dannf@dannf.org>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	taggart@lackof.org, bame@riverrock.org,
	"Carlos O'Donell" <carlos@systemhalted.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP8734A5ED7DDBD9EC0C7A7597790@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Feb 11, 2012 at 8:11 PM, John David Anglin <dave.anglin@bell.ne=
t> wrote:
> On 9-Feb-12, at 12:55 PM, dann frazier wrote:

>> 2) I won't have time to be the principle admin for a system running
>> =C2=A0 unstable. I'm happy to help here & there, and w/ whatever
>> =C2=A0 transition ends up happening, but things like manually
>> =C2=A0 patching/fixing kernels, monitoring security updates and how =
they
>> =C2=A0 impact our bits, etc. Its a lot of work just for managing a s=
ingle
>> =C2=A0 host.
>>
>> For 1) I think the right answer is to move services to a new
>> stable/secure host for the time being and shut the existing machine
>> down. We can retain the option of moving things back once the unstab=
le
>> port is in full force. As a side benefit, such a migration should al=
so
>> help get the existing services running w/ newer packages
>> (e.g. apache2) and allow us cleanly transition services over w/
>> minimal downtime (demonstrate a working system first, then update DN=
S
>> records). Who knows how painful it will be to go from pre-lenny to s=
id
>> all at once.
>>
>> 2) can be solved by moving the domain to someone else's
>> infrastructure, or having a trusted volunteer to be the primary
>> admin for the system.
>
>
>
> I need to update a few more packages before magnum is ready for build=
d.
>
> Thibaut offered to setup the buildd but doesn't have a lot of free ti=
me.
> =C2=A0I'm
> willing to do general system admin and monitoring the build system,
> but Thibaut =C2=A0has to be in charge. =C2=A0I'm hoping that Carlos i=
s still willing
> to help
> with uploads, and to try to get his current patches into the debian e=
glibc
> 2.13
> patch set. =C2=A0Otherwise, we may have to have a separate patch set.

Erm, it appears I didn't make myself clear: I'm willing to provide the
/hardware/ for buildd setup, but I certainly do not have time to tend
to routine buildd maintenance, as I've mentioned already. I understood
that at some point Carlos wanted to handle that part, but from what I
gather, he's also busy so it's probably not happening. I agree we need
someone to take care of the buildds, but I'm afraid it cannot be me.

HTH

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

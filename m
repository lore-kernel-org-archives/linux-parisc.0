From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: decommissioning parisc-linux.org
Date: Tue, 14 Feb 2012 19:31:28 +0100
Message-ID: <CA+DQjFh8qF961ZGqt8yHJu4gPP=ji9Y08hqseRoPQg7637uMQA@mail.gmail.com>
References: <20120208143347.GB22903@dannf.org> <CA+DQjFhKZiuxcoHJYcpDBUJW3xNNTDQhfm=d3trWG3u8DARtXw@mail.gmail.com>
 <BLU0-SMTP5575D9E1E9A88CEE0BD790977A0@phx.gbl> <20120209175547.GA22332@dannf.org>
 <BLU0-SMTP8734A5ED7DDBD9EC0C7A7597790@phx.gbl> <20120214180519.GA32602@dannf.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: John David Anglin <dave.anglin@bell.net>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	taggart@lackof.org, bame@riverrock.org,
	"Carlos O'Donell" <carlos@systemhalted.org>
To: dann frazier <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20120214180519.GA32602@dannf.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Feb 14, 2012 at 7:05 PM, dann frazier <dannf@dannf.org> wrote:
> On Sat, Feb 11, 2012 at 02:11:30PM -0500, John David Anglin wrote:
>> On 9-Feb-12, at 12:55 PM, dann frazier wrote:


>> >For 1) I think the right answer is to move services to a new
>> >stable/secure host for the time being and shut the existing machine
>> >down. We can retain the option of moving things back once the unsta=
ble
>> >port is in full force. As a side benefit, such a migration should a=
lso
>> >help get the existing services running w/ newer packages
>> >(e.g. apache2) and allow us cleanly transition services over w/
>> >minimal downtime (demonstrate a working system first, then update D=
NS
>> >records). Who knows how painful it will be to go from pre-lenny to =
sid
>> >all at once.
>> >
>> >2) can be solved by moving the domain to someone else's
>> >infrastructure, or having a trusted volunteer to be the primary
>> >admin for the system.
>>
>>
>> I need to update a few more packages before magnum is ready for buil=
dd.
>>
>> Thibaut offered to setup the buildd but doesn't have a lot of free
>> time. =C2=A0I'm
>> willing to do general system admin and monitoring the build system,
>> but Thibaut =C2=A0has to be in charge. =C2=A0I'm hoping that Carlos =
is still
>> willing to help
>> with uploads, and to try to get his current patches into the debian
>> eglibc 2.13
>> patch set. =C2=A0Otherwise, we may have to have a separate patch set=
=2E
>>
>> I think ESIEE is the logical host site. =C2=A0Magnum will be moved t=
o an
>> "open" IP
>> when it's ready to start building. =C2=A0It will require careful
>> firewalling at that time.
>>
>> No objection to moving the current buildd to magnum. =C2=A0I guess t=
he
>> security
>> updates are the biggest issue. =C2=A0Once the buildd is running, we =
can
>> work on
>> transitioning to a final release.
>
> All of the above sounds like good progress. However, it still leaves =
the
> parisc-linux.org machine running an unsupported OS for an undefined
> amount of time. During that time, this box will either need to be
> shutoff, or manually patched to avoid HP audit scans (or, worse yet,
> actual exploits). If the plan is to migrate this system to the
> debian-ports unstable archive when it becomes available, we'll need
> someone to maintain that install as well.

It looks to me like this burden clearly outweighs the benefits of
being selfhosted, so maybe the right move is to use a supported
architecture for hosting the website? Given the "audience" for
linux-parisc, I don't think it would make a significant difference...

my 2c.
T-Bone


--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: decommissioning parisc-linux.org
Date: Sun, 12 Feb 2012 00:26:01 +0100
Message-ID: <CA+DQjFj8fpctOjthKCsxRfM5TqS6J3ZBHMH4COuA7LUh1R_FMg@mail.gmail.com>
References: <20120208143347.GB22903@dannf.org> <CA+DQjFhKZiuxcoHJYcpDBUJW3xNNTDQhfm=d3trWG3u8DARtXw@mail.gmail.com>
 <BLU0-SMTP5575D9E1E9A88CEE0BD790977A0@phx.gbl> <20120209175547.GA22332@dannf.org>
 <BLU0-SMTP8734A5ED7DDBD9EC0C7A7597790@phx.gbl> <CA+DQjFicockZMkgKNwF=5Dk--gWraTfZg5mo1Ph8BnQjYkfK8A@mail.gmail.com>
 <BLU0-SMTP7852C9372515DE54919E3697790@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: dann frazier <dannf@dannf.org>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	taggart@lackof.org, bame@riverrock.org,
	"Carlos O'Donell" <carlos@systemhalted.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP7852C9372515DE54919E3697790@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Feb 11, 2012 at 11:41 PM, John David Anglin
<dave.anglin@bell.net> wrote:
> On 11-Feb-12, at 5:12 PM, Thibaut VARENE wrote:

> I understand. =C2=A0I'm willing to take care of the buildds, and do w=
hatever
> porting and patches that need doing as I can. =C2=A0What I meant is t=
hat
> you have to be in charge of system security as impacts the cluster
> as a whole. =C2=A0In particular, I think you will have to be involved=
 in the
> firewall setup.

Oh sure, no problem with that. I'd need some info as to what are the
needed services on the machine tho. My default firewall policy is
INPUT: DROP ;-)

Besides the firewall / access control, I think the only important
thing to take care of is MX configuration (ISTR buildds need a working
MX to function) so that the machine doesn't become an open-relay that
would put ESIEE's subnet onto the DNSBLs...

> I wasn't asking you to support the general system updates or buildd
> maintenance.

Roger that.

Cheers,
T-Bone

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Helge Deller <deller@gmx.de>
Subject: Re: Patch for segfaults in minifail tests
Date: Sun, 02 May 2010 10:19:50 +0200
Message-ID: <4BDD35A6.1010600@gmx.de>
References: <1272651697.2844.39.camel@mulgrave.site> <4BDCAA56.4010905@gmx.de> <B8D9B6DC-617D-45F0-806A-C73EB630CFFE@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <B8D9B6DC-617D-45F0-806A-C73EB630CFFE@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/02/2010 01:40 AM, Thibaut VAR=C8NE wrote:
> Le 2 mai 10 =E0 00:25, Helge Deller a =E9crit :
>=20
>> Thibeaut: I've attached the testcase (I called it minifail_dave, sin=
ce it
>> was changed by Dave). Maybe you can attach it to your website if it'=
s not
>> yet there...?
>=20
>=20
> Err, please, you're not making this easy for me.
>=20
> I've put on the website all the testcases I found in the emails, so i=
f
> dave already posted it, chances are it's already there.
>=20
> Could you please check the page and see if the testcase you're using =
is
> there? I tried to keep it simple by:
> a) keeping the original name (whenever available)
> b) linking to the corresponding message

Sorry Thibaut,

Thanks so much for putting all this stuff into the Wiki!
It's very useful to everybody, and of course I did already yesterday lo=
oked=20
if this minifail test program was in the list. I didn't found it.

So, it would be great if you could add it.

In principle you could replace the minifail3 testcase by this one.
And, I think this should be the major testcase which should work in the
end, since it's the one which doesn't has any tweaks. It should just
run without segfaults out of the box if we fixed the problem.

> If I'm the only one actually using that webpage, it's totally pointle=
ss...

You are not. I have looked at it already quite much!

Helge
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

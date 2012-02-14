From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: decommissioning parisc-linux.org
Date: Tue, 14 Feb 2012 14:41:46 +0100
Message-ID: <CA+DQjFj+fhktqADnwv2VhCC8en2yiBAQxzZ0aSrq0F_U8=BTBA@mail.gmail.com>
References: <20120208143347.GB22903@dannf.org> <1329057533.21613.39.camel@dabdike.int.hansenpartnership.com>
 <1329058172.21613.40.camel@dabdike.int.hansenpartnership.com>
 <1329076902.21613.52.camel@dabdike.int.hansenpartnership.com> <CA+DQjFju07GZurXzu_G_Kd2=ndSy4Jm5GhkUUXyrdKWeTjiURw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: dann frazier <dannf@dannf.org>, linux-parisc@vger.kernel.org,
	taggart@lackof.org, bame@riverrock.org
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CA+DQjFju07GZurXzu_G_Kd2=ndSy4Jm5GhkUUXyrdKWeTjiURw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 13, 2012 at 12:23 PM, Thibaut VARENE
<T-Bone@parisc-linux.org> wrote:
> On Sun, Feb 12, 2012 at 9:01 PM, James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
>> On Sun, 2012-02-12 at 08:49 -0600, James Bottomley wrote:
>
>>> > I've enabled it and put it up ... but it uses some type of server=
 side
>>> > scripting which I need to enable in the apache mods, so it's not
>>> > entirely functional yet.
>>>
>>> OK, done and up.
>>>
>>> it was using SSI ... I haven't seen that for at least 20 years ...
>>
>> I think I'm done. =C2=A0I've got the three sites
>> {www,ftp,hwdb}.parisc-linux.org up and running. =C2=A0There aren't a=
ny more,
>> are there (wiki seems to be eisee)? =C2=A0Could someone also check t=
he links
>> to see that nothing's broken.
>
> Hi James,
>
> Thanks for your help! The only thing that seems to be missing is
> userdir support ("a2enmod userdir" should fix it)

Just remembered I have admin access to palinux so I took care of
enabling userdirs. Sorry for not realizing this sooner ;P

HTH
T-Bone

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

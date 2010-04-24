From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Subject: PTE/TLB issues (was Re: Longstanding bug in our IRQ code (irqbalance HPMCs parisc SMP machines))
Date: Sat, 24 Apr 2010 18:44:08 +0200
Message-ID: <B43928AA-D2D6-4E1E-91A8-34BAF099F1C8@parisc-linux.org>
References: <20100424154824.C924E5160@hiauly1.hia.nrc.ca>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100424154824.C924E5160@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Le 24 avr. 10 =E0 17:48, John David Anglin a =E9crit :

>>> Sounds like it. Though the HPMCs are clearly different than the PTE
>>> issues
>>> that jda/carlos are seeing.
>>
>> True, but I remember Debian staff complaining about random =20
>> unexplained
>> hangs, I wouldn't be too surprised if this came into play...
>
> I have been looking at the PTE/TLB code for the last couple of weeks.
> I now believe that the majority of the random hangs, segvs at program
> startup are related to problems with the PTE/TLB code.


[snip]

Thanks for this detailed explanation. I've quoted your remarks to this =
=20
wiki page (as a reference point):
http://wiki.parisc-linux.org/KnownIssues#head-fc724f5d1b9a93f4b531a05fc=
1aab3314dde8c87

People, feel free to make sure everything there is as accurate as it =20
can be, btw... Also taking the opportunity to point at the "SMP perf / =
=20
cache issue" paragraph there... Might be related.

I've also added a link to the irqbalance bug on that same page.

=46WIW, the hangs I was referring to are those that kill the machine =20
without any output. Hopefully PTE/TLB issues are a bit more verbose? ;-=
)

HTH

--=20
Thibaut VAR=C8NE
http://www.parisc-linux.org/~varenet/

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

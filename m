From: Thibaut VARENE <varenet@debian.org>
Subject: Re: Bug#561203: threads and fork on machine with VIPT-WB cache
Date: Fri, 4 Jun 2010 12:44:55 +0200
Message-ID: <AANLkTiklDMpVgeJp54qcNvMcUp2Ns5lkEpwHxWOnLD8Y@mail.gmail.com>
References: <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <20100602171600.GA5566@hiauly1.hia.nrc.ca>
	<20100602175616.GA23219@lackof.org> <201006031150.15725.modestas@vainius.eu>
	<4C0850CB.20703@fsij.org> <20100604052106.GC15860@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: NIIBE Yutaka <gniibe@fsij.org>, 561203@bugs.debian.org,
	Modestas Vainius <modestas@vainius.eu>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	deller@gmx.de, linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, carlos@systemhalted.org
To: dann frazier <dannf@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100604052106.GC15860@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 4, 2010 at 7:21 AM, dann frazier <dannf@debian.org> wrote:
> On Fri, Jun 04, 2010 at 10:03:07AM +0900, NIIBE Yutaka wrote:
>> Modestas Vainius wrote:
>>>> Note that Debian's buildds run a UP kernel, so as soon as those fi=
xes
>>>> go upstream we can pull them in. Thanks for all your work here!
>>>>
>>>
>>> Well, as long as this is unfixed or at least "common", I don't see =
how hppa
>>> can be considered to be a release arch. Is that UP patch available =
somewhere?
>>
>> My case and my analysis talked about UP kernel, and John David Angli=
n
>> made a patch:
>> =C2=A0 =C2=A0 =C2=A0 http://bugs.debian.org/cgi-bin/bugreport.cgi?bu=
g=3D561203#144
>>
>> After that, the discussion went to SMP cases.
>>
>> It would be better to evaluate the patch again, and make sure it wor=
ks
>> for UP case and fix failures of buildd, then apply for Linux in Debi=
an
>> (only) for HPPA.
>>
>> I know that the patch is not that ideal because it touches
>> architecture independent part of Linux, but it is worth for Linux in
>> Debian (or Linux for the HPPA machine of buildd, at least).
>
> I'm happy to test the patch if necessary to help push this change
> upstream. However, we do need the change to go upstream before we can
> include it in the Debian kernel.

Just for reference, I've summarized the test cases and related patches =
here:
http://wiki.parisc-linux.org/TestCases

HTH

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

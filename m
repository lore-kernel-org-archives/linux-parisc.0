Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from crypto.hack.co.za (h-69-3-43-158.PHLAPAFG.covad.net [69.3.43.158])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB3A4482D
	for <parisc-linux@parisc-linux.org>; Tue, 13 May 2003 08:55:17 -0600 (MDT)
Date: Tue, 13 May 2003 10:55:20 -0400
Subject: Re: [parisc-linux] System hanging
From: Richard Todd <rtodd@antipentium.com>
To: Thibaut VAR=?ISO-8859-1?B?yA==?=NE <varenet@esiee.fr>
Cc: <parisc-linux@parisc-linux.org>
Message-ID: <BAE67F98.B30%rtodd@antipentium.com>
In-Reply-To: <AB345DD8-8550-11D7-AFCE-0030656F07A2@esiee.fr>
Mime-version: 1.0
Content-type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

k2000 root # cat /proc/version
Linux version 2.4.20-pa35 (root@cdimage) (gcc version 3.2.2) #2 SMP Sat May
10 10:36:26 EDT 2003



On 5/13/03 10:39 AM, "Thibaut VAR=C8NE" <varenet@esiee.fr> wrote:

> cat /proc/version please (ie: did you build your kernel with gcc 3.2.2?)
>=20
> I've been running 12days straight of building gcc in loop while having
> 2 setiathome instances running on a J5000 with 512M of RAM and
> experienced no hangs, that was with 2.4.20-pa18 SMP 64bit, built with
> gcc 3.0.4...
>=20
> oh, and fwiw:
> http://www.fr.parisc-linux.org/faq/kernelbug-howto.html
>=20
>=20
> Thibaut VARENE
> The PA/Linux ESIEE Team
> http://pateam.esiee.fr/
>=20
> Le mardi, 13 mai 2003, =E0 15:50 Europe/Paris, Richard Todd a =E9crit :
>=20
>> Hello all,
>> I am currently running on a J5000
>> 2000 root # uname -a
>> Linux k2000 2.4.20-pa35 #2 SMP Sat May 10 10:36:26 EDT 2003 parisc
>> unknown
>> unknown GNU/Linux
>>=20
>>=20
>> This issue I am having is during compiling andthing big the box has a
>> tendency to just hang hard meaning power cord reboot. Has anyone seen
>> this
>> before. I have a gig of ram and it does not seem to be a memory issue.
>> I am
>> currently compiling KDE and it just hangs the box every now and then...
>> Anyone ?=20
>=20

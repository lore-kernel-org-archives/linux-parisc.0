Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 892E04829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 Jan 2003 09:14:13 -0700 (MST)
Date: Tue, 17 Dec 2002 18:42:02 +0100
Message-ID: <3DED9B8900002122@ocpmta6.freegates.net>
In-Reply-To: <3DED9BBD000022D4@ocpmta7.freegates.net>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] quad tulip now not functional in 2.4.20
To: grundler@dsl2.external.hp.com,
	"Ed Schaller" <schallee@darkmist.net>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hello Grant,
>
>>>
>>>I've looked a bit at the same problem on A500 with
>>>a regular (single port) HP tulip card.
>>>
>>>> In the following dmesg out takes for 2.4.20-pa13 and 2.4.19-32 (debi=
an),
>>>> it seems that the older kernel is finding the transceiver and
>>>> successfully auto-negotiating the link while the newer is not.
>>>
>>>yeah - same symptom that I saw.
>>>
>>>> Any ideas how to solve this? Any help would be greatly appreciated.
>>>
>>>I suspect it's a tulip driver bug.
>>>I haven't had a chance to diff the 2.4.19 vs 2.4.20 tulip driver.
>>>One idea might be to "forward port" the 2.4.19 drivers/net/tulip code
>>>into 2.4.20.
>>>
>>Same on B2k with add card.
>>Hmm I notice strange detail:
>>2.4.19 : lan heart bit on (even if interface not configure)
>>2.4.20 (& 21-pre1) : no lan heart bit on (interface configured or not)
>>
>>I will try to revert tulip driver and advise you.
>>
>Well I find some minutes to do this reverse and it works.
>Still have to find the bug ?
>
Hmm I suspecting a test in eeprom.c:
line 193: if (ee_data[27] =3D=3D 0 || ee_data[ee_data[27]] =3D=3D0) {

which i temporarely change by if (ee_data[27] =3D=3D 0) { (as i 2.4.19)
and it works but I have not enough doc to fix this pb.

May be Ryan Bradetich could help us?

Joel


*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be

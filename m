Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7BB3482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Dec 2002 23:31:22 -0700 (MST)
Date: Wed, 18 Dec 2002 07:30:40 +0100
Message-ID: <3DED9A6600002207@ocpmta3.freegates.net>
In-Reply-To: <20021217181901.GA2254@dsl2.external.hp.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] quad tulip now not functional in 2.4.20
To: grundler@dsl2.external.hp.com,
	"Ryan Bradetich" <rbradetich@uswest.net>
Cc: "Ed Schaller" <schallee@darkmist.net>,
	parisc-linux@lists.parisc-linux.org
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

Hi Grant,
>
>On Tue, Dec 17, 2002 at 04:14:10PM +0100, jsoe0708@tiscali.be wrote:
>> >I will try to revert tulip driver and advise you.
>> Well I find some minutes to do this reverse and it works.
>> Still have to find the bug ?
>
>Unfortunately yes.
>But since the diff is small, it's alot easier.
>
>I'm most suspicious about the added checks for length field in eeprom.
>But I'll review the diff again and tinker with it today or tomorrow.
>I added that thinking that code only gets executed when there is no
>phy table (eg built-in). But the add-on cards do have a phy table.
>
(well it seems I do mistake when sent following info)
[also because diff is small]
In eeprom.c I also suspect:
line 193: if (ee_data[27] =3D=3D 0 || ee_data[ee_data[27]] =3D=3D 0) {

which I only reverse into:
if (ee_data[27] =3D=3D 0) {

and it works. Unforunately I do not have enough doc to actulay fix the pb=
.
May be Ryan could still help us?

Joel

*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be

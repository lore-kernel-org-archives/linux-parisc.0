Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id EEBD14829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Dec 2002 10:38:19 -0700 (MST)
Date: Thu, 19 Dec 2002 18:37:34 +0100
Message-ID: <3DED9BF500002918@ocpmta8.freegates.net>
In-Reply-To: <20021218165813.GA17944@dsl2.external.hp.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] quad tulip now not functional in 2.4.20
To: grundler@dsl2.external.hp.com
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
>On Tue, Dec 17, 2002 at 08:12:03AM +0100, jsoe0708@tiscali.be wrote:
>> Just to avoid you loose time here is a diff:
>...
>> -	if (ee_data[27] =3D=3D 0) {		/* No valid media table. */
>> +	if (ee_data[27] =3D=3D 0 || ee_data[ee_data[27]] =3D=3D 0) {  /* No =
valid media
>> table. */
>
>Like I suspected, backing out this change made add-on boards work again.=

>I've reverted that change in 2.4.20-pa15 along with a traps.c change.
>Please apply by hand and try the 4-port again.
>
Sorry, I was too tired yesterday evening and have not time today :-(.

But I see that Ed successfully tested. Great (I will also test it, ... ne=
xt
year :))

Thanks for all and let me wish you and your families a Merry Christmas an=
d
a Happy New Year,
    Joel



*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be

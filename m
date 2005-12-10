From: Keven Tipping <bytelogix@shaw.ca>
Subject: [parisc-linux] Stable Storage woes
Date: Sat, 10 Dec 2005 01:33:19 -0700
Message-ID: <C66D65CA-8B9E-4653-82F9-84820ED23925@shaw.ca>
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Type: multipart/mixed;
  boundary="===============0013831168=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0013831168==
Content-type: multipart/alternative; boundary=Apple-Mail-1--869907180


--Apple-Mail-1--869907180
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

Greetings to all!

This may be a awkward question to be asking over here, but this is  
really the only community of HPPA users that I've seen on the net so  
far.

I've got a K570 in my basement here that I need to change the Model  
String stuck up in Stable Storage (presumably on some magical NVRam  
or EEPROM chipset) somehow. The machine right now has been retarded  
by HP and thinks it is a "K370", despite having the Mainboard and all  
the hardware parts of a K570.

Therefore, PDC ever-so-helpfully warns me that my second Memory  
Carrier (which it finds, tests, and reports all RAM correctly on) is  
exceeding a K370's hardware specification, and that I have to remove  
it. It refuses to boot with the second card, despite the second card  
and all associated RAM working perfectly (Guess this is the "HP Way"  
of crippling your hardware marketing).

I'd like to know- how can I update the Model String? I know its  
possible via way of SS_Config, but thats another magical HP utility  
that only CE's apparently have, and HP told me they won't give it to  
a hobbyist with a K570 living in his basement :(. Can Linux do this,  
and if so, how would I go about updating the Model String?

I don't need to change anything else. I'd just like to be able to use  
the hardware that the machine physically supports, without PDC  
getting all freaked out about hardware specs and such.

Cheers!

Keven Tipping



--Apple-Mail-1--869907180
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=US-ASCII

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">Greetings to all!<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>This may be a awkward =
question to be asking over here, but this is really the only community =
of HPPA users that I've seen on the net so far.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I've got a K570 in my =
basement here that I need to change the Model String stuck up in Stable =
Storage (presumably on some magical NVRam or EEPROM chipset) somehow. =
The machine right now has been retarded by HP and thinks it is a "K370", =
despite having the Mainboard and all the hardware parts of a =
K570.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Therefore, PDC =
ever-so-helpfully warns me that my second Memory Carrier (which it =
finds, tests, and reports all RAM correctly on) is exceeding a K370's =
hardware specification, and that I have to remove it. It refuses to boot =
with the second card, despite the second card and all associated RAM =
working perfectly (Guess this is the "HP Way" of crippling your hardware =
marketing).</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>I'd=
 like to know- how can I update the Model String? I know its possible =
via way of SS_Config, but thats another magical HP utility that only =
CE's apparently have, and HP told me they won't give it to a hobbyist =
with a K570 living in his basement :(. Can Linux do this, and if so, how =
would I go about updating the Model String?</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I don't need to change =
anything else. I'd just like to be able to use the hardware that the =
machine physically supports, without PDC getting all freaked out about =
hardware specs and such.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Cheers!</DIV><DIV><BR><DIV> =
<SPAN class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><P style=3D"margin: =
0.0px 0.0px 0.0px 0.0px"><FONT face=3D"Helvetica" size=3D"3" =
style=3D"font: 12.0px Helvetica">Keven Tipping</FONT></P><BR =
class=3D"Apple-interchange-newline"></SPAN></SPAN></SPAN> =
</DIV><BR></DIV></BODY></HTML>=

--Apple-Mail-1--869907180--

--===============0013831168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0013831168==--

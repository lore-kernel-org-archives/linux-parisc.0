Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail16.speakeasy.net [216.254.0.216])
	by dsl2.external.hp.com (Postfix) with ESMTP id 27116483B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 May 2003 10:43:43 -0600 (MDT)
Message-ID: <3EB5433C.7020207@speakeasy.net>
Date: Sun, 04 May 2003 12:43:40 -0400
From: Chuck Slivkoff <caslivkoff@speakeasy.net>
MIME-Version: 1.0
To: tom@alaskatech.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] {kinda OT] A4947A applicability? and FC driver
 work
References: <1052020498.27841.7.camel@daily> <20030504041715.GH31610@parcelfarce.linux.theplanet.co.uk> <200305041008.49439.b.gunreben@web.de>
In-Reply-To: <200305041008.49439.b.gunreben@web.de>
Content-Type: multipart/alternative;
 boundary="------------040800080004010803000507"
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

This is a multi-part message in MIME format.
--------------040800080004010803000507
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Berthold Gunreben wrote:

>Am Sonntag, 4. Mai 2003 06:17 schrieb Matthew Wilcox:
> =20
>
>>On Sat, May 03, 2003 at 07:54:57PM -0800, Tom wrote:
>>   =20
>>
>>>I found one of these kits on eBay - C200 to C240 upgrade, CPU on
>>>mainboard. Do any of the HP techs around here know if it'll also fit a=

>>>C180? It'd be nice to drop a large performance upgrade into it for not=

>>>much cash...
>>>
If you can navigate your was through docs.hp.com, you can find these=20
manuals (PDF):

    installing the hp Visualize workstation c100, c110, c160, c180 to=20
c200 CPU upgrade (a4200-900xx)
    installing the hp Visualize workstation c200 to c240 CPU upgrade=20
(a4200-90035)

at this excessively long URL:

  http://h20000.www2.hp.com/bizsupport/TechSupport/DocumentIndex.jsp?
  contentType=3DSupportManual&locale=3Den_US&prodTypeId=3D12454&
  prodSeriesId=3D76204&taskId=3D130&prodSeriesId=3D76204&docIndexId=3D120=
917

>>Well... it'll _fit_.  Whether firmware will work properly is anyone's
>>guess. There's various differences between the C180 and C200 that
>>make this combination not sure to succeed.  My personal opinion (and
>>not speaking on behalf of my emplyer) is that it's going to work 90%.
>>   =20
>>
>
>I don=B4t think you will be very happy with it. One of the bigger proble=
ms will=20
>be your power supply. The C240 has a much stronger power supply (at leas=
t the=20
>one that I have) than the C180.=20
>
IIRC, the main reason for the larger power supply in the C200 (& up) was =

to support the Visualize FX-6 graphics interface (which has 3=20
PA-8000-based geometry engines & is not supported under Linux). I=20
believe the board will fit and as long as the power connections are the=20
same, it will probably work. But, there may still be hooks in the=20
firmware to detect the larger power supply. I might know someone who can =

answer this, but it would probably take a few days.

BTW, the service manual for the C-xxx models are available on that same U=
RL.



--------------040800080004010803000507
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
Berthold Gunreben wrote:<br>
<blockquote type="cite" cite="mid200305041008.49439.b.gunreben@web.de">
  <pre wrap="">Am Sonntag, 4. Mai 2003 06:17 schrieb Matthew Wilcox:
  </pre>
  <blockquote type="cite">
    <pre wrap="">On Sat, May 03, 2003 at 07:54:57PM -0800, Tom wrote:
    </pre>
    <blockquote type="cite">
      <pre wrap="">I found one of these kits on eBay - C200 to C240 upgrade, CPU on
mainboard. Do any of the HP techs around here know if it'll also fit a
C180? It'd be nice to drop a large performance upgrade into it for not
much cash...</pre>
    </blockquote>
  </blockquote>
</blockquote>
If you can navigate your was through docs.hp.com, you can find these
manuals (PDF):<br>
<br>
&nbsp;&nbsp;&nbsp; installing the hp Visualize workstation c100, c110, c160, c180 to
c200 CPU upgrade (a4200-900xx)<br>
&nbsp;&nbsp;&nbsp; installing the hp Visualize workstation c200 to c240 CPU upgrade
(a4200-90035)<br>
<br>
at this excessively long URL:<br>
<br>
&nbsp; <a class="moz-txt-link-freetext" href="http://h20000.www2.hp.com/bizsupport/TechSupport/DocumentIndex.jsp">http://h20000.www2.hp.com/bizsupport/TechSupport/DocumentIndex.jsp</a>?<br>
&nbsp; contentType=SupportManual&amp;locale=en_US&amp;prodTypeId=12454&amp;<br>
&nbsp;
prodSeriesId=76204&amp;taskId=130&amp;prodSeriesId=76204&amp;docIndexId=120917<br>
<br>
<blockquote type="cite" cite="mid200305041008.49439.b.gunreben@web.de">
  <blockquote type="cite">
    <pre wrap="">Well... it'll _fit_.  Whether firmware will work properly is anyone's
guess. There's various differences between the C180 and C200 that
make this combination not sure to succeed.  My personal opinion (and
not speaking on behalf of my emplyer) is that it's going to work 90%.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
I don&acute;t think you will be very happy with it. One of the bigger problems will 
be your power supply. The C240 has a much stronger power supply (at least the 
one that I have) than the C180. </pre>
</blockquote>
IIRC, the main reason for the larger power supply in the C200 (&amp;
up) was to support the Visualize FX-6 graphics interface (which has 3
PA-8000-based geometry engines &amp; is not supported under Linux). I
believe the board will fit and as long as the power connections are the
same, it will probably work. But, there may still be hooks in the
firmware to detect the larger power supply. I might know someone who
can answer this, but it would probably take a few days.<br>
<br>
BTW, the service manual for the C-xxx models are available on that same
URL.<br>
<br>
<br>
</body>
</html>

--------------040800080004010803000507--

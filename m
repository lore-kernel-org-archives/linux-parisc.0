Return-Path: <parisc-linux-request@lists.parisc-linux.org>
Received: from spam.carreker.com (unknown [65.221.249.208])
	by dsl2.external.hp.com (Postfix) with ESMTP id 015B6484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 18:32:20 -0700 (MST)
Received: from localhost (dalvir04.carreker.com [127.0.0.1])
	by spam.carreker.com (Postfix) with ESMTP id 5D4512E81AF
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 19:30:24 -0600 (CST)
Received: from spam.carreker.com ([127.0.0.1])
	by localhost (dalvir04.carreker.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 06978-05 for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 19:30:23 -0600 (CST)
Received: from pickup.carreker.com (unknown [172.21.1.23])
	by spam.carreker.com (Postfix) with ESMTP id 8E34C2E8424
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 18:54:47 -0600 (CST)
Message-ID: <20040126190003.98EBB48E6@dsl2.external.hp.com>
From: parisc-linux-request@lists.parisc-linux.org
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 26 Jan 2004 13:00:03 -0600
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_003_01C3E43E.A9554970"
Subject: [parisc-linux] parisc-linux Digest, Vol 2, Issue 33
Reply-To: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


------_=_NextPart_003_01C3E43E.A9554970
Content-Type: text/plain;
	charset="iso-8859-1"

Send parisc-linux mailing list submissions to
	parisc-linux@lists.parisc-linux.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
or, via email, send a message with subject or body 'help' to
	parisc-linux-request@lists.parisc-linux.org

You can reach the person managing the list at
	parisc-linux-owner@lists.parisc-linux.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of parisc-linux digest..."


Today's Topics:

   1. Re: A fix for B2k and CONFIG_PDC_CONSOLE pb (Matthew Wilcox)
   2. Re: A fix for B2k and CONFIG_PDC_CONSOLE pb (Joel Soete)
   3. Re: A fix for B2k and CONFIG_PDC_CONSOLE pb (Joel Soete)


----------------------------------------------------------------------

Message: 1
Date: Mon, 26 Jan 2004 17:25:05 +0000
From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] A fix for B2k and CONFIG_PDC_CONSOLE pb
To: Joel Soete <soete.joel@tiscali.be>
Cc: Christoph Plattner <christoph.plattner@gmx.at>,	Grant Grundler
	<grundler@parisc-linux.org>,
parisc-linux@lists.parisc-linux.org
Message-ID: <20040126172505.GQ11844@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii

On Mon, Jan 26, 2004 at 06:00:53PM +0100, Joel Soete wrote:
>  
>  	/* Bail if no console input device. */
> -	if (!PAGE0->mem_kbd.iodc_io)
> +	if ((PAGE0->mem_cons.cl_class != CL_DUPLEX) &&
!PAGE0->mem_kbd.iodc_io)
>  		return 0;
>  	
>  	/* wait for a keyboard (rs232)-input */
>  	spin_lock_irqsave(&pdc_lock, flags);
> -	real32_call(PAGE0->mem_kbd.iodc_io,
> -		    (unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
> -		    PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers), 
> -		    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
> +	if (PAGE0->mem_cons.cl_class == CL_DUPLEX)

This doesn't make sense.  PAGE0->mem_cons.cl_class has to be CL_DUPLEX
otherwise the test above would have failed.  Do you perhaps mean that &&
above to be an || ?  If so, this would all read better as ...

	/* wait for a keyboard (rs232)-input */
	spin_lock_irqsave(&pdc_lock, flags);
	if (PAGE0->mem_cons.cl_class == CL_DUPLEX) {

		real32_call(PAGE0->mem_cons.iodc_io,
			    (unsigned long)PAGE0->mem_cons.hpa,
ENTRY_IO_CIN,
			    PAGE0->mem_cons.spa,
__pa(PAGE0->mem_cons.dp.layers), 
			    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1,
0);
	} else if (PAGE0->mem_kbd.iodc_io) {
		real32_call(PAGE0->mem_kbd.iodc_io,
			    (unsigned long)PAGE0->mem_kbd.hpa,
ENTRY_IO_CIN,
			    PAGE0->mem_kbd.spa,
__pa(PAGE0->mem_kbd.dp.layers), 
			    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1,
0);
	} else {
		spin_unlock_irqrestore(&pdc_lock, flags);
		return 0;
	}

Slightly ugly to have two unlocks for the same lock, but that's better
than duplicating the test.  I haven't looked at the code, maybe we could
use a goto instead.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and
refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain


------------------------------

Message: 2
Date: Mon, 26 Jan 2004 19:20:26 +0100
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] A fix for B2k and CONFIG_PDC_CONSOLE pb
To: "Matthew Wilcox" <willy@debian.org>
Cc: Christoph Plattner <christoph.plattner@gmx.at>,	Grant Grundler
	<grundler@parisc-linux.org>,
parisc-linux@lists.parisc-linux.org
Message-ID: <40153110000001C0@ocpmta2.freegates.net>
Content-Type: text/plain; charset="ISO-8859-1"



> +	if ((PAGE0->mem_cons.cl_class != CL_DUPLEX) &&
!PAGE0->mem_kbd.iodc_io)
>  		return 0;
Right Matthew this case is nearly impossible (may be excepted if
disconected
the usb kbd during the boot), it would means that my pdc_console is not
a
serial one (ie graphic([01])) but no usb kdb found, so in that case pdc
would
switch console automaticaly to serial.

I would just still check the case when I have an usb kbd (I would have
to
recover one) but the pdc console is setup to serial port (eg no graphic
screen
available) just for an output screen without input kbd? 

Thanks for your attention and remarks,
    Joel


------------------------------------------------------------------------
-
Tiscali ADSL: 12 mois à 29,50 EUR/mois! L'Internet rapide, c'est pour
tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr




------------------------------

Message: 3
Date: Mon, 26 Jan 2004 19:38:50 +0100
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] A fix for B2k and CONFIG_PDC_CONSOLE pb
To: "Matthew Wilcox" <willy@debian.org>
Cc: Christoph Plattner <christoph.plattner@gmx.at>,	Grant Grundler
	<grundler@parisc-linux.org>,
parisc-linux@lists.parisc-linux.org
Message-ID: <4015311000000204@ocpmta2.freegates.net>
Content-Type: text/plain; charset="ISO-8859-1"

Sorry for auto reply, but I just find back the right kdb and:

>I would just still check the case when I have an usb kbd (I would have
to
>recover one) but the pdc console is setup to serial port (e
>no graphic screen available) just for an output screen without input
kbd?


That case is also impossible, the console setup as serial_1 (eg) is
always
CL_DUPLEX :(

I will so review my patch.

Thanks for all,
    Joel


------------------------------------------------------------------------
-
Tiscali ADSL: 12 mois à 29,50 EUR/mois! L'Internet rapide, c'est pour
tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr




------------------------------

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


End of parisc-linux Digest, Vol 2, Issue 33
*******************************************

------_=_NextPart_003_01C3E43E.A9554970
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>parisc-linux Digest, Vol 2, Issue 33</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Send parisc-linux mailing list submissions to</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>parisc-linux@lists.parisc-linux.org</FONT>
</P>

<P><FONT SIZE=3D2>To subscribe or unsubscribe via the World Wide Web, =
visit</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2><A =
HREF=3D"http://lists.parisc-linux.org/mailman/listinfo/parisc-linux" =
TARGET=3D"_blank">http://lists.parisc-linux.org/mailman/listinfo/parisc-=
linux</A></FONT>
<BR><FONT SIZE=3D2>or, via email, send a message with subject or body =
'help' to</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>parisc-linux-request@lists.parisc-linux.org</FONT>
</P>

<P><FONT SIZE=3D2>You can reach the person managing the list at</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>parisc-linux-owner@lists.parisc-linux.org</FONT>
</P>

<P><FONT SIZE=3D2>When replying, please edit your Subject line so it is =
more specific</FONT>
<BR><FONT SIZE=3D2>than &quot;Re: Contents of parisc-linux =
digest...&quot;</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Today's Topics:</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;&nbsp; 1. Re: A fix for B2k and =
CONFIG_PDC_CONSOLE pb (Matthew Wilcox)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 2. Re: A fix for B2k and =
CONFIG_PDC_CONSOLE pb (Joel Soete)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 3. Re: A fix for B2k and =
CONFIG_PDC_CONSOLE pb (Joel Soete)</FONT>
</P>
<BR>

<P><FONT =
SIZE=3D2>---------------------------------------------------------------=
-------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 1</FONT>
<BR><FONT SIZE=3D2>Date: Mon, 26 Jan 2004 17:25:05 +0000</FONT>
<BR><FONT SIZE=3D2>From: Matthew Wilcox &lt;willy@debian.org&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [parisc-linux] A fix for B2k and =
CONFIG_PDC_CONSOLE pb</FONT>
<BR><FONT SIZE=3D2>To: Joel Soete &lt;soete.joel@tiscali.be&gt;</FONT>
<BR><FONT SIZE=3D2>Cc: Christoph Plattner =
&lt;christoph.plattner@gmx.at&gt;,&nbsp;&nbsp;&nbsp;&nbsp; Grant =
Grundler</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&lt;grundler@parisc-linux.org&gt;,&nbsp;&nbsp;&nbsp; =
parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>Message-ID: =
&lt;20040126172505.GQ11844@parcelfarce.linux.theplanet.co.uk&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; charset=3Dus-ascii</FONT>
</P>

<P><FONT SIZE=3D2>On Mon, Jan 26, 2004 at 06:00:53PM +0100, Joel Soete =
wrote:</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; /* Bail if no =
console input device. */</FONT>
<BR><FONT SIZE=3D2>&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if =
(!PAGE0-&gt;mem_kbd.iodc_io)</FONT>
<BR><FONT SIZE=3D2>&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if =
((PAGE0-&gt;mem_cons.cl_class !=3D CL_DUPLEX) &amp;&amp; =
!PAGE0-&gt;mem_kbd.iodc_io)</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; /* wait for a =
keyboard (rs232)-input */</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; =
spin_lock_irqsave(&amp;pdc_lock, flags);</FONT>
<BR><FONT SIZE=3D2>&gt; -&nbsp;&nbsp;&nbsp;&nbsp; =
real32_call(PAGE0-&gt;mem_kbd.iodc_io,</FONT>
<BR><FONT SIZE=3D2>&gt; -&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; (unsigned =
long)PAGE0-&gt;mem_kbd.hpa, ENTRY_IO_CIN,</FONT>
<BR><FONT SIZE=3D2>&gt; -&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
PAGE0-&gt;mem_kbd.spa, __pa(PAGE0-&gt;mem_kbd.dp.layers), </FONT>
<BR><FONT SIZE=3D2>&gt; -&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
__pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);</FONT>
<BR><FONT SIZE=3D2>&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if =
(PAGE0-&gt;mem_cons.cl_class =3D=3D CL_DUPLEX)</FONT>
</P>

<P><FONT SIZE=3D2>This doesn't make sense.&nbsp; =
PAGE0-&gt;mem_cons.cl_class has to be CL_DUPLEX</FONT>
<BR><FONT SIZE=3D2>otherwise the test above would have failed.&nbsp; Do =
you perhaps mean that &amp;&amp;</FONT>
<BR><FONT SIZE=3D2>above to be an || ?&nbsp; If so, this would all read =
better as ...</FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>/* wait =
for a keyboard (rs232)-input */</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>spin_lock_irqsave(&amp;pdc_lock, flags);</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>if =
(PAGE0-&gt;mem_cons.cl_class =3D=3D CL_DUPLEX) {</FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>real32_call(PAGE0-&gt;mem_cons.iodc_io,</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp; (unsigned long)PAGE0-&gt;mem_cons.hpa, =
ENTRY_IO_CIN,</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp; PAGE0-&gt;mem_cons.spa, =
__pa(PAGE0-&gt;mem_cons.dp.layers), </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp; __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, =
0);</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>} else if =
(PAGE0-&gt;mem_kbd.iodc_io) {</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>real32_call(PAGE0-&gt;mem_kbd.iodc_io,</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp; (unsigned long)PAGE0-&gt;mem_kbd.hpa, =
ENTRY_IO_CIN,</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp; PAGE0-&gt;mem_kbd.spa, =
__pa(PAGE0-&gt;mem_kbd.dp.layers), </FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&nbsp;&nbsp;&nbsp; __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, =
0);</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>} else =
{</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>spin_unlock_irqrestore(&amp;pdc_lock, flags);</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>return =
0;</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>}</FONT>
</P>

<P><FONT SIZE=3D2>Slightly ugly to have two unlocks for the same lock, =
but that's better</FONT>
<BR><FONT SIZE=3D2>than duplicating the test.&nbsp; I haven't looked at =
the code, maybe we could</FONT>
<BR><FONT SIZE=3D2>use a goto instead.</FONT>
</P>

<P><FONT SIZE=3D2>-- </FONT>
<BR><FONT SIZE=3D2>&quot;Next the statesmen will invent cheap lies, =
putting the blame upon </FONT>
<BR><FONT SIZE=3D2>the nation that is attacked, and every man will be =
glad of those</FONT>
<BR><FONT SIZE=3D2>conscience-soothing falsities, and will diligently =
study them, and refuse</FONT>
<BR><FONT SIZE=3D2>to examine any refutations of them; and thus he will =
by and by convince </FONT>
<BR><FONT SIZE=3D2>himself that the war is just, and will thank God for =
the better sleep </FONT>
<BR><FONT SIZE=3D2>he enjoys after this process of grotesque =
self-deception.&quot; -- Mark Twain</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 2</FONT>
<BR><FONT SIZE=3D2>Date: Mon, 26 Jan 2004 19:20:26 +0100</FONT>
<BR><FONT SIZE=3D2>From: &quot;Joel Soete&quot; =
&lt;soete.joel@tiscali.be&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [parisc-linux] A fix for B2k and =
CONFIG_PDC_CONSOLE pb</FONT>
<BR><FONT SIZE=3D2>To: &quot;Matthew Wilcox&quot; =
&lt;willy@debian.org&gt;</FONT>
<BR><FONT SIZE=3D2>Cc: Christoph Plattner =
&lt;christoph.plattner@gmx.at&gt;,&nbsp;&nbsp;&nbsp;&nbsp; Grant =
Grundler</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&lt;grundler@parisc-linux.org&gt;,&nbsp;&nbsp;&nbsp; =
parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>Message-ID: =
&lt;40153110000001C0@ocpmta2.freegates.net&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; =
charset=3D&quot;ISO-8859-1&quot;</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2>&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if =
((PAGE0-&gt;mem_cons.cl_class !=3D CL_DUPLEX) &amp;&amp; =
!PAGE0-&gt;mem_kbd.iodc_io)</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;</FONT>
<BR><FONT SIZE=3D2>Right Matthew this case is nearly impossible (may be =
excepted if disconected</FONT>
<BR><FONT SIZE=3D2>the usb kbd during the boot), it would means that my =
pdc_console is not a</FONT>
<BR><FONT SIZE=3D2>serial one (ie graphic([01])) but no usb kdb found, =
so in that case pdc would</FONT>
<BR><FONT SIZE=3D2>switch console automaticaly to serial.</FONT>
</P>

<P><FONT SIZE=3D2>I would just still check the case when I have an usb =
kbd (I would have to</FONT>
<BR><FONT SIZE=3D2>recover one) but the pdc console is setup to serial =
port (eg no graphic screen</FONT>
<BR><FONT SIZE=3D2>available) just for an output screen without input =
kbd? </FONT>
</P>

<P><FONT SIZE=3D2>Thanks for your attention and remarks,</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; Joel</FONT>
</P>
<BR>

<P><FONT =
SIZE=3D2>---------------------------------------------------------------=
----------</FONT>
<BR><FONT SIZE=3D2>Tiscali ADSL: 12 mois =E0 29,50 &#8364;/mois! =
L'Internet rapide, c'est pour tout</FONT>
<BR><FONT SIZE=3D2>le monde.</FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"http://reg.tiscali.be/default.asp?lg=3Dfr" =
TARGET=3D"_blank">http://reg.tiscali.be/default.asp?lg=3Dfr</A></FONT>
</P>
<BR>
<BR>
<BR>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT SIZE=3D2>Message: 3</FONT>
<BR><FONT SIZE=3D2>Date: Mon, 26 Jan 2004 19:38:50 +0100</FONT>
<BR><FONT SIZE=3D2>From: &quot;Joel Soete&quot; =
&lt;soete.joel@tiscali.be&gt;</FONT>
<BR><FONT SIZE=3D2>Subject: Re: [parisc-linux] A fix for B2k and =
CONFIG_PDC_CONSOLE pb</FONT>
<BR><FONT SIZE=3D2>To: &quot;Matthew Wilcox&quot; =
&lt;willy@debian.org&gt;</FONT>
<BR><FONT SIZE=3D2>Cc: Christoph Plattner =
&lt;christoph.plattner@gmx.at&gt;,&nbsp;&nbsp;&nbsp;&nbsp; Grant =
Grundler</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT =
SIZE=3D2>&lt;grundler@parisc-linux.org&gt;,&nbsp;&nbsp;&nbsp; =
parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2>Message-ID: =
&lt;4015311000000204@ocpmta2.freegates.net&gt;</FONT>
<BR><FONT SIZE=3D2>Content-Type: text/plain; =
charset=3D&quot;ISO-8859-1&quot;</FONT>
</P>

<P><FONT SIZE=3D2>Sorry for auto reply, but I just find back the right =
kdb and:</FONT>
</P>

<P><FONT SIZE=3D2>&gt;I would just still check the case when I have an =
usb kbd (I would have to</FONT>
<BR><FONT SIZE=3D2>&gt;recover one) but the pdc console is setup to =
serial port (e</FONT>
<BR><FONT SIZE=3D2>&gt;no graphic screen available) just for an output =
screen without input kbd?</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>That case is also impossible, the console setup as =
serial_1 (eg) is always</FONT>
<BR><FONT SIZE=3D2>CL_DUPLEX :(</FONT>
</P>

<P><FONT SIZE=3D2>I will so review my patch.</FONT>
</P>

<P><FONT SIZE=3D2>Thanks for all,</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; Joel</FONT>
</P>
<BR>

<P><FONT =
SIZE=3D2>---------------------------------------------------------------=
----------</FONT>
<BR><FONT SIZE=3D2>Tiscali ADSL: 12 mois =E0 29,50 &#8364;/mois! =
L'Internet rapide, c'est pour tout</FONT>
<BR><FONT SIZE=3D2>le monde.</FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"http://reg.tiscali.be/default.asp?lg=3Dfr" =
TARGET=3D"_blank">http://reg.tiscali.be/default.asp?lg=3Dfr</A></FONT>
</P>
<BR>
<BR>
<BR>

<P><FONT SIZE=3D2>------------------------------</FONT>
</P>

<P><FONT =
SIZE=3D2>_______________________________________________</FONT>
<BR><FONT SIZE=3D2>parisc-linux mailing list</FONT>
<BR><FONT SIZE=3D2>parisc-linux@lists.parisc-linux.org</FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"http://lists.parisc-linux.org/mailman/listinfo/parisc-linux" =
TARGET=3D"_blank">http://lists.parisc-linux.org/mailman/listinfo/parisc-=
linux</A></FONT>
</P>
<BR>

<P><FONT SIZE=3D2>End of parisc-linux Digest, Vol 2, Issue 33</FONT>
<BR><FONT SIZE=3D2>*******************************************</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_003_01C3E43E.A9554970--

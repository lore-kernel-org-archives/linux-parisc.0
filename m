Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id EBC75483E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Feb 2003 11:49:17 -0700 (MST)
Date: Wed, 26 Feb 2003 19:48:55 +0100
Message-ID: <3E5BA2910000088D@ocpmta3.freegates.net>
In-Reply-To: <3E5BA29100000887@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] B2000 revisited
To: "Derek Engelhaupt" <derekengelhaupt@rocketmail.com>,
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

>-- Original Message --
>From: "Joel Soete" <jsoe0708@tiscali.be>
>Subject: RE: [parisc-linux] B2000 revisited
>To: "Derek Engelhaupt" <derekengelhaupt@rocketmail.com>,
>	parisc-linux@lists.parisc-linux.org
>Date: Wed, 26 Feb 2003 19:42:59 +0100
>
>
>Derek,
>
>>-- Original Message --
>>From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
>>Subject: RE: [parisc-linux] B2000 revisited
>>To: parisc-linux@lists.parisc-linux.org
>>Date: Wed, 26 Feb 2003 09:59:29 -0800 (PST)
>>
>>
>>
>>I initially tried to load using the graphics console and the keyboard (USB)
>>is having issues, but loading from serial console seems to work fine. 
The
>>load isn't complete as yet so I will have to see if XFree works once it's
>>complete.
>
>If you could see (even if you boot from a serial console) a penguin on your
>graphical screen, it is very good.
>Grab a XF86Config-4 config file (may be change the definition and depth
according
>to the dmesg info about ... stifb 1288*1024-8)
>
May be in much details:

in your dmesg you should find
...
STI device: INTERNAL...
...
fb0: stifb 1280*1024-8 frame buffer device
           ^^^^^^^^^ ^

If your device is well supported (if not it would tell it),
in the XF86Config-4, you should match in Section "Screen" your actual DefaultDepth
with here 8 (from -8 above) and in the corresponding SubSection "Display"
your actual Modes: here 1280*1024 (and only this; switching is not possible)

hth,
    Joel

>Good luck,
>    Joel
>
>
>> Dan Baker <dan_baker@eli.net> wrote:Excellent idea! I will try it this
>after
>>noon!-----Original Message-----
>>From: parisc-linux-admin@lists.parisc-linux.org [mailto:parisc-linux-admin@lists.parisc-linux.org]On
>>Behalf Of Derek Engelhaupt
>>Sent: Wednesday, February 26, 2003 6:34 AM
>>To: parisc-linux@lists.parisc-linux.org
>>Subject: RE: [parisc-linux] B2000 revisited
>>
>>
>>Well, I threw my PCI EG card in there from my C360 and booted the netinst
>>ISO in the IDE CDROM and I got the penquin with the user configuration
interface
>>so maybe once it's loaded I will be able to configure the XFree on the
EG
>>card.  Only time will tell at this point. 
>>derek 
>> Joel Soete <jsoe0708@tiscali.be> wrote:
>>
>>>-- Original Message --
>>>From: Derek Engelhaupt 
>>>To: parisc-linux@lists.parisc-linux.org
>>>Subject: [parisc-linux] B2000 revisited
>>>Date: Tue, 25 Feb 2003 23:10:31 -0800 (PST)
>>>
>>>
>>>
>>>Hey all,
>>>
>>>Did a search through the m-l archives, but couldn't find an answer to
my
>>>question. Has anyone gotten XFree up on a B2000 using the onboard graphics
>>>port (it's an FXE from what I gather)? Or is everyone with a B2000 using
>>>a serial console?
>>
>>Unfortunaltely under xfree86 there is not yet support for this gfx :(
>>And not yet news about potential sources availability (may be in a near
>future???)
>>
>>> I'm guessing the C3000 would fall into the same boat.
>>
>>Could not help about this model.
>>
>>
>>> Thanks.
>>>
>>Well come,
>>Joel
>>
>>------------------ ---------------
>>Vous surfez avec une ligne classique ?
>>Faites des economies avec Tiscali Complete
>>... Plus d'info sur http://complete.tiscali.be
>>
>>
>>
>>
>>---------------------------------
>>Do you Yahoo!?
>>Yahoo! Tax Center - forms, calculators, tips, and more
>>
>>
>>---------------------------------
>>Do you Yahoo!?
>>Yahoo! Tax Center - forms, calculators, tips, and more
>
>
>---------------------------------
>Vous surfez avec une ligne classique ?
>Faites des economies avec Tiscali Complete
>... Plus d'info sur http://complete.tiscali.be
>
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id D33F54829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 15:44:04 -0600 (MDT)
Date: Tue, 17 Sep 2002 23:43:49 +0200
Subject: Re: [parisc-linux] Re: Status SPIFI SCSI
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v543)
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
To: Christoph Plattner <christoph.plattner@gmx.at>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <3D879F30.5D9A928C@gmx.at>
Message-Id: <8CCD3676-CA86-11D6-8C42-0030656F07A2@esiee.fr>
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

Le mardi, 17 sep 2002, =E0 23:31 Europe/Paris, Christoph Plattner a =
=E9crit=20
:

> Hello,
>
> the problem I wanted to point out is, that not the SCSI
> interface problem is the point.
yes i got that.
>
> IMO we have a simple (take the word "simple" not too
> critical ...) software setup problem. It seems, that
> we do not access the chip physically.
ok
>
> I have no NDA, I have no possibility to look into the
> source codes of HP-UX (but I want to have it !!), I have
> no hardware docu, no chip docu (although I am able to
> read them and I want to have access), so my help here
> is very restricted !!!
Alas, it looks like we're all in the same case here...
>
> But one small hint: The "chip selelct" line and the
> low order address bits, to see if there is really a
> hardware access to this chip. Further perhaps the
> read and write control line. I do not know the
I agree on the fact that CS;R/W; and other signal are
mandatory to trace chip activity, but if we don't have
a somehow precise pinout, it will be helpless...
We can eventually trace all pins of the chipset, but if
we don't know what is what, that won't be useful.
> HP own bus system (I also miss such documentation),
> but I use simple the words of a standard bus access
> (RD, WR, CS or CE, address lines, data lines).
>
> HOW CAN I GET DOCUMENTATIONS ????
Alas, they're all "for your eyes only".
We've been fighting with such a problem for ages.
We have lots of old 725 cards (SCSI, ATM and others)
for which we couldn't developp driver since we didn't have
any doc.
Same for newest graphic cards (FX series)...

If someone can help on that point, that would be really
awesome.

Of course we (at ESIEE) are ready to sign a NDA...
>
> Bye
> Christoph
>
Thibaut.
>
>
> Thibaut VARENE wrote:
>>
>> Le mardi, 17 sep 2002, =E0 20:33 Europe/Paris, Christoph Plattner a=20=

>> =E9crit
>> :
>>
>> Hi Christoph,
>>> Hello Ryan,
>>>
>>> I think usinf the logic analyser will not help you on the
>>> SCSI bus. You need the logic analyser on the SPIFI chip!!!
>> That's not a problem,
>> atm we have a 16channels analyser (we can have up to 128 if needed),
>> we tried using the HP 2423A SCSI preprocessor, but ours seems b0rken,
>> therefore we decided to plug directly onto the scsi board.
>>
>> So plugging onto SPIFI chip shouldn't be a pb, as long as we have its
>> pinout,
>> so that we can isolate signals we're trying to find.
>>
>> So if you can provide us with the pin numbers we should plug on,
>> that would help a lot ! :)
>>>
>>> As I already mentioned in another mail, I think, we
>>> DO NOT access the real device. As I have mentioned,
>>> we only read out 0x0000ff00 at each address and we
>>> "write" the SCSI command in an invalid space ! So this
>>> is "OK", that the chip do not produce any interrupts !
>>>
>>> I think, this is a very basic problem of the bus or
>>> i/o bus initilization or the Loquix init, or whatever.
>>>
>>> I do not expect any frame on the SCSI output !
>>>
>>> Bye
>>> Christoph
>>>
>>>
>>> Ryan Bradetich wrote:
>>>>
>>>> Hello Christoph,
>>>>
>>>> On Sun, 2002-09-15 at 17:25, Christoph Plattner wrote:
>>>>> Hallo Ryan,
>>>>>
>>>>> here some comments on my non-successful work so far.
>>>>>
>>>>> I did code reading and used debug instrumented code
>>>>> to understand the structure behind the linux SCSI
>>>>> handling.
>>>>>
>>>>> Further I studied the NetBSD code.
>>>>>
>>>>> One major point: We do not get any interrupts.
>>>>> For my analysis I only had a look on the first
>>>>> steps of SCSI initialization, so this was the
>>>>> INQUERY command.
>>>>
>>>> This is where I am also currently stuck :(  The
>>>> ESIEE guys are going to hook up an analyzer to the
>>>> box and see if the target device is getting the command
>>>> (ie... did we send the command correctly to the device)
>>>> or if the device returns a command (do we catch the
>>>> command the device is returning).  I have been studyting
>>>> the setup routines in the HP-UX driver and I believe
>>>> I have the chip initialized properly ... but I am not
>>>> sure why I am not getting any interrupts.   Hopefully
>>>> between ESIEE, you, and myself and anyone else
>>>> interested we can figure this out.
>>>>
>>>>> The spifi command routine is called correctly,
>>>>> but it has a wrong logical implementation. As I
>>>>> have seen on other (older) linux driver, the
>>>>> xxx_command() has to block, after the command was
>>>>> successful completed by interrupt. But the interrupt
>>>>> never comes !! Even a "long" delay for simulating
>>>>> blocking does not solve this problem.
>>>>
>>>> That is highly possible.  The driver skeleton is just
>>>> a test harness for me right now.  I am just trying to see
>>>> what I can get returned from the spifi chip (that is why
>>>> most of the functions are stubs with printk.  Once I see
>>>> an interrupt come in, I'll start working on putting that piece
>>>> togeather.
>>>>
>>>>> =46rom base of the NetBSD code, I cannot follow your
>>>>> code resetting the spifi subsystem. I think you have
>>>>> this from HP-UX code. Especially the
>>>>>
>>>>>   __raw_writel(CMD_RESET, dev->hpa + IO_MODULE_COMMAND);
>>>>
>>>> Yes, this is part of the initizlization from the HP-UX
>>>> driver.  The Loquix chip sits between the HP-PB bus, and
>>>> the spifi scsi chip.  According to the HP-UX driver, the
>>>> Loquix chip also required some setup.  Once again, I
>>>> do not actually have the Loquix documentation, but I might
>>>> have a lead on it.  Will have to wait and see if that lead
>>>> pans out.
>>>>
>>>>> Is this a reset method via the IO PDC address space
>>>>> common for all HP devices ? In the NetBSD the full
>>>>> reset is done only via the `auxctrl' register, which
>>>>> you use for releasing the reset state.
>>>>
>>>> I am not sure about all the HP devices.  It might be an iodc
>>>> specific call.  I will have to look at the driver again,
>>>> but that might reset the loquix chip *shrug* I'll take
>>>> a look and see what I can find.
>>>>
>>>>> So we have a principal problem here, not having correct
>>>>> access to the spifi subsystem. Except: the SCSI-ID is
>>>>> read out correctly, I think, as ...
>>>>>
>>>>> SCSI subsystem driver Revision: 1.00
>>>>> DEBUG: 0xfff74c00
>>>>> Device: Sahp Baat Kiuh SCSI
>>>>> scsi0 : SPIFI SCSI: scsi_id: 7 IRQ: 34 type: SPIFI-3 (SE) parity
>>>>> checking: enabled
>>>>>
>>>>> ... is reported !
>>>>
>>>> That is where I am also. We actually read the type SPIFI-3 (SE) for
>>>> the
>>>> SKUNK card, and SPIFI-3 (DF) for the wizard (16-bit) card.  I have
>>>> tested this on both cards so I know it works.  I am convinced we =
are
>>>> reading the correct information from the card, but what I am not
>>>> convinced of is that we have it setup properly yet :)  The problem=20=

>>>> is
>>>> I
>>>> do not know what I am missing yet :(
>>>>
>>>>> Is everything around the interrupt subsystem setup correctly ?
>>>>> The `cat /proc/interrupts' tells ...
>>>>>
>>>>> bash# cat /proc/interrupts
>>>>>           CPU396195552
>>>>>  32:     124925      PARISC-CPU  timer
>>>>>  33:      19767      PARISC-CPU  lasi
>>>>>  34:          0      PARISC-CPU  spifi
>>>>>  87:      19767            Lasi  i82596
>>>>>
>>>>> ... which is no surprise ... !
>>>>>
>>>>
>>>> I do not think the fact the interrupt is registered is very
>>>> infomative,
>>>> I think you can register an interrupt for device even if it doesn't
>>>> have
>>>> an real irq assocaitated with it (ie... the serial mux).
>>>>
>>>> Yeah, thanks for looking at it ... we will have to beat on it some
>>>> more
>>>> and see what we can find.  Hopefully the ESIEE guys will be able to
>>>> provide us with some good information!
>>>>
>>>> Thanks
>>>>
>>>> - Ryan
>>>>
>>>>> Till soon,
>>>>> Christoph P.
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> -------------------------------------------------------
>>>>> private:      christoph.plattner@gmx.at
>>>>> company:      christoph.plattner@alcatel.at
>>>>>
>>>>
>>>> _______________________________________________
>>>> parisc-linux mailing list
>>>> parisc-linux@lists.parisc-linux.org
>>>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>>>
>>> --
>>> -------------------------------------------------------
>>> private:      christoph.plattner@gmx.at
>>> company:      christoph.plattner@alcatel.at
>>> _______________________________________________
>>> parisc-linux mailing list
>>> parisc-linux@lists.parisc-linux.org
>>> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
> --=20
> -------------------------------------------------------
> private:	christoph.plattner@gmx.at
> company:	christoph.plattner@alcatel.at
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

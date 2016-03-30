From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: Aw: Re: Re: HP c8000 linux install issues, troubles and questions
Date: Wed, 30 Mar 2016 06:59:42 +0200
Message-ID: <CACrbsaD5qP5e99=47j4E+-vq0V1DKDytqzHVakHeH7DJ_-K+5w@mail.gmail.com>
References: <CACrbsaC7KnupAXvon-PRWTXnAZ13Hb5Xmc3364aVivY4HGCC6Q@mail.gmail.com>
	<4207644.uZSTasQYhb@caliban.sf-tec.de>
	<trinity-a1bc4683-085f-4f5b-870e-03082f9b89ba-1459237701367@3capp-gmx-bs02>
	<CACrbsaC_gOAmUixFoE+rXf-TFT0P6VEEDT-2txig09QgzC6iOQ@mail.gmail.com>
	<trinity-d7ee1960-e99b-416c-bd06-9a3e7bf998bc-1459245685774@3capp-gmx-bs62>
	<56FA7786.6070100@gmx.de>
	<56FA77FB.6090406@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56FA77FB.6090406@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Success !

The key moves were disconnect keyboard and monitor first, connect to
Serial Port A and use the terminal to change default console to serial
port ("path con serial_A" command). With this configuration, all the
communication pass through to the Serial Port A and the Debian
installation runs clean and sweet.
Just to be clear for the next newbie, your Debian 8.0
_needs_internet_connection active to complete the installation The
c8000 built in Ethernet port is automatically configured with DHCP.
Hard disk partioning and formatting is also very smooth if you choose
the "easy" options (full disk,single partition).
As desktop, I choose Mate (I'm a Linux Mint fan).

I have rebooted the c8000 with a full HD monitor, keyboard and mouse
attached. With the serial terminal I have changed default console to
"graph3" (the AGP video card). Booting from the hard disk with Debian
installed open the classic login screen. The full HD monitor was
correctly detected and the resolution was the right one. Synaptic is
installed by defalt, so additional software installation is definetely
not an issue. Who said that Debian was difficult to install and
configure?

Sometime windows dragging and updating looks slow. No 2D acceleration,
frame buffer only? I don't know.

But the good news are not finished: installing "mesa-utils" I have
verified that 3D accelerated OpenGL is active and running (glxinfo is
OK and glxgears runs at 50 fps).

Thanks a lot for your very helpful guide to the installation process:
linux-parisc is one the most "newbie-friendy" mailing list of the
Linux Universe.

If you think useful, I'm available to write or update a wiki page for
Linux on the HP c8000. Otherwise, I will open a dedicated blog and
send you the link.

//**-----------------

Now, I'm fighting with a very hardware issue: the screws of the PA
CPUs are non standard hex with a center pin. I hate this things.
Yesterday evening I was ready to upgrade from a single PA-8800/900 MHz
to a dual PA-8900/1GHz when I have discovered the screw issue. Today,
I'm going to go the Forge and build a "compatible" tool. Just for my
curiosity: "Have you found a compatible tool?".

Next episode: "For a fist of MIPS". "What happen when a quad-core HP
c8000 (2 x PA-8900, 1GHz) meets a quad-core Raspberry PI 3 (ARM
Cortex-A53, 1.2 GHz) ?"

Simone Mannori  - Italy


On 29 March 2016 at 14:41, Helge Deller <deller@gmx.de> wrote:
> On 29.03.2016 14:39, Helge Deller wrote:
>> On 29.03.2016 12:01, Helge Deller wrote:
>>> Here is the manual for the C8000:
>>> https://parisc.wiki.kernel.org/images-parisc/1/18/HP_C8000_Manual.pdf
>>>
>>> This is how you should do it:
>>> 1. Power *off* the C8000 first.
>>> 2. Plug out the graphics cable and keyboard cable.
>>> 3. Power *on* the C8000
>>> 4. It will show POST messages on the serialA, detect that the cables were plugged and present the "Main Menu" on the serial port
>>> (see page 2-4 in the PDF)
>>> 5. With the "PATH" command, you can see the current console/keyboard paths.
>>> 6. Make sure, that the "console path" is not "graphXYZ" and the "keyboard path" is not "USB_XYZ".
>>> Instead run "path console serial0"  (or "path console serialA" - please check!).
>>> 7. After setting the console path to serialA, boot from the CD/DVD.
>>
>> Just for the record - this is what my C8000 shows in the "Main Menu":
>>
>> Duplex Console IO Dependent Code (IODC) revision 1
>> ------------------------------------------------------------------------------
>>    (c) Copyright 1995-2004, Hewlett-Packard Company, All rights reserved
>> ------------------------------------------------------------------------------
>>
>>   Processor   Speed            State           CoProcessor        Cache Size
>>   Number                                       State              Inst    Data
>>   ---------  --------   ---------------------  -----------------  ------------
>>       0       900 MHz   Active                 Functional         32 MB/32 MB
>>       1       900 MHz   Idle                   Functional         32 MB/32 MB
>>
>>   Central Bus Speed (in MHz)  :        200
>>   Available Memory            :    8388608  KB
>>   Good Memory Required        : Not initialized. Defaults to 32 MB.
>>
>>    Primary boot path:    scsiA.5
>>                          0/2/1/0.5
>>    Alternate boot path:  lan.0.0.0.0
>>                          0/3/3/0
>>    Console path:         graph3
>>                          0/4/0/0.0
>>
>>    Current Console path: serial_A.643
>>                          17.643
>>    Keyboard path:        usb0
>>                          0/3/1/0.0
>>    Keyboard path ignored for serial consoles.
>>
>>
>>  WARNING:  No usable graphics console was found on this system.  It
>>            may be that no graphics card is present, the graphics card
>>            is not functioning properly, or no USB keyboard is connected.
>>            The console has defaulted to a serial port.
>>
>>
>> If you choose "serial_A" as console path it should work (I don't use the graphics card either).
>
> By the way, the PALO boot loader will automatically add "console=ttyS0" to the kernel command line in that case.
>
> Helge

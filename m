From: Simone Mannori <simone.mannori@gmail.com>
Subject: Re: Re: Re: Re: HP c8000 linux install issues, troubles and questions
Date: Wed, 30 Mar 2016 15:54:46 +0200
Message-ID: <CACrbsaDLO+BbHNqR2hH18JBxPo64aTW0XzTCOb1JNPc=aVjgtA@mail.gmail.com>
References: <CACrbsaC7KnupAXvon-PRWTXnAZ13Hb5Xmc3364aVivY4HGCC6Q@mail.gmail.com>
	<4207644.uZSTasQYhb@caliban.sf-tec.de>
	<trinity-a1bc4683-085f-4f5b-870e-03082f9b89ba-1459237701367@3capp-gmx-bs02>
	<CACrbsaC_gOAmUixFoE+rXf-TFT0P6VEEDT-2txig09QgzC6iOQ@mail.gmail.com>
	<trinity-d7ee1960-e99b-416c-bd06-9a3e7bf998bc-1459245685774@3capp-gmx-bs62>
	<56FA7786.6070100@gmx.de>
	<56FA77FB.6090406@gmx.de>
	<CACrbsaD5qP5e99=47j4E+-vq0V1DKDytqzHVakHeH7DJ_-K+5w@mail.gmail.com>
	<trinity-13a381d1-e1fb-42af-8cd9-4197fe95fdfd-1459331985395@3capp-gmx-bs41>
	<CAFk90B9NiwRGLpmtvcut6YVOoT8biirAvHO7XEW+mBNnpbtd+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Graham Gower <graham.gower@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAFk90B9NiwRGLpmtvcut6YVOoT8biirAvHO7XEW+mBNnpbtd+w@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Success: confirmed CPU upgrade from 1 to 2 CPUs (four cores) !

A very skilled friend has borrowed the right tools.
Apart some mechanical "delicatessen" the upgrade has been
strightforward and successfull.
HP-UX diagnostic program "SAM" confirms 4 cores.

Now, I'm installing Debian 8.0 again, but on an IDE/PATA 7200 rpm 120G
hard disk: I want to compare the performance respect the 15.000 rpm
SCSI beast used yesterday.

Simone Mannori - Italy






On 30 March 2016 at 12:57, Graham Gower <graham.gower@gmail.com> wrote:
>
>
> On 30 March 2016 at 20:29, Helge Deller <deller@gmx.de> wrote:
>>
>> Hi Simone,
>>
>> > Success !
>>
>> Great!
>>
>> > The key moves were disconnect keyboard and monitor first, connect to
>> > Serial Port A and use the terminal to change default console to serial
>> > port ("path con serial_A" command). With this configuration, all the
>> > communication pass through to the Serial Port A and the Debian
>> > installation runs clean and sweet.
>>
>> Just for the record:
>> The C8000 is the ONLY parisc machine where you have to install debian
>> via serial console. ALL OTHER machines can be installed the usual way
>> with monitor and keyboard.
>>
>> > Just to be clear for the next newbie, your Debian 8.0
>> > _needs_internet_connection active to complete the installation The
>> > c8000 built in Ethernet port is automatically configured with DHCP.
>>
>> Yes, the current install images need network connection.
>> I did something wrong when I created them, but we are planning to build
>> new install images soon which won't require network connection.
>>
>> > Hard disk partioning and formatting is also very smooth if you choose
>> > the "easy" options (full disk,single partition).
>> > As desktop, I choose Mate (I'm a Linux Mint fan).
>> >
>> > I have rebooted the c8000 with a full HD monitor, keyboard and mouse
>> > attached. With the serial terminal I have changed default console to
>> > "graph3" (the AGP video card). Booting from the hard disk with Debian
>> > installed open the classic login screen. The full HD monitor was
>> > correctly detected and the resolution was the right one. Synaptic is
>> > installed by defalt, so additional software installation is definetely
>> > not an issue. Who said that Debian was difficult to install and
>> > configure?
>> >
>> > Sometime windows dragging and updating looks slow. No 2D acceleration,
>> > frame buffer only? I don't know.
>>
>> Yes, currently it's unaccelerated frame buffer only.
>>
>> > But the good news are not finished: installing "mesa-utils" I have
>> > verified that 3D accelerated OpenGL is active and running (glxinfo is
>> > OK and glxgears runs at 50 fps).
>>
>> I'm wondering here. So it seems the ati userspace driver seems to
>> correctly initialize the 3D engine ?
>
>
> I'm pretty sure this is software emulation. Try running 'glxgears -info'.
>
>>
>>
>> > Thanks a lot for your very helpful guide to the installation process:
>> > linux-parisc is one the most "newbie-friendy" mailing list of the
>> > Linux Universe.
>> >
>> > If you think useful, I'm available to write or update a wiki page for
>> > Linux on the HP c8000. Otherwise, I will open a dedicated blog and
>> > send you the link.
>>
>> It would be great if you could write it up in the wiki.
>> Please request an account here:
>> https://parisc.wiki.kernel.org/index.php/Special:RequestAccount
>> I will then give you permissions to our wiki.
>>
>> > //**-----------------
>> >
>> > Now, I'm fighting with a very hardware issue: the screws of the PA
>> > CPUs are non standard hex with a center pin. I hate this things.
>> > Yesterday evening I was ready to upgrade from a single PA-8800/900 MHz
>> > to a dual PA-8900/1GHz
>>
>> I'm not sure if this will simply work. I was looking at the idea myself
>> once, and googling for that it seems that some firmware update needs to
>> be done in order for the machine to accept the additional CPU.
>> If you do it, please let us know...
>
>
> I have done this with success. You can buy the required tools cheaply on
> ebay. You'll need a T15 Security Torx Screwdriver and a *long* 2.5mm allen
> key. The c8000 user manual describes the process.
>
> My understanding is that a motherboard can in principle be locked to
> disallow the addition of a second CPU, which would require some kind of
> unlock code from the vendor. I don't know if any C8000's are locked in
> practice, but none of the three boards I've used were locked (only one board
> had two CPUs to start with).
>
>>
>>
>> > when I have discovered the screw issue. Today,
>> > I'm going to go the Forge and build a "compatible" tool. Just for my
>> > curiosity: "Have you found a compatible tool?".
>> >
>> > Next episode: "For a fist of MIPS". "What happen when a quad-core HP
>> > c8000 (2 x PA-8900, 1GHz) meets a quad-core Raspberry PI 3 (ARM
>> > Cortex-A53, 1.2 GHz) ?"
>> >
>> > Simone Mannori  - Italy
>>
>> Helge
>>
>>
>> >
>> >
>> > On 29 March 2016 at 14:41, Helge Deller <deller@gmx.de> wrote:
>> > > On 29.03.2016 14:39, Helge Deller wrote:
>> > >> On 29.03.2016 12:01, Helge Deller wrote:
>> > >>> Here is the manual for the C8000:
>> > >>>
>> > >>> https://parisc.wiki.kernel.org/images-parisc/1/18/HP_C8000_Manual.pdf
>> > >>>
>> > >>> This is how you should do it:
>> > >>> 1. Power *off* the C8000 first.
>> > >>> 2. Plug out the graphics cable and keyboard cable.
>> > >>> 3. Power *on* the C8000
>> > >>> 4. It will show POST messages on the serialA, detect that the cables
>> > >>> were plugged and present the "Main Menu" on the serial port
>> > >>> (see page 2-4 in the PDF)
>> > >>> 5. With the "PATH" command, you can see the current console/keyboard
>> > >>> paths.
>> > >>> 6. Make sure, that the "console path" is not "graphXYZ" and the
>> > >>> "keyboard path" is not "USB_XYZ".
>> > >>> Instead run "path console serial0"  (or "path console serialA" -
>> > >>> please check!).
>> > >>> 7. After setting the console path to serialA, boot from the CD/DVD.
>> > >>
>> > >> Just for the record - this is what my C8000 shows in the "Main Menu":
>> > >>
>> > >> Duplex Console IO Dependent Code (IODC) revision 1
>> > >>
>> > >> ------------------------------------------------------------------------------
>> > >>    (c) Copyright 1995-2004, Hewlett-Packard Company, All rights
>> > >> reserved
>> > >>
>> > >> ------------------------------------------------------------------------------
>> > >>
>> > >>   Processor   Speed            State           CoProcessor
>> > >> Cache Size
>> > >>   Number                                       State
>> > >> Inst    Data
>> > >>   ---------  --------   ---------------------  -----------------
>> > >> ------------
>> > >>       0       900 MHz   Active                 Functional         32
>> > >> MB/32 MB
>> > >>       1       900 MHz   Idle                   Functional         32
>> > >> MB/32 MB
>> > >>
>> > >>   Central Bus Speed (in MHz)  :        200
>> > >>   Available Memory            :    8388608  KB
>> > >>   Good Memory Required        : Not initialized. Defaults to 32 MB.
>> > >>
>> > >>    Primary boot path:    scsiA.5
>> > >>                          0/2/1/0.5
>> > >>    Alternate boot path:  lan.0.0.0.0
>> > >>                          0/3/3/0
>> > >>    Console path:         graph3
>> > >>                          0/4/0/0.0
>> > >>
>> > >>    Current Console path: serial_A.643
>> > >>                          17.643
>> > >>    Keyboard path:        usb0
>> > >>                          0/3/1/0.0
>> > >>    Keyboard path ignored for serial consoles.
>> > >>
>> > >>
>> > >>  WARNING:  No usable graphics console was found on this system.  It
>> > >>            may be that no graphics card is present, the graphics card
>> > >>            is not functioning properly, or no USB keyboard is
>> > >> connected.
>> > >>            The console has defaulted to a serial port.
>> > >>
>> > >>
>> > >> If you choose "serial_A" as console path it should work (I don't use
>> > >> the graphics card either).
>> > >
>> > > By the way, the PALO boot loader will automatically add
>> > > "console=ttyS0" to the kernel command line in that case.
>> > >
>> > > Helge
>> >
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

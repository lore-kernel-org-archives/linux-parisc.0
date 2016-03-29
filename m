From: Helge Deller <deller@gmx.de>
Subject: Re: Aw: Re: Re: HP c8000 linux install issues, troubles and questions
Date: Tue, 29 Mar 2016 14:39:34 +0200
Message-ID: <56FA7786.6070100@gmx.de>
References: <CACrbsaC7KnupAXvon-PRWTXnAZ13Hb5Xmc3364aVivY4HGCC6Q@mail.gmail.com>
 <4207644.uZSTasQYhb@caliban.sf-tec.de>
 <trinity-a1bc4683-085f-4f5b-870e-03082f9b89ba-1459237701367@3capp-gmx-bs02>
 <CACrbsaC_gOAmUixFoE+rXf-TFT0P6VEEDT-2txig09QgzC6iOQ@mail.gmail.com>
 <trinity-d7ee1960-e99b-416c-bd06-9a3e7bf998bc-1459245685774@3capp-gmx-bs62>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Simone Mannori <simone.mannori@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-d7ee1960-e99b-416c-bd06-9a3e7bf998bc-1459245685774@3capp-gmx-bs62>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 29.03.2016 12:01, Helge Deller wrote:
> Here is the manual for the C8000:
> https://parisc.wiki.kernel.org/images-parisc/1/18/HP_C8000_Manual.pdf
> 
> This is how you should do it:
> 1. Power *off* the C8000 first.
> 2. Plug out the graphics cable and keyboard cable.
> 3. Power *on* the C8000
> 4. It will show POST messages on the serialA, detect that the cables were plugged and present the "Main Menu" on the serial port
> (see page 2-4 in the PDF)
> 5. With the "PATH" command, you can see the current console/keyboard paths.
> 6. Make sure, that the "console path" is not "graphXYZ" and the "keyboard path" is not "USB_XYZ".
> Instead run "path console serial0"  (or "path console serialA" - please check!).
> 7. After setting the console path to serialA, boot from the CD/DVD.

Just for the record - this is what my C8000 shows in the "Main Menu":

Duplex Console IO Dependent Code (IODC) revision 1
------------------------------------------------------------------------------
   (c) Copyright 1995-2004, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor        Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0       900 MHz   Active                 Functional         32 MB/32 MB
      1       900 MHz   Idle                   Functional         32 MB/32 MB

  Central Bus Speed (in MHz)  :        200  
  Available Memory            :    8388608  KB
  Good Memory Required        : Not initialized. Defaults to 32 MB. 

   Primary boot path:    scsiA.5             
                         0/2/1/0.5           
   Alternate boot path:  lan.0.0.0.0
                         0/3/3/0             
   Console path:         graph3
                         0/4/0/0.0           

   Current Console path: serial_A.643        
                         17.643              
   Keyboard path:        usb0
                         0/3/1/0.0           
   Keyboard path ignored for serial consoles.


 WARNING:  No usable graphics console was found on this system.  It
           may be that no graphics card is present, the graphics card
           is not functioning properly, or no USB keyboard is connected.
           The console has defaulted to a serial port.


If you choose "serial_A" as console path it should work (I don't use the graphics card either). 

Helge

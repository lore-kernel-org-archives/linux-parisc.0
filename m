Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA27447
	for <parisc-linux@puffin.external.hp.com>; Wed, 5 Jan 2000 20:20:10 -0700
Message-Id: <200001060322.VAA13456@opus.cirr.com>
From: eric@cirr.com (Eric Schnoebelen)
To: Mark Wild <M_Wild@tunstall.co.uk>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Thanks...alot 
In-reply-to: Your message of "Wed, 05 Jan 2000 09:00:00 GMT."
             <51C39E66FF96D11194FCAA00040003048F3640@tele02.localnet>
Date: Wed, 05 Jan 2000 21:22:43 -0600
Sender: eric@cirr.com
List-ID: <linux-parisc.vger.kernel.org>


Mark Wild writes:
- From: eric@cirr.com [mailto:eric@cirr.com]
- > tom@piace.com writes:
- > - 	Does anyone know if hp has a development version of hpux like
- > - sun has with solaris?  If not does anyone know of a way to reset the
- > - password from the console.
- > 
- > 	Depending upon the OS version and the settings, you
- > should be able to boot the system to single user mode, and reset
- > the password.  I'm a bit out of practice, but if you ``boot
- > isl'', and then enter `/hp-ux -is' (for 9.0x) or `/stand/vmunix
- > -is' (for 10.20), you should be get a single user prompt,
- > without having to enter a password (later OS versions may
- > require the root password to enter single user mode.)
- 
- <snip>
- 
- Being in a similar predicament with a 710 workstation I managed
- to get to the ISL prompt but to boot into single user mode
- I needed to enter 'HPUX -is /hp-ux'. However, after file system
- checking I got a repeated message along the lines of:
- 
- INIT: SINGLE USER MODE
- 
- This just filled up my screen.

	Do you get anything besides the above message??  If not,
I'd suggest that either /bin/sh is missing, or HP-UX doesn't
agree with the hardware about where the console is, and the
shell is always getting an EOF when it tries to read the
console.

	At this point, I'd be more towards a missing shell.

	From your boot command line, it sounds like the box is
running 9.0x.  Is this true?

	FYI: 10.20 may still be available for free under HP's Y2K
upgrade program.  I ordered the 10.20 Y2K OS kit on the 30th.  I
haven't seen it yet, but that's another kettle..  Visit
http://www.hp.com/visualize/programs/y2k/y2k_menu/y2k_upgr/oskit.html
for more details.

- Any suggestions as to what I can do to get root ?

	At this point, you probably need to boot off of the
installation media, and try to replace what appears to be a
missing shell.

--
Eric Schnoebelen		eric@cirr.com		http://www.cirr.com
    Celestial navigation is based on the premise that the Earth is the
    center of the universe.  The premise is wrong, but the navigation
    works.  An incorrect model can be a useful tool. -- Kelvin Throop III

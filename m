Return-Path: <hppa-linux@puffingroup.com>
From: Richard "J." Rauenzahn <rrauenza@cup.hp.com>
Message-Id: <199902180015.QAA02111@hairball.cup.hp.com>
Subject: Re: [hppa-linux] bootstrap test
To: hppa-linux@puffingroup.com
Date: Wed, 17 Feb 1999 16:15:04 -0800 (PST)
Cc: jason@equator.com
In-Reply-To: <199902172309.RAA27695@equator.com> from Jason Eckhardt at Feb "17," 1999 "05:09:13" pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Resent-Message-ID: <"mXUkX1.0.dm6.amros"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


Have you tried it on a DAT?  Try using dd with bs=2k ..

btw, I just tried it on an A180, with no success.  I'll try my C110 when
I can reboot.

Rich

> 2. Write bootstrap.bin to a unused harddisk in raw mode (at the beginning
>    of the media). On my HPUX system, I use
>    "dd if=bootstrap.bin of=/dev/rdsk/c0t5d0" to write the boot image to
>    my scratch disk. (You might also be able to burn a CDROM instead, but
>    I haven't tried it).
>    Be careful and make sure this is a scratch drive -- or at least backup
>    the sectors that will be overwritten (about 40Kbytes) and restore them
>    later! 
> 3. Reboot the system. Stop the autoboot and ask the ROM to boot from
>    the scratch disk (I just set this disk up as the "alternate boot path"
>    and then use "bo alt" at the boot prompt).
> 4. Hopefully you will then see a message "HPPA/Linux Bootstrap" which means
>    it worked. There will also be a line printed "CPU x: (yyyyyyyy)". This
>    is your CPUID.
> 
> Your feedback would be appreciated, i.e. did it work or not on your system.
> Please send the CPU line as well.
> 
> Thanks very much for your time, Jason.

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.

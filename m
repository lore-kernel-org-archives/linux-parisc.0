Return-Path: <hppa-linux@thepuffingroup.com>
Message-Id: <199903030920.KAA29596@be3334.schering.de>
From: "Strelow, Ulrich" <Ulrich.Strelow@Schering.DE>
To: ",'hppa-linux@thepuffingroup.com' " <hppa-linux@thepuffingroup.com>,
        ",Mandachi, Dorin \(Omaha\) " <Dorin.Mandachi@cox.com>
Subject: Betr.: RE: [hppa-linux] Another bootstrap test
Date: Wed, 3 Mar 1999 10:18:00 +0100 
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="---- =_NextPart_000_01BE6557.1254A0AE"
Resent-Message-ID: <"z0n_A3.0.1c3.XyFts"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------ =_NextPart_000_01BE6557.1254A0AE
Content-Type: text/plain

     Hello Dorin,
     
     sorry for the late answer. You have two possiblities to test the 
     bootstrap program on your 712/100:
     
     1. If you have a second disk on that machine, you can follow 
     Jason's original instructions. I have attached them to this mail 
     in case you have not been on the mailing list at that time.
     
     2. The easiest way is to use rbootd. For this test you need a 
     linux-x86 machine connect to the 712/100 via LAN: 
     
     Download rbootd from 
     ftp://sod.res.cmu.edu/pub/parisc/tools/RPMS/rbootd-2.0-2.i386.rpm
     and install with rpm -i rbootd-2.0-2.i386.rpm.
     
     Create directory /export/hp/rbootd/ and copy BOOTSTRA.BIN to this 
     directory as vmlinux.
     
     Edit /etc/rbootd.conf and insert the MAC-address of the ethernet 
     card of your 712/100 in this file. In case you don't know that, 
     you can use HP-UX's landiag(1M).
     
     Start rbootd on the linux-x86 machine.
     
     Reboot the 712/100, stop the automatic boot process, and let the 
     machine search for potential boot devices. You should get at 
     least two possibilities: your hp-ux disk and the lan-boot linux 
     machine. Select the lan-boot machine and the bootstrap test 
     should be loading.
     
     Greetings
     Ulrich
     ---------------------------------------------
     Ulrich Strelow
     <ulrich.strelow@schering.de or
     ulrich_strelow@csi.com>
     Berlin, Germany
     
     
     ____________________________ Antwort-Abtrennung 
     _______________________________
     Betreff: RE: [hppa-linux] Another bootstrap test
Autor:  ,Mandachi, Dorin (Omaha) [SMTP:Dorin.Mandachi@cox.com] bei
BE2183
Datum:    01.03.99 22:26


I apologize for my ignorance, can sbdy give me a few pointers on what I
need 
to do to load the bootstrap on a 712/100 with no floppy?
     
Dorin Mandachi
     
     
     


------ =_NextPart_000_01BE6557.1254A0AE
Content-Type: text/plain;
	name="bootstra.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="bootstra.txt"

Autor:  ,Jason Eckhardt [SMTP:jason@equator.com] bei BE2183
Datum:    18.02.99  00:09
Priorit=E4t: Standard
Blindkopie: Ulrich Strelow bei BE0103_1
An: ,hppa-linux@puffingroup.com [SMTP:hppa-linux@puffingroup.com] bei =
BE2183
An: ,jason@equator.com [SMTP:jason@equator.com] bei BE2183
Betreff: [hppa-linux] bootstrap test
------------------------------- Nachrichteninhalt =
------------------------------
Greetings HPPA hacks:
I have enclosed a simple bootstrap test binary for HPPA/Linux. At this =
point,=20
it is not much more than a "hello world" type program but shows that we
can get a bootstrap going.
I would be grateful if one or two of you would test it on your systems. =
I have=20
tested it on my C160 which is a PA2.0-based system and would like to =
make
sure it works correctly on PA1.1 systems before doing more work.
    =20
Instructions:
1. uudecode the enclosed "bootstrap.bin" binary.
2. Write bootstrap.bin to a unused harddisk in raw mode (at the =
beginning
   of the media). On my HPUX system, I use
   "dd if=3Dbootstrap.bin of=3D/dev/rdsk/c0t5d0" to write the boot =
image to=20
   my scratch disk. (You might also be able to burn a CDROM instead, =
but=20
   I haven't tried it).
   Be careful and make sure this is a scratch drive -- or at least =
backup=20
   the sectors that will be overwritten (about 40Kbytes) and restore =
them=20
   later!
3. Reboot the system. Stop the autoboot and ask the ROM to boot from
   the scratch disk (I just set this disk up as the "alternate boot =
path"=20
   and then use "bo alt" at the boot prompt).
4. Hopefully you will then see a message "HPPA/Linux Bootstrap" which =
means
   it worked. There will also be a line printed "CPU x: (yyyyyyyy)". =
This=20
   is your CPUID.
    =20
Your feedback would be appreciated, i.e. did it work or not on your =
system.=20
Please send the CPU line as well.
    =20
Thanks very much for your time, Jason.
    =20
    =20
    =20
----------------------------------------------------------------------=20
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with=20
`unsubscribe' as the subject.

------ =_NextPart_000_01BE6557.1254A0AE--

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
